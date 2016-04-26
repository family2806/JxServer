IncludeLib("RELAYLADDER")
Include("\\script\\missions\\freshman_match\\head.lua")
MISSIONID = 19;
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
UP_A_TIME = 10 * FRAME2TIME / MATCH_TIMER_1;	--5秒钟准备时间

MS_STATE = 1; --任务中记录任务状态的变量ID
MS_TIME_1 = 2	--每5秒加一smalltimer触发器
MS_ROUND = 3

function GameOver()
	local mapname = checkmap(1)
	resultstr = "今天 "..GetMissionV(3).."星期几"..mapname.."武林新秀联赛结束."
	Msg2MSAll(MISSIONID, resultstr)
	resultstr = date("%m 月%d 日, %H:%M, ")..resultstr
	WriteLog(resultstr)
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
	 	org_name = GetName()
	 	nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 1)
		Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
	 	nt_settask(CP_TASKID_TIE, nt_gettask(CP_TASKID_TIE) + 1)
	 	if (nt_gettask(CP_TASKID_ENEMY) > 100) then
	 		org_camp = nt_gettask(CP_TASKID_ENEMY) - 100
	 		eny_camp = nt_gettask(CP_TASKID_ENEMY)
	 	else
	 		org_camp = nt_gettask(CP_TASKID_ENEMY) + 100
	 		eny_camp = nt_gettask(CP_TASKID_ENEMY)
	 	end
	 	idx = 0
	 	for j =1, 500 do 
	 		idx, pidx = GetNextPlayer(MISSIONID,idx, eny_camp);
	 		if (idx == 0) then
	 			break
	 		end
	 		PlayerIndex = pidx
	 		eny_name = GetName()
	 		PlayerIndex = tbPlayer[i]
	 	end
	 	PlayerIndex = tbPlayer[i]
	 	Msg2Player("本轮比赛结束，你和对手<color=blue>"..eny_name.." <color>打平，获得一分")
	 	WriteLog("玩家 ["..org_name.."]与对手 ["..eny_name.."]不分胜负，目前成绩为：胜"..nt_gettask(CP_TASKID_WIN)..", 输"..nt_gettask(CP_TASKID_LOSE)..", 和"..nt_gettask(CP_TASKID_TIE)..", 决赛"..nt_gettask(CP_TASKID_POINT))
		WL_clear_pl_state()
		AddAword(GetLevel(), 30)
		nt_settask(CP_TASKID_FLAG, 1)
		DelMSPlayer(MISSIONID, tbPlayer[i], org_camp)
		
		SetLogoutRV(0);
		setworldid = SubWorldIdx2ID(SubWorld) - 1
		NewWorld(setworldid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
	end
end

