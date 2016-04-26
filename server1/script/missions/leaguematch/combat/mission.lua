Include( "\\script\\missions\\leaguematch\\head.lua" )

function InitMission()
	SetMissionV(WLLS_MSV_MSID, WLLS_MSID_COMBAT)
end;

function RunMission()
 	local tbPlayer = wlls_get_ms_plidx(0)
 	_M("getn(tbPlayer)="..getn(tbPlayer))
	local oldPlayerIndex = PlayerIndex 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[ i ];
 		_M("PlayerIndex="..PlayerIndex)
		SetPKFlag(2)	--屠杀模式
		ForbidChangePK(1);	--禁止更换PK模式
		SetFightState(1);	--开始战斗
	end
	PlayerIndex = oldPlayerIndex
	Msg2MSAll( WLLS_MSID_COMBAT, "<color=yellow>准备时间结束，比赛正式开始." );
end;

function EndMission()
	--检查所有camp in mission，给出胜败结果
	local n_usedtime = WLLS_TIMER_FIGHT_TOTAL * WLLS_TIMER_FIGHT_FREQ * WLLS_FRAME2TIME
	for i = 1, WLLS_MAX_COUNT, 2 do
		local count1 = GetMSPlayerCount( WLLS_MSID_COMBAT, i )
		local count2 = GetMSPlayerCount( WLLS_MSID_COMBAT, i + 1 )

		if ( count1 > 0 and count2 > 0) then --双方都不为空
			local _, str_league1 = wlls_camp2league(i)
			local _, str_league2 = wlls_camp2league(i + 1)
			if ( count1 > count2 ) then   --甲方人数 > 乙方
				wlls_matchresult(str_league1, str_league2, 1, n_usedtime)
			elseif ( count1 < count2 ) then   --乙方人数 > 甲方
				wlls_matchresult(str_league2, str_league1, 1, n_usedtime)
			else --人数相等
				local n_dmg1	= wlls_get_ms_damage(i)
				local n_dmg2	= wlls_get_ms_damage(i+1)
				local str1	= "<color=yellow> 你的队总共被打中<color=red>"..n_dmg1.."<color> 点，对方被打中<color=red>"..n_dmg2.."<color> 点"
				local str2	= "<color=yellow> 你的队总共被打中<color=red>"..n_dmg2.."<color> 点，对方被打中<color=red>"..n_dmg1.."<color> 点"
				if (n_dmg1 < n_dmg2) then
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.."你胜利了!", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.."你输了!", i + 1)
					wlls_matchresult(str_league1, str_league2, 1, n_usedtime)
				elseif (n_dmg1 > n_dmg2) then
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.."你输了!", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.."你胜利了!", i + 1)
					wlls_matchresult(str_league2, str_league1, 1, n_usedtime)
				else
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.."打平", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.."打平", i + 1)
					wlls_matchresult(str_league1, str_league2, 0, n_usedtime)
				end
			end
		end
	end
	wlls_remove_camp(0)
	WriteLog(date("%Y-%m-%d %H%M%S, ")..wlls_get_desc(3).." 结束比赛.")
end

function OnLeave( org_player )
	local oldindex = PlayerIndex
	PlayerIndex = org_player;
	local org_playername = GetName()
	local org_camp = GetTask(WLLS_TASKID_ORGCAMP)
	wlls_clear_pl_state()		--还原玩家状态
	SetPKFlag(0);	--战斗模式置为练功
	ForbidChangePK(0);	--允许改变战斗模式
	PlayerIndex = oldindex

	--如果本人已经完成比赛 或 比赛已经结束，不用做下面的处理
	if (org_camp == 0 or GetGlbValue(GLB_WLLS_PHASE) == 3) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, org_playername)
	local str_lgname = LG_GetLeagueInfo(n_lid)

	--发送离场消息
	_M("Msg2MSAll")
	Msg2MSAll(WLLS_MSID_COMBAT, "<color=yellow>战队 ["..str_lgname.."] "..org_playername.."已离开赛场!")

	--得到己方、对方Mission阵营编号
	local emy_camp
	if ( mod(org_camp,2) == 0 ) then
		emy_camp = org_camp - 1
	else
		emy_camp = org_camp + 1
	end
	
	--判断是否造成比赛结束，记录比赛结果或发送战报
	local org_count = GetMSPlayerCount( WLLS_MSID_COMBAT, org_camp )
	local emy_count = GetMSPlayerCount( WLLS_MSID_COMBAT, emy_camp )
	_M("OnLeave : "..org_camp.." VS "..emy_camp.."  "..org_count.."/"..emy_count)
	if (emy_count > 0) then --如果对方还有人的话
		if ( org_count > 0 ) then	--我方还有队员在比赛中
			str = "<color=pink>战事信息：对方还剩"..org_count.." 人"
			Msg2MSGroup(WLLS_MSID_COMBAT, str, emy_camp)
			
			--自身伤害总量记在队友身上 
			local n_oldidx	= PlayerIndex
			PlayerIndex	= org_player;
			local n_damage	= ST_GetDamageCounter();

			local tb_pidx	= wlls_get_ms_plidx(org_camp)
			for i = 1, getn(tb_pidx) do
				if (tb_pidx[i] ~= org_player) then
			 		PlayerIndex = tb_pidx[i];
			 		ST_IncreaseDamageCounter(n_damage);
			 		break;
			 	end
			end
			PlayerIndex	= n_oldidx
		else	--我方已全军覆没
			local n_emy_dmg	= wlls_get_ms_damage(emy_camp)

			local n_oldidx = PlayerIndex
			PlayerIndex	= org_player
			local n_our_dmg	= ST_GetDamageCounter()
			Msg2Player("<color=yellow>我方总共被打中<color=red>"..n_our_dmg.."<color> 点，对方被打中<color=red>"..n_emy_dmg.."<color> 点")
			PlayerIndex	= n_oldidx
			
			Msg2MSGroup(WLLS_MSID_COMBAT, "<color=yellow>我方总共被打中<color=red>"..n_emy_dmg.."<color> 点，对方被打中<color=red>"..n_our_dmg.."<color> 点", emy_camp)
			
			--得出比赛结果
			local n_usedtime = (GetGlbValue(GLB_WLLS_TIME) + 1) * WLLS_TIMER_FIGHT_FREQ * WLLS_FRAME2TIME
			if GetGlbMSRestTime then	--此指令暂时还没有加入
				n_usedtime = n_usedtime - GetGlbMSRestTime(WLLS_MSID_COMBAT, WLLS_TIMERID_COMBAT)
			end
			local _,emy_league = wlls_camp2league(emy_camp)
			wlls_matchresult(emy_league, str_lgname, 1, n_usedtime)
			wlls_remove_camp(emy_camp)
		end
	end
end;
