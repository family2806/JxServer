
function main(sel)
--	DisabledUseTownP(0)	--恢复其使用回城符
	Say("我们战场上的车夫，出生入死，以生命来赚钱，请支持几个银两吧!",
		8, "凤翔府/#cp_station(1)", "成都府 /#cp_station(11)", "大理 #cp_station(162)", "汴京府/#cp_station(37)", "襄阳府/#cp_station(78)", "扬州府/#cp_station(80)", "临安府/#cp_station(176)", "哪里都不想去!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "凤翔府" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "成都府" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "汴京府" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "襄阳府" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "扬州府" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "大理府" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "临安府" }
}


function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	SetLogoutRV(0)
	Msg2Player("坐稳了吗？我们走。"..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end

function OnCancel()
end