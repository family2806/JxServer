--����ս ����Ի�
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	SetCurCamp(GetCamp())
	SetFightState(0)
	BT_LeaveBattle()
	Say("����ս���ϵĳ���������������Լ�������׬Ǯ�����һЩ����!", 5, "��Щ�ط��Ѿ�ȥ��/WayPointFun", "��Щ�����Ѿ�ȥ��/StationFun", "�ص�ԭ��/TownPortalFun","�뿪ս�� /LeaveChefu","����Ҫ/OnCancel");
end;

function OnCancel()
end;

function LeaveChefu()
	w,x,y = RevID2WXY(GetPlayerRev());
	NewWorld(w,x/32, y/32);
end;