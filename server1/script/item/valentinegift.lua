--情人节礼盒
--2006年2月14日~2006年2月21日 50级及以上 冲值玩家可以获得
--侠士只能给侠女赠送“情浓玫瑰花”
--侠女只能给侠士赠送“心意巧克力”
--以变量来计
--并滚动公告祝福语
IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1058
STSK_OTHERNAME = 4
TEMPSK_MAPID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}

Bless=
{
	"<#>春风如梦，风过无痕，只为心的思念，遥寄一份浓浓的祝福。",
	"<#>无论未来的路我们能否一起走完，但我会一直爱你直到生命结束。",
	"<#>空白的日子有你来填满，无论平静还是灿烂，我都喜欢。",
	"<#>人生的旅途有你来做伴，不管坎坷亦或平坦，我都情愿。",
	"<#>结发为夫妻，恩爱两不疑。欢娱在今夕，燕婉及良时。",
	"<#>祝情人节快乐！愿情人和快乐永远伴随你身边！！！",
	--"<#>让云捎去满心的祝福，点缀你甜蜜的梦，愿你拥有一个幸福快乐的新年！",
}

function main()
if (gb_GetModule("情人节礼盒") == 1) then
	if (GetSex() == 0) then	--男
		Say("<#>    使用“情人节礼盒”可以送给您中意的<color=yellow>她<color>一朵<color=yellow>“情浓玫瑰花”<color>并送上您的祝福。", 2, "<#>赠送玫瑰花/want2present", "<#>取消/OnCancel")
	elseif (GetSex() == 1) then	--女
		Say("<#>    使用“情人节礼盒”可以送给您中意的<color=yellow>他<color>一块<color=yellow>“心意巧克力”<color>并送上您的祝福。", 2, "<#>赠送巧克力/want2present", "<#>取消/OnCancel")
	end
end
	return 1
end

function want2present()
	AskClientForString("PlayerSelect", "", 1, 16, "请输入对方名字");
end

function PlayerSelect(rolename)
	if (ST_CheckTextFilter(rolename) ~= 1) then
		Say("对不起，您所输入的名字含有非法单词，请重试一次。", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(rolename, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("对不起，您所输入的名字含有非法单词，请重试一次。", 0)
			return
		end
	end
	
	SetStringTask(STSK_OTHERNAME,rolename)
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (nSex == GetSex()) then
		if (nSex == 0) then
			Say("<#>“情浓玫瑰花”只能送给侠女哦！", 0)
		elseif (nSex == 1) then
			Say("<#>“心意巧克力”只能送给侠士哦！", 0)
		end
		return
	end
	SetTaskTemp(TEMPSK_MAPID, nSubWorldID)
	Say("<#>请输入您的祝福语，或者选择预设祝福语：", 3, "输入祝福语/inputmsg", "选择预设祝福语/selectmsg", "取消/OnCancel")
end

function inputmsg()
	AskClientForString("BlessPlayer", "", 1, 100, "请输入祝福语");
end

function selectmsg()
	local tbOpp = {}
	for  i = 1, getn(Bless) do
		tbOpp[i] = Bless[i].."/BlessPlayer"
	end
	tbOpp[getn(tbOpp) + 1] = "取消/OnCancel"
	Say("<#>请选择祝福语：", getn(tbOpp), tbOpp)
end

function BlessPlayer(szBless)
	if (type(szBless) == "number") then
		szBless = Bless[szBless + 1]
	end
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("对不起，您的祝福语中含有非法单词，请重试一次。", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("对不起，您所输入的名字含有非法单词，请重试一次。", 0)
			return
		end
	end
	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetTaskTemp(TEMPSK_MAPID) == 0) then
		return
	end
	
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = GetName().." <#>对 "..GetStringTask(STSK_OTHERNAME).." <#>说："..szBless
		AddGlobalNews(szMsg)
		local szParam = GetStringTask(STSK_OTHERNAME).." "..GetTaskTemp(TEMPSK_MAPID).." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "valentine_bless_anywhere", szParam, "", "")
	else
		Say("<#>找不到情人节礼盒，请重试一次。", 0)
	end
end

function BlessPlayerOffline(TargetName)
	Say("<#>对不起，"..TargetName.."目前不在，无法得知他（她）的下落。",0)
end

function OnCancel()
end