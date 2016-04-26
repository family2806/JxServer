--coding by romandou 2004-12-22
--战役的报名点Npc对话脚本

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

Include("\\script\\battles\\vngbattlesign.lua")


function main()
	local nWorld, _, _ = GetWorldPos()
	if nWorld ~= 162 then
		Talk(1, "", "功能已关.")
		return
	end
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)
	bt_setnormaltask2type()
	if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
	Say("开赴战场的大军尚未出发，请继续勤加操练，等候我们的通知。",0)
		SubWorld = nOldSubWorld
		return
	end

-------------------------------------------------------------------	
--判断玩家等级与报名点等级是否相适合
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --玩家等级
	local bt_level = 0;	-- 当前地图所属的战役等级
	
	if (pl_level < 40 ) then
		Say("对不起，宋金大战需要你达到40级才能参加，但你现在的等级太低。继续努力吧，下次再来！",2, "好的/bt_oncancel", "我想了解战役的信息/bt_onbattleinfo");--？？“你的等级小于40级或者没有带足银两。”
		SubWorld = nOldSubWorld
		return 
	elseif (pl_level < 80) then
		bt_level = 1
	elseif (pl_level < 120) then
		bt_level = 2
	else
		bt_level = 3
	end;
	SubWorld = SubWorldID2Idx(325)
	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("当前宋金大战报名点地图ID有问题，请运营部门检查！");
		 	SubWorld = nOldSubWorld
		 	return 	
		 end
		 Say("这里是"..szGAME_GAMELEVEL[maplevel].."，你目前等级只能去"..szGAME_GAMELEVEL[bt_level].."报名！", 0)--？？没有分等级的提示信息		 
		 SubWorld = nOldSubWorld
		 return
	end

-------------------------------------------------------------------	
	SubWorld = SubWorldID2Idx(325)
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("前方出现问题，暂时不能进行宋金大战。", 0 )
		SubWorld = nOldSubWorld
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("对不起，目前宋金大战还没有开始，下次再来吧！", 0 )
		SubWorld = tempSubWorld;		
		return
	elseif (state == 3) then
		Say("对不起，目前的宋金大战已经结束，下次再来吧！", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
	SubWorld = SubWorldID2Idx(325)
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("对不起，目前宋金大战已经结束，下次再来吧！", 0)
		SubWorld = nOldSubWorld
		return 
	end

	if (bt_ncamp == 1) then
		Say("新一轮的["..battlename.."]战役开始了，大家同为大宋子民，俗语云：天下兴亡、匹夫有责，如今金人侵我河山伤我家人，国家危难之际，正是你我报效国家之时，只要你等级在40级以上，再交纳军资银两，就可以来报效国家了，加入我们吧！", 2, "我参加(战役总积分将被清除)/bt_joinsong", "再考虑一下/bt_oncancel");
	else
		Say("新一轮的["..battlename.."]战役开始了，金国的勇士们，想我大金一统天下的大业指日可待，前方却遇宋国南蛮阻拦，现在大金需要你们来消灭顽固阻力完成大业，只要你等级在40级以上，再交纳军资银两，就可以来报效国家了，加入我们吧！", 2, "我参加(战役总积分将被清除)/bt_joinjin", "再考虑一下/bt_oncancel");
	end
	SubWorld = nOldSubWorld
	return	
end;
	SubWorld = SubWorldID2Idx(325)
--if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
	if (bt_ncamp == 1) then
		Say("看你獐头鼠目，必定是金国奸细。来人呀，速速将他拿下！",0)
		Msg2Player("你本场战局已隶属金方，需到金方报名点向金军募兵官申请入场！")
	else
		Say("大胆南蛮，竟胆敢闯入我大金领地，简直自寻死路！",0)
		Msg2Player("你本场战局已隶属宋方，需到宋方报名点向宋军募兵官申请入场！")	
	end;
	SubWorld = nOldSubWorld
	return 
end

----------------------------------------------------------------------
--正式报名时的条件是，
--1、已经报了本次的战役
--2、已经是本方战役的阵营了
--3、与本次战局的战局等级相符了

--正式可以报名了

	--Storm 加入挑战
	say_index = 1
	storm_ask2start(1)
end;

--正常的宋金大战对话
function storm_goon_start()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)
	say_index = 1
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		return
	end
	
	local tb_words = {
		"本次宋金大战已经打响，你希望进入战场吗？",
		"欢迎你正式成为本次战役宋朝的杀敌将士，目前战斗已经打响了，你希望立刻进入战场吗？",
		"欢迎你正式成为本次战役金国的杀敌勇士，目前战斗已经打响了，你希望立刻进入战场吗？"
	}
	local szMsg = tb_words[say_index].."<enter><enter>目前  <color=yellow>宋方人数为"..mem_song.."人<enter>      <color=yellow>金方人数为"..mem_jin.."人"
	Say(szMsg, 2, "请让我加入/bt_enterbattle", "让我再考虑一下/bt_oncancel");
	if (bt_getgn_awardtimes() ~= 1) then
		Msg2Player("宋金大战目前正处于<color=yellow>辉煌之夜<color>奖励双倍的活动中，请各位尽情享受独孤盟主的馈赠。")
	end
	SubWorld = nOldSubWorld
