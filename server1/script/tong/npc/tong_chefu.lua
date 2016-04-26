--	帮会车夫脚本
--	lixin 2005-12-27
Include("\\script\\global\\station.lua")
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main()
	local tabContent = {"走过的地方/WayPointFun", "走过的城市/want2station"};
	if (GetMapType(SubWorld) == 1 and GetTask(TASK_LP_COUNT) ~= 0)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				tinsert(tabContent, "贵帮已打开帮会禁地，麻烦帮传达"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."坊总管帮我/chuanhua");
			end
		end
	end

	tinsert(tabContent, "哪里都不想去!/OnCancel");
	Say("<#>车夫：大侠想去哪里?", getn(tabContent), tabContent)
	
end;

function chuanhua()
	Say("本帮"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."总管正忙，所以嘱咐我传话给你，你想问什么?", 2, "问信息/#rwlp_dedaojianshu(1, 1)", "离开/OnCancel")
end;

function want2station()
	Say("<#>大侠想去哪: ",8, "凤翔 [800 两]/#wlls_want2go(1)", "成都 [800 两]/#wlls_want2go(11)", "大理 [800 两]/#wlls_want2go(162)", "汴京[800 两]/#wlls_want2go(37)", "襄阳 [800 两]/#wlls_want2go(78)", "扬州 [800 两]/#wlls_want2go(80)", "临安 [800 两]/#wlls_want2go(176)", "哪里都不想去!/OnCancel")
end

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "凤翔府" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "成都府 " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "汴京府" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "襄阳府" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "扬州府" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "大理府" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "临安府" }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	if(GetCash() < 800) then
		Say("车夫: 从帮会到各大城市需要800 两, 没有带路费吗?",0)
	else
		local count = getn(tbCP_STATION[stationname]) - 1
		local randnum = random(count)
		Msg2Player("坐好了吗？我们走。 "..tbCP_STATION[stationname][count+1])
		NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
		SetFightState(0)
		SetPunish(1)
		DisabledUseTownP(0)
		SetRevPos(GetPlayerRev())
		Pay(800)
	end
end
