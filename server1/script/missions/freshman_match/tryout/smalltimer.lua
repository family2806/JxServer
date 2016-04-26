Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV(MS_TIME_1) + 1
	SetMissionV( MS_TIME_1, timer_1 )
	
	if ( mod( timer_1, 3 ) == 0 ) then
		SetMissionV( MS_A_TIME, GetMissionV( MS_A_TIME ) + 1 )
		if ( GetMissionV( MS_A_TIME ) < RUN_A_TIME ) then
			local mm = RUN_A_TIME - GetMissionV( MS_A_TIME )
			Msg2MSAll( MISSIONID, "����ʱ�仹ʣ"..mm.."����" )
		elseif (GetMissionV( MS_A_TIME ) > RUN_A_TIME ) then
			local mm = UP_A_TIME - GetMissionV( MS_A_TIME )
			Msg2MSAll( MISSIONID, "���ֱ�������ʱ�仹��"..mm.."����" )
		end
	end
	
	if ( mod( timer_1, 3 ) == 0 ) then
		if ( GetMissionV( MS_A_TIME ) == RUN_A_TIME ) then
			org_mapid = SubWorldIdx2ID( SubWorld )
			new_mapid = org_mapid + 1
			if (SubWorldID2Idx( new_mapid ) < 0) then
				print( "ANNOUNCE: û������������������!!!!MAPID = "..new_mapid )
				return
			end
			SetMissionV( MS_STATE, 2 )
			if (GetMSPlayerCount(MISSIONID, 0) < CP_PLNUM_LIMT) then
				Msg2MSAll(MISSIONID, "����ʱ���ѵ������ڱ��α�������������"..CP_PLNUM_LIMT.."�ˣ���ͣһ�α���.")
				cp_clearplstate()
				WriteLog(date( "%Y-%m-%d,%H:%M," ).."������ "..GetMissionV( MS_ROUND ).."���α�������������"..CP_PLNUM_LIMT..", ��ͣһ�Ρ�����= "..checkmap( 1 ) )
				return
			end

			Msg2MSAll( MISSIONID, "�ѵ�����ʱ�䣬����ѡ�ֽ�������" )
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
			resultstr = "������ "..GetMissionV( MS_ROUND ).."���ڼ�"..checkmap( 1 ).."�������������ոս�����������ʼ����."
			AddGlobalNews( resultstr )
			SetMissionV( MS_ROUND, GetMissionV( MS_ROUND ) + 1 )
			SetMissionV( MS_A_TIME, 0 )
			SetMissionV( MS_STATE, 1 )
			return
		end
	end
end
