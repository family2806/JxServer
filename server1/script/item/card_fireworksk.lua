IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1054
function main()
	if (gb_GetModule("�̻�ף��") == 1) then
		Say("�����̻��ؿ���������Ҫף��������Χȼ���̻���", 2, "���ڽ���ף��/want2fireworks", "ȡ��/OnCancel")
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
	Say("�Բ���"..TargetName.."Ŀǰ���ڣ��޷���֪�������䡣",0)
end;

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local nposx = nPosX * 32
		local nposy = nPosY * 32
		local szParam = TargetName.." "..nSubWorldID.." "..nPosX.." "..nPosY.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "fireworks_bless_anywhere", szParam, "", "")
		Msg2Player("����ף���ѳɹ��ͳ���")
	else
		Say("�Ҳ�����Ƭ��������һ�Ρ�", 0)
	end
end

