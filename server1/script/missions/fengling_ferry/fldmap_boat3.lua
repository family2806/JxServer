Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
function main()
	mapid = boatMAPS[3]
	orgworld = SubWorld
	boatidx = SubWorldID2Idx(mapid)
	if (boatidx < 0) then
		local SignMapId = SubWorldIdx2ID(SubWorld);
		print("ERROR !!!BoatMap3 Is Not In This Server!", mapid); 
		return
	end
	SubWorld = boatidx
	OpenMission(MISSIONID)
	str = "风陵渡船准备起航，快到风陵渡南岸船夫处交风陵渡令牌或者200张神秘卷轴登记!"
	AddGlobalCountNews(str, 3)
	SetMissionV(MS_STATE, 3)
	SubWorld = orgworld
end
