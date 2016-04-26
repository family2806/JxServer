Include("\\script\\missions\\championship\\match\\head.lua")
function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	StartMissionTimer(MISSIONID, 35, MATCH_TIMER_1);
	StartMissionTimer(MISSIONID, 36, MATCH_TIMER_2);	
	SetMissionV(MS_STATE,1);--选手入场，准备时间1分钟
end;

function RunMission()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
		SetFightState(1);
	end
end;

function EndMission()
	StopMissionTimer(MISSIONID, 35);
	StopMissionTimer(MISSIONID ,36);
	GameOver();
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function OnLeave(RoleIndex)
	oldindex = PlayerIndex
	PlayerIndex = RoleIndex;
	eny_camp = nt_gettask(CP_TASKID_ENEMY)
	idx = 0
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, eny_camp);
		if (idx == 0) then 
	 		break
	 	end;
	 	eny_index = pidx
	end
	if not eny_index then
		return
	end
	if (nt_gettask(CP_TASKID_FLAG) == 1) then
		return
	end
	nt_settask(CP_TASKID_LOSE, nt_gettask(CP_TASKID_LOSE) + 1)
	AddAword(GetLevel(), 5, 0)
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	org_name = GetName()
	WriteLog("****************************************************************************")
	WriteLog("玩家["..org_name.."]现在成绩是：胜"..nt_gettask(CP_TASKID_WIN)..", 败"..nt_gettask(CP_TASKID_LOSE)..", 和"..nt_gettask(CP_TASKID_TIE)..", 最终结果"..nt_gettask(CP_TASKID_POINT))
	camp = GetCamp();
	SetCurCamp(camp);
	SetCreateTeam(1);
	DisabledStall(0)	--允许摆摊
	SetTaskTemp(200, 0)
	ForbitTrade(0)
	SetFightState(0);
	SetPunish(1);

	PlayerIndex = eny_index
	eny_name = GetName()
	camp = GetCamp();
	SetCurCamp(camp);
	SetLogoutRV(0);
	SetCreateTeam(1);
	DisabledStall(0)	--允许摆摊
	SetTaskTemp(200, 0)
	SetDeathScript("");
	SetFightState(0)		
	SetPunish(1)
	ForbidChangePK(0);
	ForbitTrade(0)
	SetPKFlag(0)
	nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
	Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
	nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
	Msg2Player("你已胜<color=green>"..org_name.."<color>, 得3分奖励")
	nt_settask(CP_TASKID_FLAG, 1)
	WriteLog("玩家 ["..org_name.."]现在的成绩是：胜"..nt_gettask(CP_TASKID_WIN)..", 败"..nt_gettask(CP_TASKID_LOSE)..", 和"..nt_gettask(CP_TASKID_TIE)..", chung cu閏"..nt_gettask(CP_TASKID_POINT))
	AddAword(GetLevel(), 20, 2)
	tryout_mapid = SubWorldIdx2ID(SubWorld) - 1
	DelMSPlayer(MISSIONID, eny_index, eny_camp)
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
	PlayerIndex = oldindex
	Msg2SubWorld("选手<color=cyan>"..eny_name.."<color>战胜 <color=green>"..org_name.."<color> 取得胜利")
	WriteLog("选手<color=cyan>"..eny_name.."<color>战胜 <color=green>"..org_name.."<color> 取得胜利")
	WriteLog("****************************************************************************")
end;
