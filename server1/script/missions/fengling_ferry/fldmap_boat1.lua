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
	str = "����ɴ�׼���𺽣��쵽������ϰ����򴦽���������ƻ���200�����ؾ���Ǽ�!"
	AddGlobalCountNews(str, 3)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));		-- by bel ����ǰ10���ӷ�������ˮ����Ĺ���
	if (nDate >= jf0904_act_dateS and nDate < jf0904_act_dateE) then
		local szNews = "����10���ӣ��ٸ�����������ˮ����ս�ۣ���λ������׼��";
		AddGlobalNews(szNews);
	end
end