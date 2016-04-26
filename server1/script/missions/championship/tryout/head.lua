Include("\\script\\missions\\championship\\head.lua")
MISSIONID = 18;
MATCH_MS_ID = 19;
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

UP_A_TIME = 15
RUN_A_TIME = 5 --报名5分钟之后，自动进入战斗赛场

MS_STATE = 1; --任务中记录任务状态的变量ID
MS_TIME_1 = 2	--每20秒加一smalltimer触发器
MS_TIME_2 = 3	--totaltimer触发器
MS_ROUND = 4	--记录当天赛事的轮次
MS_A_TIME = 5	--当前轮次用掉的时间

function Elect_RanField()
	local cnt_1 = 0
	local cnt_2 = 0
	local fieldtab = {}
	for i =1, 100 do
		fieldtab[i] = i
	end
	for i = 1, 100 do
		cnt_1 = random(1, 100) 
		a = fieldtab[cnt_1]
		cnt_2 = random(1, 100)
		fieldtab[cnt_1] = fieldtab[cnt_2]
		fieldtab[cnt_2] = a
	end
	return fieldtab
end

HIGHMEMBER_PERCENT = 20
MIDDLEMEMBER_PERCENT = 40
LOWMEMBER_PERCENT = 100 - HIGHMEMBER_PERCENT - MIDDLEMEMBER_PERCENT

