IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

COLOR_BLESS = {
	{"����ɫ","color=White"},	--��ɫ
	{"�޺�ɫ","color=Red"},		--��ɫ
	{"����ɫ","color=Green"},	--��ɫ
	{"����ɫ","color=Water"},		--��ɫ
	{"���ɫ","color=Orange"},	--��Gold
	{"�Ⱥ�ɫ","color=0xff5040"},	--��ɫ
	{"�Ϻ�ɫ","color=Pink"},		--�Ϻ�
	{"���ɫ","color=Violet"},	--��
	{"����ɫ","bclr=Red><color=Yellow"},		--����ɫ
	{"����ɫ","bclr=Blue><color=White"},		--����ɫ
	{"���Һ�ɫ","bclr=Pink><color=Yellow"},	--���Һ�
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
	if (gb_GetModule("��ɫ����ؿ�") == 1) then
		Say("����һ�Żòʺؿ������Խ�����ף���Բ�ɫ���ַ��ͳ�ȥ������������Ҫף����������֣�Ȼ��ѡ��ף�������ɫ����������Ҫף���Ļ����Ϳ����ͳ�����ף����", 
			2, 
			"���ڿ�ʼף��/want2bless",
			"�Ժ�����/OnCancel")
	end
	return 1
end
function want2bless(nIndex)
	AskClientForString("PlayerSelect", "", 1, 16, "������Է�����");
end

function PlayerSelect(rolename)
	if (ST_CheckTextFilter(rolename) ~= 1) then
		Say("�Բ���������������ֺ��зǷ����ʣ�������һ�Ρ�", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(rolename, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("�Բ���������������ֺ��зǷ����ʣ�������һ�Ρ�", 0)
			return
		end
	end
	
	SetStringTask(STSK_OTHERNAME,rolename)
	local tbOpp = {}
	for i = 1, getn(COLOR_BLESS) do
		tbOpp[i] = COLOR_BLESS[i][1].."/ColorSelect"
	end
	tbOpp[ getn(tbOpp) + 1 ] = "ȡ��/OnCancel"
	Say("��ѡ��ף�������ɫ��", getn(tbOpp), tbOpp )
end

function ColorSelect(nSel)
	local stcolor = nSel + 1
	SetStringTask(STST_COLOR,COLOR_BLESS[stcolor][2])
	AskClientForString("BlessPlayer", "", 1, 100, "������ף����");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("�Բ�������ף�����к��зǷ����ʣ�������һ�Ρ�", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("�Բ���������������ֺ��зǷ����ʣ�������һ�Ρ�", 0)
			return
		end
	end

	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetStringTask(STST_COLOR) == nil or GetStringTask(STST_COLOR) == "") then
		return
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = "<color=yellow>"..GetName().."<color><#>��<color=yellow>"..GetStringTask(STSK_OTHERNAME).."<color><#>˵��<"..GetStringTask(STST_COLOR)..">"..szBless
		--AddGlobalCountNews(szMsg,2);
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
	else
		Say("�Ҳ�����Ƭ��������һ�Ρ�", 0)
	end
end

function OnCancel()
end