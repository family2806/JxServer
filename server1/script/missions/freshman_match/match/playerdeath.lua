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
	Msg2Player("����ʧ��<color=cyan>"..enyname)
	AddAword(GetLevel(), 15)
	Msg2SubWorld("ѡ�� <color=cyan>"..enyname.."<color> սʤ<color=green>"..orgname.."<color> ���ʤ��")
	WriteLog("****************************************************************************")
	WriteLog("ѡ��<color=cyan>"..enyname.."<color> սʤ<color=green>"..orgname.."<color> ���ʤ��")
	WriteLog("��� ["..orgname.."] Ŀǰ�ɼ�Ϊ��ʤ"..nt_gettask(CP_TASKID_WIN)..", ��"..nt_gettask(CP_TASKID_LOSE)..", ��"..nt_gettask(CP_TASKID_TIE)..", ����"..nt_gettask(CP_TASKID_POINT))
	
	PlayerIndex = enyply
	WL_clear_pl_state()
	nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
	nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
	Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
	Msg2Player("����ʤ��<color=green>"..org_name.."<color>, ���3��")
	WriteLog("��� ["..enyname.."] Ŀǰ�ɼ�Ϊ��ʤ"..nt_gettask(CP_TASKID_WIN)..", ��"..nt_gettask(CP_TASKID_LOSE)..", ��"..nt_gettask(CP_TASKID_TIE)..", ����"..nt_gettask(CP_TASKID_POINT))
	WriteLog("****************************************************************************")
	AddAword(GetLevel(), 60)
	nt_settask(CP_TASKID_FLAG, 1)
	DelMSPlayer(MISSIONID, enyply, orgcamp)
	
	SetLogoutRV(0);
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])	
end