-- Created by firefox
-- ���⿨
-- �����Լ��༭ף��
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
	AskClientForString("BlessPlayer", "", 1, 100, "������ף����");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("�Բ���������������ֺ��зǷ����ʣ�������һ�Ρ�", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("�Բ���������������ֺ��зǷ����ʣ�������һ�Ρ�", 0)
			return
		end
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg
		szMsg = GetName().."<#>��"..GetStringTask(STSK_OTHERNAME).."<#>˵��"..szBless
		AddGlobalCountNews(szMsg,3);
	else
		Msg2Player("�Ҳ�����Ƭ��������һ�Ρ�")
	end
end

