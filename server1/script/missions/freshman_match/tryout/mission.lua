Include("\\script\\missions\\freshman_match\\tryout\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV( i , 0 );
	end;
	SetMissionS( 1, "" )
	SetMissionS( 2, "" )
	StartMissionTimer( MISSIONID, TIMERID_SMALL_OUTER, TRYOUT_TIMER_1 );
	StartMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER, TRYOUT_TIMER_2 );
	
	SetMissionV( MS_STATE,1 );--允许报名了
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
		resultstr = "武林新秀联赛结束，请各位选手到临安见武林新秀联赛官员(182, 202) 看武林新秀名单。排名前五的可以到武林新秀联赛官员处(182, 202)领奖."
	else
		resultstr = "武林新秀联赛今日天结束，参赛选手请明天再战."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	WL_clear_pl_state()
end;
