IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 2621
function main()
	if (gb_GetModule("��Ե�̻�") == 1) then
		Say("�úؿ�����������ף��������Χ��ѩ��.", 2, "��ʼף��/want2fireworks", "����/OnCancel")
	end
	return 1
end

function OnCancel()
end

function want2fireworks()
	AskClientForString("PlayerSelect", "", 1, 16, "������Է�����");
end

function PlayerSelect(rolename)
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOffline(TargetName)
	Say("�Բ���! "..TargetName.."Ŀǰû������.",0)
end;

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local nposx = nPosX * 32
		local nposy = nPosY * 32
		local szParam = TargetName.." "..nSubWorldID.." "..nPosX.." "..nPosY.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "xuehua_bless_anywhere", szParam, "", "")
		Msg2Player("����ף�����Ѿ����ͳɹ�!")
	else
		Say("�Ҳ�������������һ��!.", 0)
	end
end

