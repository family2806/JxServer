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
	str = "����ɴ�׼���𺽣��쵽������ϰ����򴦽���������ƻ���200�����ؾ���Ǽ�!"
	AddGlobalCountNews(str, 3)
	SetMissionV(MS_STATE, 3)
	SubWorld = orgworld
end
