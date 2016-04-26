IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function OnTimer()
	local t = GetMissionV(MS_TIMER1_TIME) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1_TIME, t);
	
	--Storm 加奖励积分
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "初级区域"
	elseif (lsf_level == 2) then
		resultstr = "中级区域"
	elseif (lsf_level == 3) then
		resultstr = "高级区域 "
	end
	
	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."宋金运粮模式报名时间已到,战斗正式开始!", 2);
		Msg2MSAll(MISSIONID, "宋金正式开战！将士们！冲啊!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>宋金大战运粮模式正在报名中，大家赶紧到襄阳或者朱仙镇报名,或者可以使用宋金诏书继续到宋金战场报名处报名, 还剩时间为"..RestMin.."分钟. 参加条件：40级以上.报名费 3000两。开战后，如果总人数不足，依然可以继续报名!";
			str2 ="<#> 报名剩余时间为"..RestMin.."分钟"
		else
			str1 = resultstr.."<#>宋金大战运粮模式正在报名中，大家赶紧到襄阳或者朱仙镇报名,或者可以使用宋金诏书继续到宋金战场报名处报名, 还剩时间为"..RestMin.."分钟"..RestSec.."秒。参加条件：40级以上.报名费 3000两。开战后，如果总人数不足，依然可以继续报名!";
			str2 = "<#> 报名剩余时间为"..RestMin.."分钟"..RestSec.." 秒"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--每一分钟产生一批Npc，并且通告当前送粮食包的数量
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			if (mod(t, 3 ) == 0) then
				msstr = format("公布：宋方与金方运输粮包的比例为<color=yellow>%d:%d",BT_GetGameData(GAME_CAMP1),BT_GetGameData(GAME_CAMP2));
				Msg2MSAll(MISSIONID, msstr);
			end
		end
		
		if (t > RUNGAME_TIME) then
			local bp = mod(t - RUNGAME_TIME*2, 3*10);
			local n_b = floor((t - RUNGAME_TIME*2) / (3*10));
			
			if (bp == 0)  then
				sf_creategraingharry(n_b+1);
			end
		end
		
	end;
	
end;

function sf_creategraingharry(n_branch)
	if (n_branch > 3) then
		print("error, add grain branch is overflow !"..n_branch);
		return 0;
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area1 = BT_GetGameData(GAME_CAMP1AREA);
	local area2 = BT_GetGameData(GAME_CAMP2AREA);
	
	local flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "grainpos");
	local flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "grainpos");
	local flagposfile = {flagposfile1, flagposfile2};
	for n_camp = 1, 2 do
		local sz_file = flagposfile[n_camp]
		local count = GetTabFileHeight(sz_file) - 1;
		if (count < 9) then
			print("error, flagposfile height not enough!"..sz_file, count);
			return
		end
		
		for i = ((n_branch-1)*3+1), (n_branch*3) do
			local srcx = GetTabFileData(sz_file, i + 1, 1)
			local srcy = GetTabFileData(sz_file, i + 1, 2)
		
			sf_addgharry(n_camp, srcx, srcy, 0);
		end
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>新粮车已到，快叫人去运粮.");
	end
	
end
