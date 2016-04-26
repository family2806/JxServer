CP_MAPTAB = {
				{396, 397, "少林 "},
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
CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023
CP_BEGIN_HOUR = 20
CP_END_HOUR = 23



function CP_CheckOpenTime()
	if (tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT and tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		if(tonumber(date("%H")) >= CP_BEGIN_HOUR and tonumber(date("%H")) < CP_END_HOUR) then
			orgworld = SubWorld
			for i = 1, getn(CP_MAPTAB) do
				mapid = CP_MAPTAB[i][1]
				mapindex = SubWorldID2Idx(mapid)
				if (mapindex < 0) then
					print("ANNOUNCE: 武林大会会场"..CP_MAPTAB[i][3].."不在服务器上, ", mapid);
				else
					SubWorld = mapindex
					if(GetMissionV(MS_STATE) == 0) then
						OpenMission(MISSIONID)
						str = date( "%m月%d日" ).."属于武林"..CP_MAPTAB[ i ][ 3 ].."武林新秀联赛已经开始，玩家想报名参加比赛请到临安与武林新秀联赛官员(182, 202)处报名。报名条件：等级从50到89级，参加比赛次数少于40次."
			WriteLog(date( "%Y年%m月%d日%H时M分:" ).."武林 "..CP_MAPTAB[ i ][ 3 ].."预选门派比赛已经开始!" )
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
