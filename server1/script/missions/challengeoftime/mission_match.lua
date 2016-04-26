-- description	: 比赛任务
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\event\\storm\\function.lua")	--Storm

-- 启动比赛开始定时器
function start_match_timer()
	-- 10分钟后启动比赛任务
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- 开始报名
function start_signup()
	-- 设置为报名状态
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- 通告龙舟比赛报名开始
	--由relay通告报名开始，2次
	--local min = floor(LIMIT_SIGNUP / 60);
	--broadcast("<#>时间的挑战任务报名开始了，请大家速来7大城市聂弑尘处组队由队长报名，报名时间为" .. min .. "分钟");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
	close_close_timer();
end

-- 玩家退出
function OnLeave(index)
	local old_index = PlayerIndex;
	PlayerIndex = index;
	
	-- Big Boss Remove bonus state
	BigBoss:RemoveChuangGuanBonus();
	
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
	
	Msg2MSAll(MISSION_MATCH, GetName().."离开任务区域");
	
	--Storm 加奖励分
	if storm_valid_game(2) then	--风暴挑战没有结束（如果是玩家下线该段代码不会起作用）
		storm_add_pointex(2, 40)
		storm_end(2)
	end
	SetTask(STORM_TASKID_GAMEID_SS, 0)	--清除GameKey
	
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
	str = GetName().."参加‘挑战时间任务’"
	local sf_mapid = SubWorldIdx2ID(SubWorld)
	NewWorld(sf_mapid, BOAT_POSX, BOAT_POSY);
	SetCreateTeam(0);
	Msg2MSAll(MISSION_MATCH,str);
	SetPKFlag(1)
	ForbidChangePK(1);
	SetDeathScript(SCRIPT_PLAYER_DEATH);
	SetTask(1505, 1)
	DisabledUseTownP(1)

	--Storm 加入风暴积分
	SetTask(STORM_TASKID_GAMEID_SS, random(100000))	--指定随机的GameKey
--	if (storm_start(2, 1)) then
--		local level = GetTask(TB_STORM_TASKID[2][STORM_TASKIDX_MODE]) + 1
--		str = "参加杀手试炼任务可获得参与奖励—风暴积分<color=yellow>40<color>分。闯关成功的提前时间可转换为风暴积分（最高<color=yellow>60<color>分）。每天两场杀手试炼，取成绩最好的一场计算风暴积分。%s<enter>"
--		local tb_levelstr = {
--			"初级杀手试炼任务，每人每天最多可获得风暴积分<color=yellow>90<color>分。",
--			"高级杀手试炼任务，每人每天最多可获得风暴积分<color=yellow>100<color>分。",
--		}
--		str = format(str, tb_levelstr[level])
--		Talk(1, "", str)
--	end
end

