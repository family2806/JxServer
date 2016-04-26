Include( "\\script\\missions\\leaguematch\\head.lua" )

function main(sel)
--	DisabledUseTownP(0)	--恢复其使用回城符
	Say("<#> 车夫：欢迎各位来参加武林联赛，我是本场联赛的车夫，客官想坐车，请吩咐",
		8, "凤翔府/#wlls_want2go(1)", "成都府/#wlls_want2go(11)", "大理/#wlls_want2go(162)", "汴京府/#wlls_want2go(37)", "襄阳府/#wlls_want2go(78)", "扬州府/#wlls_want2go(80)", "临安府/#wlls_want2go(176)", "哪都不去!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "凤翔府 " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "成都府" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "汴京府" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "襄阳府" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "扬州府" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "大理府" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "临安府" }
}

function wlls_want2go(stationname)
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("<#> 车夫：你的队正在联赛？如果现在离开将不能获得奖励，你确定想离开吗?",
			2, "对!/#cp_station("..stationname..")", "不用!/OnCancel")
	else
		cp_station(stationname)
	end
end

function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("坐好了吗？我们走 "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end
