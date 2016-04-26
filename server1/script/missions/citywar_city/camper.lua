--如果玩家是交战两个帮会之一的话，则在人数没有达到上限的前提下，让他进入地图
--如果玩家不是交战两个帮会之一的话，如果身上有合法的票的话，让他进入地图
-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame()
	curcamp=	GetCurCamp();
	camp = GetCamp();--恢复原始阵营
	SetRevPos(GetPlayerRev())
	SetFightState(0)
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetCurCamp(camp);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	NewWorld(OuterPos[curcamp][1], OuterPos[curcamp][2], OuterPos[curcamp][3])
end;

function GameOver()
	local OldPlayer = PlayerIndex;
	local PTab = {};
	for i = 1, 1000 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	local PCount = getn(PTab);
	
	-- 奖励随机5名玩家辉煌之果礼盒
	local tbRandPlayer = {};
	local nRandCount = 0;
	for i =1, PCount do
		if (nRandCount >= 5) then
			break
		end
		local nrand = random(PCount);
		if (not tbRandPlayer[nrand]) then
			nRandCount = nRandCount + 1;
			tbRandPlayer[nrand] = nrand;
		end
	end
	
	
	-- 奖励排行榜上前10名
	for i = 1, 10 do
		local szName,nZhanGong = BT_GetTopTenInfo(i, PL_TOTALPOINT);
		if szName ~= nil and szName ~= "" then
			local nTopPlayerIdx = SearchPlayer(szName);
			if (nTopPlayerIdx > 0) then
				PlayerIndex = nTopPlayerIdx;
				AddOwnExp(CITYWAR_TOP10_EXP);
				local szLog = format("%d经验", CITYWAR_TOP10_EXP);
				szLog = format("你得到攻城战奖励%s", szLog);
				Msg2Player(szLog);
				WriteLog(format("[citywar_award]\t%s\tName:%s\tAccount:%s\t%s",
							GetLocalDate("%Y-%m-%d_%H:%M"),
							szName,
							GetAccount(),
							szLog
							));
			end
		end
	end
	OldPlayer = PlayerIndex;
	
	
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		
		if (tbRandPlayer[i]) then
			citywar_awardplayer();
		end
		LeaveGame()
		SetFightState(0)
	end;
	PlayerIndex = OldPlayer;
end;

function citywar_awardplayer()
	AddItem(6,1,1075,1,1,0);
	local szLog = format("你得到攻城战奖励%s","辉煌之果礼盒")
	Msg2Player(szLog);
	WriteLog(format("[citywar_award]\t%s\tName:%s\tAccount:%s\t%s",
							GetLocalDate("%Y-%m-%d_%H:%M"),
							GetName(),
							GetAccount(),
							szLog
							));
end
-------------------------------------------------------------------------

function JoinCamp(Camp, Type)
--type == 1表示是正规军，2表示是非正规军即不是本帮会的成员
	LeaveTeam();
	if (Type == 1) then 
		if (Camp == 1) then 
			if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_CAMP1COUNT) then
				Say("现在参加守城帮会的人数已经够了，暂时不能加入!",0)
				return
			end;
		else 
			if (GetMSPlayerCount(MISSIONID, Camp) >= MAX_CAMP2COUNT) then
				Say("现在参加守城帮会的人数已经够了，暂时不能加入!",0)
				return
			end
		end;
	else
		if (Camp == 1) then 
			if (GetMSPlayerCount(MISSIONID,Camp + 2 ) >= MAX_CAMP3COUNT) then
				Say("现在参加守城帮会的人数已经够了，暂时不能加入!",0)
				return
			end;
		else 
			if (GetMSPlayerCount(MISSIONID, Camp + 2) >= MAX_CAMP4COUNT) then
				Say("现在参加帮助守城的义士人数已经够了，暂时不能加入!",0)
				return
			end
		end;
	end;

	if (Type == 1) then 	
		AddMSPlayer(MISSIONID, Camp);
	else
		AddMSPlayer(MISSIONID, Camp + 2);
	end;
	
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	
	--无死亡惩罚
	SetPunish(0);
	
	--关闭组队功能
	SetCreateTeam(0);
	
	--打开PK开关
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--设置重生点，一般是选择进入该区的城市
	SetRevPos(GetPlayerRev())
	
	--设置当前玩家的死亡脚本
	SetDeathScript("\\script\\missions\\citywar_city\\playerdeath.lua");
	
	SetFightState(0)
	--设置下次死亡的重生点
	if (Camp == 1) then
		SetTempRevPos(CS_CampPos1[1], CS_CampPos1[2]*32, CS_CampPos1[3]*32);
		
		NewWorld(CS_CampPos1[1], CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(CS_CampPos2[1], CS_CampPos2[2]*32, CS_CampPos2[3]*32);
		
		NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3])
	else 
		return
	end;

	--显示计时牌
	local gametime = floor(GetMSRestTime(MISSIONID, 13) / 18);	
	BT_UpdateMemberCount();
	BT_BroadView();
	BT_BroadAllLadder();
	BT_SetRestTime(gametime);
	BT_BroadGameData();
	BT_SortLadder();
	BT_BroadSelf()
	--显示计时牌
	
	--官衔
	bt_JudgePLAddTitle()
end;
