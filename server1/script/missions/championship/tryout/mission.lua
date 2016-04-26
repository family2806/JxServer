Include("\\script\\missions\\championship\\tryout\\head.lua")
function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	StartMissionTimer(MISSIONID, 34, TRYOUT_TIMER_2);
	StartMissionTimer(MISSIONID, 33, TRYOUT_TIMER_1);
	
	SetMissionV(MS_STATE,1);--允许报名了
	RunMission(MISSIONID)
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(MISSIONID, 33);
	StopMissionTimer(MISSIONID, 34);
	GameOver();
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	if(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		resultstr = "武林大会门派预选赛已经结束，请各位到临安见武林大会官员(182, 203)看名单. 名单中的玩家可以到舞林大会官员处(182, 203)领名号."
	else
		resultstr = "今天的武林大会预选赛已结束，各位选手明天约定再来吧."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetCreateTeam(1);
	DisabledStall(0)	--允许摆摊
	SetTaskTemp(200, 0)
	SetDeathScript("");--设置死亡脚本为空
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	ForbitTrade(0);
	RestoreOwnFeature();
end;