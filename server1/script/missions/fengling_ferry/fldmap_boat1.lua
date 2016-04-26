Include("\\script\\missions\\fengling_ferry\\fld_head.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

function fenglingdu_main()
	orgworld = SubWorld
	for i = 1, getn( boatMAPS ) do
		mapid = boatMAPS[ i ]

		boatidx = SubWorldID2Idx(mapid)
		if (boatidx < 0) then
			local SignMapId = SubWorldIdx2ID(SubWorld);
			print("ERROR !!!BoatMap1 Is Not In This Server!", mapid); 
			SubWorld = orgworld;
			return
		end
		SubWorld = boatidx
		CloseMission(MISSIONID);
		OpenMission(MISSIONID)
		SetMissionV(MS_STATE, 1)
	end
	SubWorld = orgworld
	str = "风陵渡船准备起航，快到风陵渡南岸船夫处交风陵渡令牌或者200张神秘卷轴登记!"
	AddGlobalCountNews(str, 3)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));		-- by bel 开船前10分钟发出消灭水贼活动的公告
	if (nDate >= jf0904_act_dateS and nDate < jf0904_act_dateE) then
		local szNews = "还有10分钟，官府将发动消灭水贼的战役，各位高手请准备";
		AddGlobalNews(szNews);
	end
end