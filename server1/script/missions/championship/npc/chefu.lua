-- 武林大会车夫
-- 2005-4-11 lixin 

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	DisabledUseTownP(0)	--恢复其使用回城符
	CityStationCommon("<#>欢迎各位参加武林新秀联赛联赛，我是此次比赛的专门车夫-临安车夫。如果要坐车就请说!");
end;
