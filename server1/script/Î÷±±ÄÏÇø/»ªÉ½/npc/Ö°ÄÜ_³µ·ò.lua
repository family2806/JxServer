--华山　职能　车夫
-- by：Dan_Deng(2003-09-16)

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	Say("比赛结束了？要我拉你回去吗?", 4, "经过的地方/WayPointFun", "经过的城市/StationFun","返回原点/TownPortalFun", "不需要/OnCancel")
end;

function  OnCancel()
   Talk(1,"","有钱就回来")
end;
