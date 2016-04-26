Include("\\script\\missions\\challenge\\challengehead.lua")
function InitMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	SetMissionV(MS_STATE, 1);--允许报名了
	StartMissionTimer(MISSIONID,10,  TIMER_1);
	StartMissionTimer(MISSIONID, 11, TIMER_2);
end;

function RunMission()
	SetMissionV(MS_STATE, 2)
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
 			PlayerIndex = pidx;
			if (GetCurCamp() ~= 6) then
   				SetFightState(1);
				PutMessage("战场正式开始，所有行动");
   			end
 		end;
 	end;
end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	GameOver();
	StopMissionTimer(MISSIONID, 10);
	StopMissionTimer(MISSIONID, 11);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."离开战场, ";
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
	if (GetMissionV(MS_STATE) == 1) then
		if (GetMSPlayerCount(MISSIONID, GetCurCamp()) == 0) then
			SetMissionV(MS_S_JOINED + GetCurCamp() - 1, 0)
		end
	end
end;