Include("\\script\\missions\\freshman_match\\match\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV( MS_TIME_1 ) + 1
	SetMissionV( MS_TIME_1, timer_1 )
	if ( timer_1 == UP_A_TIME ) then
		Msg2MSAll( MISSIONID, "<color=yellow>武林新秀联赛准备阶段已结束，正式比赛开始." );
print("match start!!!!**************************************************************start")
		SetMissionV( MS_STATE, 2 );
		RunMission( MISSIONID )
	elseif ( ( timer_1 > UP_A_TIME ) and ( mod( timer_1, 2 ) == 0 ) ) then
		gametime = ( floor( GetMSRestTime( MISSIONID, TIMERID_TOTAL_INNER ) / 18 ) );
		RestMin = floor( gametime / 60 );
		RestSec = mod( gametime,60 );
		if ( RestMin == 0 ) then
			Msg2MSAll( MISSIONID, "<#> 战斗阶段：门派武林新秀联赛时间还剩"..RestSec.."<#> 秒." );
		elseif (RestSec == 0) then
			Msg2MSAll( MISSIONID, "<#> 战斗阶段：门派武林新秀联赛时间还剩"..RestMin.."<#> 分." );
		end;
	end
end
