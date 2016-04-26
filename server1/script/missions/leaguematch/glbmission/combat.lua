Include( "\\script\\missions\\leaguematch\\head.lua" )

function OnTimer()
	--时间计数增加
	local n_timer = GetGlbValue(GLB_WLLS_TIME) + 1
	SetGlbValue(GLB_WLLS_TIME, n_timer)
	
	if (n_timer >= WLLS_TIMER_FIGHT_TOTAL) then --比赛结束
		SetGlbValue(GLB_WLLS_PHASE, 3) --进入间歇时间
		CloseGlbMission(WLLS_MSID_GLB)
	end

	local tb_sub = wlls_get_subworld(3)
	local n_oldsub = SubWorld
	for n_idx, nGroupIdx in tb_sub do
		SubWorld = n_idx
		if (n_timer == WLLS_TIMER_FIGHT_PREP) then --准备结束
			_M("RunMission(WLLS_MSID_COMBAT)")
			RunMission(WLLS_MSID_COMBAT)
		elseif (n_timer < WLLS_TIMER_FIGHT_PREP) then
			local n_resttime = (WLLS_TIMER_FIGHT_PREP - n_timer)*WLLS_TIMER_FIGHT_FREQ
			Msg2MSAll(WLLS_MSID_COMBAT, "准备阶段：你还剩的准备时间为<color=yellow>"..n_resttime.."<color> 秒 .")
		else
			local n_resttime = WLLS_TIMER_FIGHT_TOTAL - n_timer
			if (n_resttime <= 0) then --比赛结束
				CloseMission(WLLS_MSID_COMBAT)
			elseif (mod(n_timer, 2) == 0) then	--双数次报告，单数不报告
				--发送战报，报告对方剩余人数
				for i = 1, WLLS_MAX_COUNT, 2 do
					local count_org = GetMSPlayerCount( WLLS_MSID_COMBAT, i )
					local count_emy = GetMSPlayerCount( WLLS_MSID_COMBAT, i + 1 )
					if (count_org > 0 or count_emy > 0) then --不是双方都为空
						Msg2MSGroup(WLLS_MSID_COMBAT, "<color=pink>战场战事"..count_emy.." 人", i)
						Msg2MSGroup(WLLS_MSID_COMBAT, "<color=pink>战场战事"..count_org.." 人", i + 1)
					end
				end
				--报告伤害量
				local tb_camp	= wlls_get_ms_troop()
				for i = 1, getn(tb_camp) do
					local n_dmg = wlls_get_ms_damage(tb_camp[i])
					Msg2MSGroup(WLLS_MSID_COMBAT, "我方目前被打中: <color=yellow>"..n_dmg.."<color>", tb_camp[i])
				end
				--比赛剩余时间
				n_resttime = n_resttime * WLLS_TIMER_FIGHT_FREQ;
				local n_RestMin = floor( n_resttime / 60 );
				local n_RestSec = mod( n_resttime,60 );
				if (n_RestMin == 0) then
					Msg2MSAll( WLLS_MSID_COMBAT, "战斗阶段：比赛时间还剩<color=yellow>"..n_RestSec.."<color> 秒." );
				elseif (n_RestSec == 0) then
					Msg2MSAll( WLLS_MSID_COMBAT, "战斗阶段：比赛时间还剩<color=yellow>"..n_RestMin.."<color> 分钟." );
				end;
			end
		end
	end
	SubWorld = n_oldsub
end
