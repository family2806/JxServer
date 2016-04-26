-- Created by firefox
-- 如意卡
-- 可以自己编辑祝福
IL("SETTING")
IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=1016
STSK_OTHERNAME = 3
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
function main(nIndex)
	if (gb_GetModule("彩色公告贺卡") == 1) then
		Say("这是一张幻彩贺卡，可以将您的祝福以彩色文字发送出去。请先输入您要祝福对象的名字，然后选择祝福语的颜色，再输入您要祝福的话，就可以送出您的祝福。", 
			2, 
			"现在开始祝福/want2bless",
			"稍后再送/OnCancel")
	end
	return 1
end

function want2bless(nIndex)
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
	AskClientForString("BlessPlayer", "", 1, 100, "请输入祝福语");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("对不起，您所输入的名字含有非法单词，请重试一次。", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("对不起，您所输入的名字含有非法单词，请重试一次。", 0)
			return
		end
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg
		szMsg = GetName().."<#>对"..GetStringTask(STSK_OTHERNAME).."<#>说："..szBless
		AddGlobalCountNews(szMsg,3);
	else
		Msg2Player("找不到卡片，请重试一次。")
	end
end

