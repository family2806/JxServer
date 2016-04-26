-- description	: 比赛任务
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\dragonboat\\include.lua")

-- 启动比赛定时器
function start_match_timer()
	-- 10分钟后启动比赛任务
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- 结束比赛
function close_match()
	-- 把玩家踢出地图
	kickout();
	
	-- 清理地图
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- 也清理玩家
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- 开始报名
function start_signup()
	-- 设置为报名状态
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- 通告龙舟比赛报名开始
	local min = floor(LIMIT_SIGNUP / 60);
	broadcast("<#> 端午节赛龙舟比赛开始报名，请大家快到礼官处报名，小组由队长报名，报名时间为" .. min .. "分钟");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
end

-- 玩家退出
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
	
	str = GetName().."离开龙舟"
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
	str = GetName().."加入该龙舟"
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