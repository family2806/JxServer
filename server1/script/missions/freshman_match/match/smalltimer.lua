Include("\\script\\missions\\freshman_match\\match\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV( MS_TIME_1 ) + 1
	SetMissionV( MS_TIME_1, timer_1 )
	if ( timer_1 == UP_A_TIME ) then
		Msg2MSAll( MISSIONID, "<color=yellow>������������׼���׶��ѽ�������ʽ������ʼ." );
print("match start!!!!**************************************************************start")
		SetMissionV( MS_STATE, 2 );
		RunMission( MISSIONID )
	elseif ( ( timer_1 > UP_A_TIME ) and ( mod( timer_1, 2 ) == 0 ) ) then
		gametime = ( floor( GetMSRestTime( MISSIONID, TIMERID_TOTAL_INNER ) / 18 ) );
		RestMin = floor( gametime / 60 );
		RestSec = mod( gametime,60 );
		if ( RestMin == 0 ) then
			Msg2MSAll( MISSIONID, "<#> ս���׶Σ�����������������ʱ�仹ʣ"..RestSec.."<#> ��." );
		elseif (RestSec == 0) then
			Msg2MSAll( MISSIONID, "<#> ս���׶Σ�����������������ʱ�仹ʣ"..RestMin.."<#> ��." );
		end;
	end
end
