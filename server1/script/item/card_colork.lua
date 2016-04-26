IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

COLOR_BLESS = {
	{"纯白色","color=White"},	--白色
	{"艳红色","color=Red"},		--红色
	{"草绿色","color=Green"},	--绿色
	{"湖蓝色","color=Water"},		--蓝色
	{"金黄色","color=Orange"},	--金Gold
	{"橙红色","color=0xff5040"},	--橙色
	{"紫红色","color=Pink"},		--紫红
	{"绛紫色","color=Violet"},	--紫
	{"亮红色","bclr=Red><color=Yellow"},		--亮红色
	{"亮蓝色","bclr=Blue><color=White"},		--亮蓝色
	{"亮桃红色","bclr=Pink><color=Yellow"},	--亮桃红
}

TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}

STSK_OTHERNAME = 1
STST_COLOR = 2
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1053

function main()
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
	local tbOpp = {}
	for i = 1, getn(COLOR_BLESS) do
		tbOpp[i] = COLOR_BLESS[i][1].."/ColorSelect"
	end
	tbOpp[ getn(tbOpp) + 1 ] = "取消/OnCancel"
	Say("请选择祝福语的颜色：", getn(tbOpp), tbOpp )
end

function ColorSelect(nSel)
	local stcolor = nSel + 1
	SetStringTask(STST_COLOR,COLOR_BLESS[stcolor][2])
	AskClientForString("BlessPlayer", "", 1, 100, "请输入祝福语");
end

function BlessPlayer(szBless)
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

	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetStringTask(STST_COLOR) == nil or GetStringTask(STST_COLOR) == "") then
		return
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = "<color=yellow>"..GetName().."<color><#>对<color=yellow>"..GetStringTask(STSK_OTHERNAME).."<color><#>说：<"..GetStringTask(STST_COLOR)..">"..szBless
		--AddGlobalCountNews(szMsg,2);
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
	else
		Say("找不到卡片，请重试一次。", 0)
	end
end

function OnCancel()
end