function Elect_RanEnemy(plyidx)
	local num = getn(plyidx)
	local per_num = floor(num / 3);

	plyidx = cp_randomeny(1, per_num, plyidx)
	plyidx = cp_randomeny(per_num + 1, per_num * 2, plyidx)
	plyidx = cp_randomeny(per_num * 2 + 1, num, plyidx)
	
	high_count = floor(num * HIGHMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(1, high_count, plyidx)
	
	middle_count = floor(num * MIDDLEMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(high_count + 1, high_count + middle_count, plyidx)
	
	plyidx = cp_randomeny(high_count + middle_count + 1, num, plyidx)
	return plyidx
end

function cp_randomeny(q, m, tabplyidx )
	local a = 0
	local cnt_1 = 0
	local cnt_2 = 0
	for i = q, m do
		cnt_1 = random(q, m) 
		a = tabplyidx[cnt_1]
		cnt_2 = random(q, m)
		tabplyidx[cnt_1] = tabplyidx[cnt_2]
		tabplyidx[cnt_2] = a
	end
	return tabplyidx
end

function Run_CPMatch()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end
	tbPlayer = Elect_RandomPL(tbPlayer)
	return tbPlayer
end

function Elect_RandomPL(tabplayindex)
	local ncount = 0
	local tab_index = {}
	oldplayer = PlayerIndex
	if (getn(tabplayindex) > 200) then
		tabplayindex = cp_randomeny(1, getn(tabplayindex), tabplayindex )
		for i = 1, 200 do
			tab_index[i] = tabplayindex[i]
		end
		local str = "这局的比赛人数已经够了，请等下一场!"
		for i = 201, getn(tabplayindex) do 
			PlayerIndex = tabplayindex[i]
			Msg2Player(str)
		end
	else
		tab_index = tabplayindex
	end
	PlayerIndex = oldplayer
	return tab_index	
end

function join_tryout()
	if (nt_gettask(CP_TASKID_ROUND) >= CP_MAXROUND ) then
		Say("你参加舞林大会预选赛的次数已经够了.", 0)
		return
	end
	local subworldid = SubWorldIdx2ID (SubWorld)
	LeaveTeam()
	DisabledStall(1)	--禁止摆摊
	SetTaskTemp(200, 1)
	AddMSPlayer(MISSIONID,1);
	nt_settask(CP_TASKID_FLAG, 0)
	SetLogoutRV(1);
	SetCurCamp(1);
	SetFightState(0)
	SetPunish(0);
	SetPKFlag(2)
	ForbidChangePK(1);
	SetCreateTeam(0);
	ForbitTrade(1)
	SetRevPos(subworldid, 1)
	nt_settask(CP_TASKID_ENEMY, 0)
	for i = 1, getn(CP_FORBID_ITEM) do
		AddSkillState(CP_FORBID_ITEM[i][3], 20, 1, 0)
	end
	NewWorld(subworldid, CP_MAPPOS_PRE[1], CP_MAPPOS_PRE[2])
	DisabledUseTownP(1)	--限制其在准备席和比赛用地内使用回城符
	local mm = RUN_A_TIME - GetMissionV(MS_A_TIME)
	Msg2Player("你已进入比赛准备区。比赛将在"..mm.."分钟开始进行")
end

function join_match()
	WriteLog(date("%Y-%m-%d,%H:%M,").."排行"..GetMissionV(MS_ROUND).."第几"..checkmap(1).."参加门派预选赛的人数是"..GetMSPlayerCount(MISSIONID, 0))
	local fieldtab = {}
	local playertab = {}
	local org_mapindex = 0
	local org_mapid = 0
	local new_mapindex = 0
	local new_mapid = 0
	
	fieldtab = Elect_RanField()
	playertab = Run_CPMatch()
	playertab = Sort_Point(playertab)	
	playertab = Elect_RanEnemy(playertab)
	if (getn(playertab) > 200) then
		num_vs = 100
	else
		num_vs = floor (getn(playertab) / 2) 
	end
	org_mapindex = SubWorld
	org_mapid = SubWorldIdx2ID(SubWorld)
	new_mapid = org_mapid + 1
	new_mapindex = SubWorldID2Idx(new_mapid)
	orgplayeridx = PlayerIndex
	
	SubWorld = new_mapindex
	for i = 1, num_vs * 2, 2 do 
		posx = GetTabFileData(CP_MATCH_POS, fieldtab[i], 1)
		posy = GetTabFileData(CP_MATCH_POS, fieldtab[i], 2)
		org_plyidx = playertab[i]
		PlayerIndex = org_plyidx
		org_plyname = GetName()
		org_plywin = nt_gettask(CP_TASKID_WIN)
		org_plylose = nt_gettask(CP_TASKID_LOSE)
		org_plytie = nt_gettask(CP_TASKID_TIE)
		
		eny_plyidx = playertab[i + 1]
		PlayerIndex = eny_plyidx
		eny_plyname = GetName()
		eny_plywin = nt_gettask(CP_TASKID_WIN)
		eny_plylose = nt_gettask(CP_TASKID_LOSE)
		eny_plytie = nt_gettask(CP_TASKID_TIE)
		PlayerIndex = org_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i);
		nt_settask(CP_TASKID_ENEMY, i + 100)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		SetCurCamp(2)
		SetFightState(0)
		SetPKFlag(2)
		SetCreateTeam(0);
		DisabledStall(1)	--禁止摆摊
		SetTaskTemp(200, 1)
		SetLogoutRV(1);
		ForbitTrade(1)
		ForbidChangePK(1);
		SetRevPos(org_mapid, 1)
		Msg2Player("你已经入赛场，10秒后正式开始.")
		Msg2Player("你的对手"..eny_plyname.."现在结果:"..eny_plywin.."胜"..eny_plylose.."败"..eny_plytie.."和")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], 参加战斗阶段，你现在的战绩是：胜"..org_plywin.."负"..org_plylose.."和"..org_plytie..", 已参加了"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("进入比赛区域之后，不能转移背包装备，但是依旧可以使用背包和工具表中的物品。");
		SetDeathScript("\\script\\missions\\championship\\match\\playerdeath.lua");
		
		PlayerIndex = eny_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i + 100);
		nt_settask(CP_TASKID_ENEMY, i)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		SetCurCamp(3)
		SetFightState(0)
		SetPKFlag(2)
		SetCreateTeam(0);
		DisabledStall(1)	--禁止摆摊
		SetTaskTemp(200, 1)
		SetLogoutRV(1);
		ForbitTrade(1)
		ForbidChangePK(1);
		SetRevPos(org_mapid, 1)
		Msg2Player("你已进入赛场，10秒后将正式开始.")
		Msg2Player("你的对手"..org_plyname.."现在结果:"..org_plywin.."胜"..org_plylose.."败"..org_plytie.."和")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], 参加战斗阶段，你现在的战绩是：胜"..eny_plywin.."败"..eny_plylose.."和"..eny_plytie..", 已参加"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("进入比赛区域之后，不能转移背包装备，但是依旧可以使用背包和工具表中的物品");
		SetDeathScript("\\script\\missions\\championship\\match\\playerdeath.lua");
	end
	SubWorld = org_mapindex
		local playeridx = {}
		idx = 0;
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
			if (idx == 0) then 
		 		break
		 	end;
		 	playeridx[i] = pidx
		end
		if (getn(playeridx) > 1) then
			str = "这局比赛人数已足够，请等下一场!"
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				Msg2Player(str)
			end
		else
			str = "这局比赛参加者不足，不能选择你的对手，这局你已胜，得3分."
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				enyname = GetName()
				nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
				nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
				nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
				Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
				Msg2Player(str)
				WriteLog("玩家 ["..enyname.."], 由于没有对手，现在的战绩是：胜"..nt_gettask(CP_TASKID_WIN)..", 败"..nt_gettask(CP_TASKID_LOSE)..", 和"..nt_gettask(CP_TASKID_TIE)..", 最终结果"..nt_gettask(CP_TASKID_POINT))
				AddAword(GetLevel(), 20, 2)
			end
		end
	PlayerIndex = orgplayeridx
end

function GameOver()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
		camp = GetCamp();
		SetCurCamp(camp);
		SetLogoutRV(0);
		SetCreateTeam(1);
		DisabledStall(0)	--允许摆摊
		SetTaskTemp(200, 0)
		SetFightState(0);
		SetPunish(1);
		ForbidChangePK(0);
		SetPKFlag(0);
		ForbitTrade(0)
		nt_settask(CP_TASKID_ENEMY, 0)
		NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
	end
	WriteLog(date("%Y-%m-%d %H%M%S,").."此地图 ["..SubWorldIdx2ID(SubWorld).."] 今天的预选赛结束了 .")
end