-- ����Ի�
CurStation = 1;
Include("\\script\\global\\station.lua")
IncludeLib("BATTLE");

function main(sel)
	BT_LeaveBattle()
	SetCurCamp(GetCamp())
	SetFightState(0)
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"���߹��ĵط�/WayPointFun", 
					"���߹��ĳ���/StationFun", 
					"����֮ǰ�ĵط�/TownPortalFun"};
--	if (mapid == 325) then
		tinsert(tbOpp, format("���η�������(T)/#battle_transprot(1,%d)", mapid));
--	end;
	tinsert(tbOpp, "����Ҫ/OnCancel");
	Say("����ս������������������Լ�������׬Ǯ���빱�׼�������!", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;
function battle_transprot(nSel, mapid)
	local tbsongjin_pos = {1541, 3178};	--�η������
	local szstr = "��(T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "�η�(K)";
	end;
	if (mapid >= 323 and mapid <= 325) then
		NewWorld( mapid, tbsongjin_pos[1], tbsongjin_pos[2]);
		Msg2Player( "�ѵ�������" );
	end
end;
