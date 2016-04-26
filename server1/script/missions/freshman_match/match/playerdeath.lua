Include("\\script\\missions\\freshman_match\\match\\head.lua")

function OnDeath(Launcher)
	orgply = PlayerIndex
	orgname = GetName()
	orgcamp = nt_gettask(CP_TASKID_ENEMY)
	match_mapid = SubWorldIdx2ID(SubWorld)
	tryout_mapid = match_mapid - 1
	
	enyply = NpcIdx2PIdx(Launcher);
	PlayerIndex = enyply
	enycamp = nt_gettask(CP_TASKID_ENEMY)
	enyname = GetName()
	
	PlayerIndex = orgply
	WL_clear_pl_state()
	SetLogoutRV(0);
	nt_settask(CP_TASKID_LOSE, nt_gettask(CP_TASKID_LOSE) + 1)
	nt_settask(CP_TASKID_FLAG, 1)
	DelMSPlayer(MISSIONID, orgply, enycamp)
	Msg2Player("你已失败<color=cyan>"..enyname)
	AddAword(GetLevel(), 15)
	Msg2SubWorld("选手 <color=cyan>"..enyname.."<color> 战胜<color=green>"..orgname.."<color> 获得胜利")
	WriteLog("****************************************************************************")
	WriteLog("选手<color=cyan>"..enyname.."<color> 战胜<color=green>"..orgname.."<color> 获得胜利")
	WriteLog("玩家 ["..orgname.."] 目前成绩为：胜"..nt_gettask(CP_TASKID_WIN)..", 输"..nt_gettask(CP_TASKID_LOSE)..", 和"..nt_gettask(CP_TASKID_TIE)..", 决赛"..nt_gettask(CP_TASKID_POINT))
	
	PlayerIndex = enyply
	WL_clear_pl_state()
	nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
	nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
	Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
	Msg2Player("你已胜利<color=green>"..org_name.."<color>, 获得3分")
	WriteLog("玩家 ["..enyname.."] 目前成绩为：胜"..nt_gettask(CP_TASKID_WIN)..", 输"..nt_gettask(CP_TASKID_LOSE)..", 和"..nt_gettask(CP_TASKID_TIE)..", 决赛"..nt_gettask(CP_TASKID_POINT))
	WriteLog("****************************************************************************")
	AddAword(GetLevel(), 60)
	nt_settask(CP_TASKID_FLAG, 1)
	DelMSPlayer(MISSIONID, enyply, orgcamp)
	
	SetLogoutRV(0);
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])	
end