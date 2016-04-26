Include("\\script\\missions\\freshman_match\\tryout\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV( i , 0 );
	end;
	SetMissionS( 1, "" )
	SetMissionS( 2, "" )
	StartMissionTimer( MISSIONID, TIMERID_SMALL_OUTER, TRYOUT_TIMER_1 );
	StartMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER, TRYOUT_TIMER_2 );
	
	SetMissionV( MS_STATE,1 );--��������
	RunMission( MISSIONID )
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer( MISSIONID, TIMERID_SMALL_OUTER) ;
	StopMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER );
	GameOver();
	for i = 1, 100 do 
		SetMissionV( i , 0 );
	end;
	if(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		resultstr = "���������������������λѡ�ֵ��ٰ�����������������Ա(182, 202) ��������������������ǰ��Ŀ��Ե���������������Ա��(182, 202)�콱."
	else
		resultstr = "���������������������������ѡ����������ս."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	WL_clear_pl_state()
end;
