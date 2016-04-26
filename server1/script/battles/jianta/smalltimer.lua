IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\jianta\\head.lua")
Include("\\script\\battles\\jianta\\mission.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1, t)
	
	--Storm 加奖励积分
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "初级区域"
	elseif (lsf_level == 2) then
		resultstr = "中级区域 "
	elseif (lsf_level == 3) then
		resultstr = "高级区域"
	end
	
	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."箭塔形式的宋金报名时间已到，战役正式开始!", 2);
		Msg2MSAll(MISSIONID, "宋金正式开战!各战士！冲啊！");
		WriteLog("jianta battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>箭塔形式的宋金战斗正非常紧张, 目前正处于报名阶段, 谁想参战，请快速到襄阳或者朱仙镇登记报名; 或者使用宋金诏书快速到报名处，报名时间还剩:"..RestMin.."分钟. 参加条件: 40级以上. 报名费3000 两. 开战后，如果总人数不够，依然可以继续报名!";
			str2 = "<#> 报名剩余时间为"..RestMin.."分钟"
		else
			str1 = resultstr.."<#>箭塔形式的宋金战斗正非常紧张, 目前正处于报名阶段, 谁想参战，请快速到襄阳或者朱仙镇登记报名; 或者使用宋金诏书快速到报名处，报名时间还剩:"..RestMin.."分钟"..RestSec.."秒。参加条件: 40级以上. 报名费3000 两. 开战后，如果总人数不够，依然可以继续报名!";
			str2 = "<#> 报名剩余时间为"..RestMin.."分钟"..RestSec.." 秒"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then

		--如果场上某一阵营人数低于最小数量，则比赛结束，人多的阵营直接获胜
		local group1count = GetMSPlayerCount(MISSIONID, 1)
		local group2count = GetMSPlayerCount(MISSIONID, 2)
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit()) then
			if (group1count > group2count) then
				SetMissionV(MS_MOSTDEATH, 1)
				CloseMission(MISSIONID)
			elseif (group1count < group2count) then
				SetMissionV(MS_MOSTDEATH, 2)
				CloseMission(MISSIONID)
			else
				SetMissionV(MS_MOSTDEATH, 0) 
				CloseMission(MISSIONID)
			end
			return
		end

		
		local tb_jianta_count = {0, 0};	-- 属于宋/金方的箭塔数
		for i = 1, 5 do
			local n_camp	= GetMissionV(MS_TOWER_1 + i - 1);
			if (1 == n_camp or 2 == n_camp) then
				tb_jianta_count[n_camp] = tb_jianta_count[n_camp] + 1;
			end
		end
		local tb_player_actor	= {};
		local idx 	= 0;
		local pidx 	= 0;
		for i = 1, 500 do
			idx, pidx	= GetNextPlayer(MISSIONID, idx, 0)
			if (pidx > 0) then
				tb_player_actor[getn(tb_player_actor) + 1]	= pidx;
			end
			if (idx <= 0) then
				break;
			end
		end
		
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));	
		local oldPlayeridx	= PlayerIndex;
		
		for i = 1, 5 do
			local jiantaxy 		= GetIniFileData(mapfile, "Jianta_All", format("jianta_%d", i));
			local xj, yj		= bt_str2xydata(jiantaxy);	-- 获得第i个箭塔的坐标
			for j = 1, getn(tb_player_actor) do
				PlayerIndex = tb_player_actor[j];
				local mapid, xp, yp = GetWorldPos();
				if ((xp - xj) * (xp - xj) + (yp - yj) * (yp - yj) <= 20 * 20 and (GetMissionV(MS_TOWER_1 + i - 1) == GetCurCamp()) ) then
					bt_addtotalpoint(5 * tb_jianta_count[GetCurCamp()]);
				end
				BT_SortLadder();
				BT_BroadSelf();
			end
		end
		
		PlayerIndex = oldPlayeridx;
		
		mar_addmissionpoint(250 * tb_jianta_count[1], 1);
		mar_addmissionpoint(250 * tb_jianta_count[2], 2);
		--每一分钟通告当前双方积分，和npc
		if (mod(t, 3) == 0 ) then
			msstr = "公告：现在宋金双方的总积累值为"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end



