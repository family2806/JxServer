Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV(MS_TIME_1) + 1
	SetMissionV( MS_TIME_1, timer_1 )
	
	if ( mod( timer_1, 3 ) == 0 ) then
		SetMissionV( MS_A_TIME, GetMissionV( MS_A_TIME ) + 1 )
		if ( GetMissionV( MS_A_TIME ) < RUN_A_TIME ) then
			local mm = RUN_A_TIME - GetMissionV( MS_A_TIME )
			Msg2MSAll( MISSIONID, "报名时间还剩"..mm.."分钟" )
		elseif (GetMissionV( MS_A_TIME ) > RUN_A_TIME ) then
			local mm = UP_A_TIME - GetMissionV( MS_A_TIME )
			Msg2MSAll( MISSIONID, "本轮比赛结束时间还有"..mm.."分钟" )
		end
	end
	
	if ( mod( timer_1, 3 ) == 0 ) then
		if ( GetMissionV( MS_A_TIME ) == RUN_A_TIME ) then
			org_mapid = SubWorldIdx2ID( SubWorld )
			new_mapid = org_mapid + 1
			if (SubWorldID2Idx( new_mapid ) < 0) then
				print( "ANNOUNCE: 没有武林新秀联赛赛场!!!!MAPID = "..new_mapid )
				return
			end
			SetMissionV( MS_STATE, 2 )
			if (GetMSPlayerCount(MISSIONID, 0) < CP_PLNUM_LIMT) then
				Msg2MSAll(MISSIONID, "比赛时间已到，由于本次比赛人数不够"..CP_PLNUM_LIMT.."人，暂停一次比赛.")
				cp_clearplstate()
				WriteLog(date( "%Y-%m-%d,%H:%M," ).."排名第 "..GetMissionV( MS_ROUND ).."本次比赛人数不够"..CP_PLNUM_LIMT..", 暂停一次。门派= "..checkmap( 1 ) )
				return
			end

			Msg2MSAll( MISSIONID, "已到比赛时间，所有选手进入赛场" )
			round = GetMissionV( MS_ROUND )
			SubWorld = SubWorldID2Idx( new_mapid )
			OpenMission( MATCH_MS_ID )
			SetMissionV( 3, round )
			SubWorld = SubWorldID2Idx( org_mapid )
			join_match()
			return
		end
	end
	
	if ( GetMissionV( MS_A_TIME ) == 0 ) then
		return
	end
	if ( mod( timer_1, 3 ) == 0 ) then
		if ( GetMissionV( MS_ROUND ) >= CP_ONEDAY_MAXROUND ) then
			return
		end
		if ( mod( GetMissionV( MS_A_TIME ), UP_A_TIME ) == 0 ) then
			resultstr = "排名第 "..GetMissionV( MS_ROUND ).."星期几"..checkmap( 1 ).."武林新秀联赛刚刚结束，比赛开始报名."
			AddGlobalNews( resultstr )
			SetMissionV( MS_ROUND, GetMissionV( MS_ROUND ) + 1 )
			SetMissionV( MS_A_TIME, 0 )
			SetMissionV( MS_STATE, 1 )
			return
		end
	end
end
