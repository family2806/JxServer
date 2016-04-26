-- description	: ��������
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\dragonboat\\include.lua")

-- ����������ʱ��
function start_match_timer()
	-- 10���Ӻ�������������
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- ��������
function close_match()
	-- ������߳���ͼ
	kickout();
	
	-- �����ͼ
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- Ҳ�������
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- ��ʼ����
function start_signup()
	-- ����Ϊ����״̬
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- ͨ�����۱���������ʼ
	local min = floor(LIMIT_SIGNUP / 60);
	broadcast("<#> ����������۱�����ʼ���������ҿ쵽��ٴ�������С���ɶӳ�����������ʱ��Ϊ" .. min .. "����");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
end

-- ����˳�
function OnLeave(index)
	local old_index = PlayerIndex;
	PlayerIndex = index;
	
	SetCurCamp(GetCamp());
	SetTaskTemp(200,0)
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	
	SetTask(1505, 0)
	DisabledUseTownP(0)
	
	str = GetName().."�뿪����"
	Msg2MSAll(MISSION_MATCH,str);
	
	PlayerIndex = old_index;
end

function JoinMission(RoleIndex, camp)
	PlayerIndex = RoleIndex;
	if (camp ~= 1) then
		return
	end
	
	LeaveTeam()
	AddMSPlayer(MISSION_MATCH,camp);
	SetCurCamp(camp);
	SetTaskTemp(200,1)
	SetFightState(1);
	SetLogoutRV(1);
	SetPunish(0);
	str = GetName().."���������"
	local sf_mapid = SubWorldIdx2ID(SubWorld)
	NewWorld(sf_mapid, BOAT_POSX,BOAT_POSY);
	SetCreateTeam(0);
	Msg2MSAll(MISSION_MATCH,str);
	SetPKFlag(1)
	ForbidChangePK(1);
	SetDeathScript("\\script\\missions\\dragonboat\\player_death.lua");
	SetTask(1505, 1)
	DisabledUseTownP(1)
end