end

function bt_enterbattle()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		if( nHour >= 2045 and nHour < 2300)then
			local nNpcIndex = GetLastDiagNpc()
			local szNpcName = GetNpcName(nNpcIndex)
			local szTong = GetTong()
			if szTong ~= nil and szTong ~= "" then
				if 2 == bt_ncamp then
					if GetCityOwner(4) ~= szTong and GetCityOwner(7) == szTong then--4是汴京，7是临安, 2是金方
						Msg2Player("临安占城帮会只能在宋方报名!")
						SubWorld = nOldSubWorld
						return
					end
				elseif 1 == bt_ncamp then
					if GetCityOwner(4) == szTong and GetCityOwner(7) ~= szTong then--4是汴京，7是临安，1是宋方
						Msg2Player("变京占城帮会只能在金方报名!")
						SubWorld = nOldSubWorld
						return
					end
				else
					SubWorld = nOldSubWorld
					return
				end
			end
		end
	end
	
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		SubWorld = nOldSubWorld
		return
	end
	
	if	bt_checkmem_for_guozan() == 0 then
		SubWorld = nOldSubWorld
		return
	end
	
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("对不起，前方出现问题，暂时不能进入战场了。",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			SubWorld = nOldSubWorld
			return
		end
		--tinhpn20100804: IPBonus
		if (GetTask(TASKID_COUNT_X2TONGKIM) == 1) then
			SetTask(TASKID_COUNT_X2TONGKIM, 0)
			SetTask(TASKID_RECIEVE_BONUS_TK, 1)
		else
			SetTask(TASKID_RECIEVE_BONUS_TK, 0)
		end
		
		--By: NgaVN
		--Kiem tra nguoi choi truoc khi join vao mission
		local nRet = tbVNG2011_ChangeSign:CheckChangeSign();
		local nTimeNow = tbVNG2011_ChangeSign:GetTimeNow()
		if ( nRet ~= 1 ) then
			Say(format("战场还有<color=red>%d <color=red>分钟可以报名", nTimeNow));
			SubWorld = nOldSubWorld
			return
		end

		SubWorld = idx;
		BT_SetData(PL_SERIESKILL, 0)
		SetTask(TV_SERIESKILL_REALY,0)
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
		local SubWorld = OldSubWorld;
		SubWorld = nOldSubWorld
		return
	else
		Say("对不起，前方出现问题，暂进不能进入战场了", 0);
	end
	SubWorld = nOldSubWorld
end;

function bt_wantjin()
		Say("你真的决定加入金方吗？选择阵营后，一周内有效。只有下次战役开始时才能再选择其它阵营哟",2, "我确定选择加入金方/bt_joinjin", "我再考虑考虑！/bt_oncancel");
end;

function bt_wantsong()
		Say("你真的决定加入宋方吗？选择阵营后，一周内有效。只有下次战役开始时才能再选择其它阵营哟",2, "我确定选择加入宋方/bt_joinsong", "我再考虑考虑！/bt_oncancel");
end;

function bt_joinsong()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("战役公告：新战役开始了，您上一次的战役总积分将被清零。")
	Msg2Player("欢迎你的加入，宋朝的英雄，赶快进入战场吧！")

	--Storm 加入挑战
	say_index = 2
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_joinjin()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("战役公告：新战役开始了，您上一次的战役总积分将被清零。")
	Msg2Player("欢迎你的加入，金国的勇士，赶快进入战场吧！")

	--Storm 加入挑战
	say_index = 3
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_oncancel()

end

function bt_checkmemcount_balance()
	local mapid = BT_GetGameData(GAME_MAPID);
	if (mapid > 0) then
		if (SubWorldID2Idx(mapid) >= 0) then
			oldSubWorld = SubWorld
			SubWorld = SubWorldID2Idx(mapid)
			local mem_song = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 1)
			local mem_jin = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 2)
			SubWorld = oldSubWorld
			
			-- 国战宋金 特殊的人数平衡处理		
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				if (bt_ncamp == 1 and mem_song >= BALANCE_GUOZHAN_MAXCOUNT) or (bt_ncamp == 2 and mem_jin >= BALANCE_GUOZHAN_MAXCOUNT) then
					 -- 人数超过100人限制，继续往下执行，限制人数差5人
				else
					 -- 人数未超过限制，忽略5人差额，直接允许进入
					return mem_song, mem_jin
				end
			end
			
			if (bt_ncamp == 1 and (mem_song - mem_jin) >= BALANCE_MAMCOUNT ) then
				Say("当前我方兵力<color=yellow>"..mem_song.."人<color>，敌方兵力<color=yellow>"..mem_jin.."人<color>，人数差已超过<color=red>"..BALANCE_MAMCOUNT.."人<color>。以我军现在的兵力已足以全灭金兵，你还是稍后再来吧！", 0)
				return
			elseif (bt_ncamp == 2 and (mem_jin - mem_song) >= BALANCE_MAMCOUNT ) then
				Say("当前我方兵力<color=yellow>"..mem_jin.."人<color>，敌方兵力<color=yellow>"..mem_song.."人<color>，人数差已超过<color=red>"..BALANCE_MAMCOUNT.."人<color>。以我军现在的兵力已足以全灭宋军，你还是稍后再来吧！", 0)
				return
			else
				return mem_song, mem_jin
			end
		end
	end
	Say("对不起，前方出现问题，暂进不能进入战场了", 0);
	return nil
