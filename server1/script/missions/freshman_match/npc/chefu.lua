-- 武林大会车夫
-- 2005-4-11 lixin 

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	DisabledUseTownP(0)	--恢复其使用回城符
	CityStationCommon("<#>欢迎各位参加武林新秀联赛，我是本场比赛的独权车夫-临安车夫。想坐车就说哦!");
end;
