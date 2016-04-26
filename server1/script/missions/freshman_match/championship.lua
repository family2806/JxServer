Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	if ( not validateDate( CP_UPTO_TRYOUT,CP_END_TRYOUT ) ) then
		return
	end
	orgworld = SubWorld
	for i = 1, getn( CP_MAPTAB ) do
		mapid = CP_MAPTAB[ i ][ 1 ]
		mapindex = SubWorldID2Idx( mapid )
		if ( mapindex < 0 ) then
			print( "ANNOUNCE: 武林新秀联赛区域"..CP_MAPTAB[i][3].."不在服务器上, ", mapid );
		else
			SubWorld = mapindex
			if( GetMissionV( MS_STATE ) > 0 ) then
				return
			end
			OpenMission(MISSIONID)
			str = date( "%m月%d日" ).."属于武林"..CP_MAPTAB[ i ][ 3 ].."武林新秀联赛已经开始，玩家想报名参加比赛请到临安与武林新秀联赛官员对话。报名条件：等级从50到90级，参加比赛次数少于40次."
			WriteLog(date( "%Y年%m月%d日%H时M分:" ).."武林 "..CP_MAPTAB[ i ][ 3 ].."武林新秀联赛已经开始!" )
			AddGlobalCountNews( str, 1 )
			SetMissionV( MS_STATE, 1 )
			SetMissionV( MS_ROUND, 1 )
		end
	end
	SubWorld = orgworld
end
