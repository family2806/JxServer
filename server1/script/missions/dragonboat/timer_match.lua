-- description	: 比赛定时器
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "龙舟比赛取消！")
end

-- 开始比赛
function start_match()
	-- 设置为比赛状态
	SetMissionV(VARV_STATE, 2);

	local player_count = GetMSPlayerCount(MISSION_MATCH);
	if (player_count == 0) then
		-- 取消比赛
		cancel_match();
	else
		-- 通告
		broadcast("龙舟比赛正式开始，划船手们正努力划船!");

		-- 初始化变量
		SetMissionV(VARV_NPC_BATCH, 1);	-- 怪的批次
    	
		-- 清理地图
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- 生成第1批怪
		create_npc(1);
	end
	
	-- 设置玩家数量
	SetMissionV(VARV_PLAYER_COUNT, player_count);
end

-- 关闭比赛定时器
function close_match_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_MATCH);
end

function OnTimer()
	-- 报名结束
	close_match_timer();
	-- 比赛开始
	start_match();
	start_board_timer();
end
