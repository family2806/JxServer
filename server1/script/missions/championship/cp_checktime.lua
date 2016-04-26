CP_MAPTAB = {
				{396, 397, "少林"},
				{398, 399, "天王"},
				{400, 401, "唐门"},
			 	{402, 403, "五毒"},
			 	{404, 405, "峨眉"},
			 	{406, 407, "翠烟"},
			 	{408, 409, "丐帮"},
			 	{410, 411, "天忍"},
			 	{412, 413, "武当"},
			 	{414, 415, "昆仑"}
			 }
MISSIONID = 18;
MS_STATE = 1; --任务中记录任务状态的变量ID
MS_ROUND = 4	--记录当天赛事的轮次
CP_UPTO_TRYOUT = 5051620
CP_END_TRYOUT = 5052224
CP_BEGIN_HOUR = 20
CP_END_HOUR = 24



function CP_CheckOpenTime()
	if (tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT and tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		if(tonumber(date("%H")) >= CP_BEGIN_HOUR and tonumber(date("%H")) < CP_END_HOUR) then
			orgworld = SubWorld
			for i = 1, getn(CP_MAPTAB) do
				mapid = CP_MAPTAB[i][1]
				mapindex = SubWorldID2Idx(mapid)
				if (mapindex < 0) then
					print("ANNOUNCE: 武林大会会场"..CP_MAPTAB[i][3].."不在sever, ", mapid);
				else
					SubWorld = mapindex
					if(GetMissionV(MS_STATE) == 0) then
						OpenMission(MISSIONID)
						str = date("%m月g%d日").."武林大会"..CP_MAPTAB[i][3].."门派预选比赛开始了, 请到位于临安的武林大会会场报名比赛. 报名条件: 90级以上, 至少参加20次. 首次报名要交10万两."
						WriteLog(date("%Y年%m月g%d日%时%M分:").."武林大会"..CP_MAPTAB[i][3].."门派预选比赛已经开始!")
						AddGlobalCountNews(str, 1)
						SetMissionV(MS_STATE, 1)
						SetMissionV(MS_ROUND, 1)						
					end
				end
			end
			SubWorld = orgworld
		end
	end
end