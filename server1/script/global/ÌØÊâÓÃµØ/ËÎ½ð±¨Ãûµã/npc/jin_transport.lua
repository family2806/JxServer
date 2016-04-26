-- 车夫对话
CurStation = 1;
Include("\\script\\global\\station.lua")
IncludeLib("BATTLE");

function main(sel)
	BT_LeaveBattle()
	SetCurCamp(GetCamp())
	SetFightState(0)
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"已走过的地方/WayPointFun", 
					"已走过的城市/StationFun", 
					"返回之前的地方/TownPortalFun"};
--	if (mapid == 325) then
		tinsert(tbOpp, format("到宋方报名点(T)/#battle_transprot(1,%d)", mapid));
--	end;
	tinsert(tbOpp, "不需要/OnCancel");
	Say("我们战场车夫出生入死，以自己的生命赚钱！请贡献几个银两!", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;
function battle_transprot(nSel, mapid)
	local tbsongjin_pos = {1541, 3178};	--宋方坐标点
	local szstr = "金方(T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "宋方(K)";
	end;
	if (mapid >= 323 and mapid <= 325) then
		NewWorld( mapid, tbsongjin_pos[1], tbsongjin_pos[2]);
		Msg2Player( "已到报名点" );
	end
end;
