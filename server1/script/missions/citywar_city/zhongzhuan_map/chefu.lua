--攻城战 车夫对话
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	SetCurCamp(GetCamp())
	SetFightState(0)
	BT_LeaveBattle()
	Say("我们战场上的车夫出生入死，用自己的生命赚钱！请给一些银两!", 5, "那些地方已经去过/WayPointFun", "那些城市已经去过/StationFun", "回到原地/TownPortalFun","离开战场 /LeaveChefu","不需要/OnCancel");
end;

function OnCancel()
end;

function LeaveChefu()
	w,x,y = RevID2WXY(GetPlayerRev());
	NewWorld(w,x/32, y/32);
end;