end

-- 国战宋金对进入的玩家做进一步的检查 1:放行 0:不让进入
function bt_checkmem_for_guozan()
	
	-- 非国战宋金直接放行
	if BT_GetGameData(GAME_BATTLEID) ~= 2 then
		return 1;
	end
	
	-- 之前已经通过检查，参加了战役，不必再检查了
--	if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) == bt_ncamp) then
--		return 1;
--	end
	
	local szCityOwner_LinAn		= GetCityOwner(7);	-- 临安的占领帮会
	local szCityOwner_Bianjin	= GetCityOwner(4);	-- 汴京的占领帮会
	local szMyTong				= GetTongName();	-- 自己的帮会
	
	-- 占城帮会数据错误
	if szCityOwner_LinAn == "" or szCityOwner_Bianjin == "" or szCityOwner_LinAn == szCityOwner_Bianjin then
		Say("此次宋金国战不允许打开", 0);
		return 0;
	end
	
	-- 通过帮会的身份进入
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 1) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 2) then
		return 1;
	end

	-- 奸细
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 2) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 1) then
		Say("敌人的间谍已经潜入大营了,赶快抓捕!", 0);
		return 0;
	end
	
	-- 检查身上的令牌
	local nCount_song = CalcItemCount(3, 6, 1, 2057, -1);
	local nCount_jin  = CalcItemCount(3, 6, 1, 2058, -1);
	
	if nCount_song == 0 and nCount_jin == 0 then
		Say("两国交战, 需要有双方的国战令才能进行.", 0);
		return 0;
	end
	
	-- 身上有别国的令牌
	if (nCount_jin ~= 0 and bt_ncamp == 1) or (nCount_song ~= 0 and bt_ncamp == 2) then
		Say("敌人的间谍已经潜入大营了,赶快抓捕!", 0);
		return 0;
	end
	
	-- 检查金钱
	if (GetCash() < 3000) then
		Say("想参加宋金战场，请支持3000两", 0)
		return 0;
	end
	
	-- 扣除令牌
	local bPay = 0;
	
	if bt_ncamp == 1 then
		bPay = ConsumeItem(3, 1, 6, 1, 2057, -1); 
	elseif bt_ncamp == 2 then
		bPay = ConsumeItem(3, 1, 6, 1, 2058, -1); 
	end
	
	if bPay ~= 1 then
		Msg2Player("扣除令牌失败");
		return 0;
	end
	
	-- 允许通过
	return 1;
end