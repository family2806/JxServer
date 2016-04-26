-- 车夫对话
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"已路过的地方/WayPointFun", "已路过的城区/StationFun", };

	tinsert(tbOpp, "不需要/OnCancel");
	Say("车夫: 想到哪里?", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;

