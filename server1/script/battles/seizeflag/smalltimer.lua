IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1_TIME) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1_TIME, t)
	
	--Storm 加奖励积分
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "初级战场的"
	elseif (lsf_level == 2) then
		resultstr = "中级战场的"
	elseif (lsf_level == 3) then
		resultstr = "高级战场的"
	end
	
	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."宋金战役之夺旗模式报名时间到，战斗正式开始！", 2);
		Msg2MSAll(MISSIONID, "宋金战役正式进入战斗阶段！将士们，冲呀！");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- 日常任务刷新对话NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>宋金战役之夺旗模式一触即发，目前正进入报名阶段，欲参战者请尽快从襄阳或朱仙镇前往宋金战场；或使用宋金诏书到达报名点报名。开战时间还剩："..RestMin.."分。参战条件：等级不小于40级，报名费"..BATTLES_JOINFEE.."两。开战后若参战人数未达上限，仍可报名进入战场。";
			str2 ="<#>开战时间还剩："..RestMin.."分"
		else
			str1 = resultstr.."<#>宋金战役之夺旗模式一触即发，目前正进入报名阶段，欲参战者请尽快从襄阳或朱仙镇前往宋金战场；或使用宋金诏书到达报名点报名。开战时间还剩："..RestMin.."分"..RestSec.."秒。参战条件：等级不小于40级，报名费"..BATTLES_JOINFEE.."两。开战后若参战人数未达上限，仍可报名进入战场。";
			str2 = "<#>开战时间还剩："..RestMin.."分"..RestSec.."秒"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--每一分钟产生一批Npc，并且通告当前夺旗的数量
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			if (mod(t, 3 ) == 0) then
				msstr = "公告：当前宋金双方夺得帅旗数为<color=yellow>"..BT_GetGameData(GAME_CAMP1).."："..BT_GetGameData(GAME_CAMP2);
				Msg2MSAll(MISSIONID, msstr);
			end
		end

		if (gamemode == 1 and mod(t, 6) == 0) then
			sf_showflagpos()
		end
	end;


	--随机夺旗模式的产生旗规则 。必须在正式战斗状态才能放旗
	if (gamemode == 2) then
		if (GetMissionV(MS_STATE) ~= 2) then
			return
		end;	
		if (mod(t - RUNGAME_TIME, 6) == 0)  then
			sf_createrandomflag()
		end
	end
end;

function sf_showflagpos()
	l_flagx1 , l_flagy1=  sf_getflagposinfo(1)
	l_flagx2,  l_flagy2 = sf_getflagposinfo(2)
	if (l_flagx1 ~= 0 or l_flagy1 ~= 0) then
		flagstr = "<color=0x00FFFF>战役报告：当前宋方帅旗在<color=yellow>"..l_flagx1..","..l_flagy1.."<color>附近"
		Msg2MSAll(MISSIONID, flagstr)
	end
	if (l_flagx2 ~= 0 or l_flagy2 ~= 0) then
		flagstr = "<color=0x9BFF9B>战役报告：当前金方帅旗在<color=yellow>"..l_flagx2..","..l_flagy2.."<color>附近"
		Msg2MSAll(MISSIONID, flagstr)
	end			
end
