Include("\\script\\missions\\championship\\tryout\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV(MS_TIME_1) + 1
	SetMissionV(MS_TIME_1, timer_1)
	
	if (mod(timer_1, 3) == 0 ) then
		SetMissionV(MS_A_TIME, GetMissionV(MS_A_TIME) + 1)
		if (GetMissionV(MS_A_TIME) < RUN_A_TIME) then
			local mm = RUN_A_TIME - GetMissionV(MS_A_TIME)
			Msg2MSAll(MISSIONID, "报名时间还有"..mm.."分")
		elseif (GetMissionV(MS_A_TIME) > RUN_A_TIME) then
			local mm = UP_A_TIME - GetMissionV(MS_A_TIME)
			Msg2MSAll(MISSIONID, "这局比赛结束时间还有"..mm.."分")
		end
	end
	
	if (mod(timer_1, 3) == 0 ) then
		if (GetMissionV(MS_A_TIME) == RUN_A_TIME) then
			org_mapid = SubWorldIdx2ID(SubWorld)
			new_mapid = org_mapid + 1
			if (SubWorldID2Idx( new_mapid ) < 0) then
				print("ERROR: 此区域中没有门派比赛!!!!MAPID = "..new_mapid)
				return
			end
			SetMissionV(MS_STATE, 2)
			if ( org_mapid == 400 or org_mapid == 402 or org_mapid == 414) then	--如果为唐门、五毒、昆仑则为4人就开赛
				if (GetMSPlayerCount(MISSIONID, 0) < CP_PLNUM_LIMT_ESPECIAL) then
					Msg2MSAll(MISSIONID, "比赛时间已到，由于此次比赛人数不够"..CP_PLNUM_LIMT_ESPECIAL.."人，暂停比赛1次")
					WriteLog(date("%Y-%m-%d,%H:%M,").."排名"..GetMissionV(MS_ROUND).."此次参加预选赛的人数不足"..CP_PLNUM_LIMT_ESPECIAL..",暂停一次. 门派= "..checkmap(1))
					return
				end
			else
				if (GetMSPlayerCount(MISSIONID, 0) < CP_PLNUM_LIMT) then
					Msg2MSAll(MISSIONID, "比赛时间已到，由于此次比赛人数不够"..CP_PLNUM_LIMT.."人, 停赛一次.")
					WriteLog(date("%Y-%m-%d,%H:%M,").."排名"..GetMissionV(MS_ROUND).."这次的预选赛人数不够"..CP_PLNUM_LIMT..",暂停一次. 门派= "..checkmap(1))
					return
				end
			end
			Msg2MSAll(MISSIONID, "比赛时间到了，所有选手入场")
			round = GetMissionV(MS_ROUND)
			SubWorld = SubWorldID2Idx(new_mapid)
			OpenMission(MATCH_MS_ID)
			SetMissionV(3, round)
			SubWorld = SubWorldID2Idx(org_mapid)
			join_match()
			return
		end
	end
	if (GetMissionV(MS_A_TIME) == 0) then
		return
	end
	if (mod(timer_1, 3) ==0 ) then
		if (GetMissionV(MS_ROUND) >= CP_ONEDAY_MAXROUND) then
			return
		end
		if (mod(GetMissionV(MS_A_TIME), UP_A_TIME) == 0) then
			resultstr = "排名"..GetMissionV(MS_ROUND)..""..checkmap(1).."门派预选赛刚结束。新一轮的比赛已开始报名了."
			AddGlobalNews(resultstr) 
			SetMissionV(MS_ROUND, GetMissionV(MS_ROUND) + 1)
			SetMissionV(MS_A_TIME, 0)
			SetMissionV(MS_STATE, 1)
			return
		end
	end
end
