IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\battles\\boss\\bossset.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- 解放活动之千秋英烈

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
		AddGlobalCountNews(resultstr.."宋金战役BOSS报名时间形式已到, 请武林人士参加战斗!", 2);
		Msg2MSAll(MISSIONID, "宋金正式开战! 各位战士！冲啊!");
		WriteLog("boss battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>BOSS形式的宋金战役正紧张进行，现在正处于报名阶段，哪位武林人士想参加，请到襄阳或者朱仙镇进入战场或者使用宋金诏书报名。开战时间还有:"..RestMin.."分钟。参加条件：等级不低于40级,报名费为100000两。开战后，如果依然没有到最高期限，依然可以继续进入报名";
			str2 = "<#> 报名时间还剩"..RestMin.."分钟"
		else
			str1 = resultstr.."<#>BOSS形式的宋金战役正紧张进行，现在正处于报名阶段，哪位武林人士想参加，请到襄阳或者朱仙镇进入战场或者使用宋金诏书报名。开战时间还有:"..RestMin.."分钟"..RestSec.."秒. 参加条件：等级不低于40级,报名费为100000两。开战后，如果依然没有到最高期限，依然可以继续进入报名";
			str2 = "<#> 报名时间还剩"..RestMin.."分"..RestSec.."秒﹜"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t >= RUNGAME_TIME) then
		
		if (t == RUNGAME_TIME) then --正式开战的第一次触发时，产生战斗Npc的生成规则数据
			sf_buildfightnpcdata()
		else
			--到开战后半小时看双方杀死BOSS数，小的一方产生元帅
			if (t == BOSS_TIME) then
				if (GetMissionV(MS_KILLBOSSCOUNT_S) < GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(1);
					SetMissionV(MS_MARSHAL, 1);
				elseif(GetMissionV(MS_KILLBOSSCOUNT_S) > GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(2);
					SetMissionV(MS_MARSHAL, 2);
				elseif(GetMissionV(MS_KILLBOSSCOUNT_S) == GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(1);
					BattleBoss_AddBigBoss(2);
					SetMissionV(MS_MARSHAL, 3);
				end
			end

			if (t == VANISHGAME_TIME) then	--到最后20分钟时将另一方的元帅产生
				mar = GetMissionV(MS_MARSHAL)
				if (mar == 1) then
					BattleBoss_AddBigBoss(2);
				elseif (mar == 2) then
					BattleBoss_AddBigBoss(1);
				end
			end
			
			-- 产生全部小BOSS
			for i = 1,getn(tbCOMMONBOSSTIME_ALL) do
				if (t == tbCOMMONBOSSTIME_ALL[i]) then
					BattleBoss_AddAllCommonBoss();
					break
				end
			end
			
			-- 产生中路小BOSS
			for i = 1,getn(tbCOMMONBOSSTIME_SOME) do
				if (t == tbCOMMONBOSSTIME_SOME[i]) then
					BattleBoss_AddSomeCommonBoss();
					break
				end
			end
			
			bt_pop2signmap()	--将在后营（fight=0）的玩家送回报名点
			
			--每一分钟通告当前双方积分，和npc
			if (mod(t, 3) == 0 ) then
				sf_callfightnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- 产生战斗Npc				
				msstr = format("通知: 现在双方的宋金点为<color=yellow>%d:%d<color>, 宋金双方消灭boss的数量为<color=yellow>%d:%d<color>", GetMissionV(MS_TOTALPOINT_S), GetMissionV(MS_TOTALPOINT_J), GetMissionV(MS_KILLBOSSCOUNT_S), GetMissionV(MS_KILLBOSSCOUNT_J));
				Msg2MSAll(MISSIONID, msstr)
			end
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end
end

function sf_callfightnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
	
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
end
