--���˽����
--2006��2��14��~2006��2��21�� 50�������� ��ֵ��ҿ��Ի��
--��ʿֻ�ܸ���Ů���͡���Ũõ�廨��
--��Ůֻ�ܸ���ʿ���͡������ɿ�����
--�Ա�������
--����������ף����
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
	"<#>�������Σ�����޺ۣ�ֻΪ�ĵ�˼�ң��һ��ŨŨ��ף����",
	"<#>����δ����·�����ܷ�һ�����꣬���һ�һֱ����ֱ������������",
	"<#>�հ׵���������������������ƽ�����ǲ��ã��Ҷ�ϲ����",
	"<#>��������;���������飬���ܿ������ƽ̹���Ҷ���Ը��",
	"<#>�ᷢΪ���ޣ����������ɡ������ڽ�Ϧ��������ʱ��",
	"<#>ף���˽ڿ��֣�Ը���˺Ϳ�����Զ��������ߣ�����",
	--"<#>������ȥ���ĵ�ף������׺�����۵��Σ�Ը��ӵ��һ���Ҹ����ֵ����꣡",
}

function main()
if (gb_GetModule("���˽����") == 1) then
	if (GetSex() == 0) then	--��
		Say("<#>    ʹ�á����˽���С������͸��������<color=yellow>��<color>һ��<color=yellow>����Ũõ�廨��<color>����������ף����", 2, "<#>����õ�廨/want2present", "<#>ȡ��/OnCancel")
	elseif (GetSex() == 1) then	--Ů
		Say("<#>    ʹ�á����˽���С������͸��������<color=yellow>��<color>һ��<color=yellow>�������ɿ�����<color>����������ף����", 2, "<#>�����ɿ���/want2present", "<#>ȡ��/OnCancel")
	end
end
	return 1
end

function want2present()
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
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (nSex == GetSex()) then
		if (nSex == 0) then
			Say("<#>����Ũõ�廨��ֻ���͸���ŮŶ��", 0)
		elseif (nSex == 1) then
			Say("<#>�������ɿ�����ֻ���͸���ʿŶ��", 0)
		end
		return
	end
	SetTaskTemp(TEMPSK_MAPID, nSubWorldID)
	Say("<#>����������ף�������ѡ��Ԥ��ף���", 3, "����ף����/inputmsg", "ѡ��Ԥ��ף����/selectmsg", "ȡ��/OnCancel")
end

function inputmsg()
	AskClientForString("BlessPlayer", "", 1, 100, "������ף����");
end

function selectmsg()
	local tbOpp = {}
	for  i = 1, getn(Bless) do
		tbOpp[i] = Bless[i].."/BlessPlayer"
	end
	tbOpp[getn(tbOpp) + 1] = "ȡ��/OnCancel"
	Say("<#>��ѡ��ף���", getn(tbOpp), tbOpp)
end

function BlessPlayer(szBless)
	if (type(szBless) == "number") then
		szBless = Bless[szBless + 1]
	end
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
	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetTaskTemp(TEMPSK_MAPID) == 0) then
		return
	end
	
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = GetName().." <#>�� "..GetStringTask(STSK_OTHERNAME).." <#>˵��"..szBless
		AddGlobalNews(szMsg)
		local szParam = GetStringTask(STSK_OTHERNAME).." "..GetTaskTemp(TEMPSK_MAPID).." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "valentine_bless_anywhere", szParam, "", "")
	else
		Say("<#>�Ҳ������˽���У�������һ�Ρ�", 0)
	end
end

function BlessPlayerOffline(TargetName)
	Say("<#>�Բ���"..TargetName.."Ŀǰ���ڣ��޷���֪�������������䡣",0)
end

function OnCancel()
end