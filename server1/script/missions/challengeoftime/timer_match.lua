-- description	: 比赛定时器
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "比赛取消！")
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
		-- 启动比赛结束定时器
		start_close_timer();
		
		-- 通告
		broadcast("‘挑战时间’任务已经正式开始，各地英雄正奋力争抢");

		-- 初始化变量
		SetMissionV(VARV_NPC_BATCH, 1);	-- 怪的批次
		SetMissionV(VARV_MISSION_RESULT, 0);
		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
		-- 小聂弑尘出现的关卡
		local nBossBatch = random(5, 15)
		SetMissionV(VARV_XIAONIESHICHEN_BATCH, nBossBatch)	-- 从5到15随机产生一个关卡
		WriteLog(format("小聂弒尘可能的障碍是 %d",nBossBatch))
		
		-- 保存玩家信息
		save_player_info();
    	
		-- 清理地图
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- 生成第1批怪
		create_batch_npc(1);
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
