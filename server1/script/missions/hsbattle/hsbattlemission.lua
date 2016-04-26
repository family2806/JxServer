Include("\\script\\missions\\hsbattle\\hshead.lua")
function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);--允许报名了
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;
	SetMissionV(MS_STATE, 1);
	StartMissionTimer(MISSIONID, 14,  	TIMER_1);
	StartMissionTimer(MISSIONID, 15, 	TIMER_2);
end;

function RunMission()
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			SetFightState(1);
		end
 	end;
 	SetMissionV(MS_STATE, 2);--允许报名了
end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	
	GameOver();
	StopMissionTimer(MISSIONID, 14);
	StopMissionTimer(MISSIONID, 15);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;

	if (GetMissionV(MS_STATE) ~=2 and GetCurCamp() ~= 1 and GetCurCamp()~=2 ) then 
		str2 = GetName().."<#> 离开赛场.";
	else
		str2 = GetName().."<#> 离开赛场."..GetMissionV(GetCurCamp()).."<#> 扣除一个积分";
		SetMissionV(MS_TONG1VALUE + GetCurCamp() - 1, GetMissionV(MS_TONG1VALUE + GetCurCamp() - 1) - 1);
	end;

	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
end;