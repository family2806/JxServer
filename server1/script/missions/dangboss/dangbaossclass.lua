Include("\\script\\lib\\pay.lua")
Include("\\script\\missions\\basemission\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\dangboss\\taskctrl.lua")
Include("\\script\\lib\\gb_modulefuncs.lua")
local tbMissionData = 
{
	nMissionId	= 62,--
	tbTimer		= {{102,18*15}},--
	tbMapId		= {895},--默认地图	
	nReadyTime = 60 * 10,
	tbTask		= tbDangBossTaskCtrl,
	nMinPlayerCount = 10,
	nMaxPlayerCount = 200,
	szNormalPlayerDeathScript = "\\script\\missions\\dangboss\\playerdeath.lua",
	szBossPlayerDeathScript = "\\script\\missions\\dangboss\\bossdeath.lua",
	nMaxRound = 6,
	READY_STATE = 1,
	BATTLE_STATE = 2,
	CLOSE_STATE = 3,
	bIsCharged = 1,
	nKillPlayerExp = 100000,
	nMinLevel = 80,
	tbBox = {szName = "金鱼宝箱", nNpcId = 844, szScriptPath = "\\script\\missions\\dangboss\\xiangzi_npc.lua"},
	tbBossSkill = 
	{
		[1] = 
		{
			{nId = 933, nLevel = 20},
			{nId = 939, nLevel = 20, szType = "aura", nTime = 5 * 60 * 18},
			
		},
		[2] = 
		{
			{nId = 935, nLevel = 20},
			{nId = 941, nLevel = 20, szType = "aura", nTime = 5 * 60 * 18},
		},
		[3] = 
		{
			{nId = 937, nLevel = 20},
			{nId = 943, nLevel = 20, szType = "aura", nTime = 5 * 60 * 18},
		},
	},
}

tbMissionData.tbMissionV = 
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	CUR_MAPID		= 3,
	NEXT_TIME		= 4,
	WAIT_TIME		= 5,
	ROUND			= 6,
	BOSS_NAME_ID	= 7,
	BOSS_BORN_DATE	= 8,
	MATCH_ID		= 9,
	
}

tbMissionData.tbMissionS = {}

if not tbDangBoss then
	tbDangBoss = tbBaseMission:new(tbMissionData)
end



function tbDangBoss:OnInit()
	AddGlobalCountNews("斗鱼活动开始了, 大家可以到临安的掌灯宫女处报名")
	SetMissionV(self.tbMissionV.MISSION_STATE, self.READY_STATE)
	local nMapId = SubWorldIdx2ID(SubWorld)
	SetMissionV(self.tbMissionV.CUR_MAPID, nMapId)
	local nMatchId = tonumber(GetLocalDate("%y%m%d%H%M"))
	SetMissionV(self.tbMissionV.MATCH_ID, nMatchId)
end

function tbDangBoss:OnPlayerJoin()
	
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	local nCurMatchId = GetMissionV(self.tbMissionV.MATCH_ID)
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	local nMoney = 0
	local nContinueCount = self.tbTask:GetContinueCount(nCurMatchId) + 1
	
	if nMissionState ~= self.READY_STATE and nMissionState ~= self.BATTLE_STATE  then
		Msg2Player("活动还没有开始.")
		self:GotoSignUpPlace()
		return 0
	end
	
	if nPlayerCount >= self.nMaxPlayerCount then
		Msg2Player("真可惜,报名人数已经够了.请等一等")
		self:GotoSignUpPlace()
		return 0
	end
	
	if self.tbTask:GetJoinCount() >= self.tbTask.nMaxJoinCount then
		Msg2Player(format("每个人最多只能参加 %d次活动", self.tbTask.nMaxJoinCount))
		self:GotoSignUpPlace()
		return 0
	end
	
	
	if nMissionState == self.BATTLE_STATE then
		nMoney = nContinueCount * 1e5
	end
	
	if self:IsPlayerEligible() ~= 1 then
		Msg2Player(format(" %d级以上和 %s才可以参加", self.nMinLevel, (self.bIsCharged == 1 and "交") or ""))
		self:GotoSignUpPlace()
		return 0
	end
	
	
	if nMoney > 0 then
		if Pay(nMoney) ~= 1 then
			Msg2Player(format("付 %d银两才可以进去.", nMoney))
			self:GotoSignUpPlace()
			return 0
		else
			local szMsg = format("Account %s\tName %s\tpay %d money", GetAccount(), GetName(), nMoney)
			self:WriteLog(szMsg)
			Msg2Player(format("已付 %d银两", nMoney))
		end
	end
	
	
	self.tbTask:AddJoinCount(nCurMatchId)
	
	if nMissionState == self.BATTLE_STATE then
		self.tbTask:AddContinueCount(nCurMatchId) --接关次数~
	end
	
	SetTaskTemp(200, 1);		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetLogoutRV(1);	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetPunish(0);		--无死亡惩罚
	SetCreateTeam(0);	--关闭组队功能
	
	ForbidEnmity(1)	--设置仇杀
	DisabledStall(1);	--禁止交易;
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--禁止使用回程；
	SetFightState(1);
	SetPKFlag(1)
	SetCurCamp(1);
	SetDeathType(-1)
	SetDeathScript(self.szNormalPlayerDeathScript);
	return 1
end

function tbDangBoss:OnLeave()
	if self:IsBoss(PlayerIndex) == 1 then
		self:BossOnDeath()
	end
	self:BecomeNormal()
	SetMoveSpeed(-2);
	RestoreOwnFeature();    --变成原来样子
	
	SetTaskTemp(200,0);
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(0);
	ForbidEnmity( 0 )
	SetPKFlag(0)
	DisabledStall(0);
	ForbitTrade(0);
	SetCurCamp(GetCamp());
	ForbidChangePK(0);
	DisabledUseTownP(0);	--禁止使用回程；
	SetDeathScript("");
	SetDeathType(0)	
end

function tbDangBoss:OnTimer()
	local nMapId	= GetMissionV(self.tbMissionV.CUR_MAPID)
	local nTimerCount	= GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nMissionState	= GetMissionV(self.tbMissionV.MISSION_STATE)
	local nNextTime	= GetMissionV(self.tbMissionV.NEXT_TIME)
	local nWaitTime	= GetMissionV(self.tbMissionV.WAIT_TIME)
	local nRound	= GetMissionV(self.tbMissionV.ROUND)
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	self:Debug(format("nMapId %d, nTimerCount %d, nMissionState %d, nNextTime %d, nWaitTime %d, nRound %d", nMapId, nTimerCount, nMissionState, nNextTime, nWaitTime, nRound))
	
	
	
	nTimerCount = nTimerCount + 15
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	
	if nMissionState == self.READY_STATE then
	
		if nTimerCount >= self.nReadyTime then
			return self:TranBattleState(nMapId, nPlayerCount)
		else
			Msg2MSAll(self.nMissionId, format("还有<color=yellow>%d<color> 秒活动开始", self.nReadyTime - nTimerCount))
		end
	end
	
	if nMissionState == self.BATTLE_STATE then
		if nRound >= self.nMaxRound and nTimerCount >= nNextTime then
			self:ClearAllBox()
			Msg2MSAll(self.nMissionId, "活动结束")
			return self:CloseGameInMap(nMapId)	
		end	
		
		if nRound < self.nMaxRound and mod(nTimerCount, 30) and self:IsBossExist() then
			local szMsg = format("还有<color=yellow>%d<color>秒化妆成金鱼", nNextTime - nTimerCount)
			Msg2MSAll(self.nMissionId, szMsg)
		end
		
		if nTimerCount == nNextTime and nRound < self.nMaxRound then
			self:ClearAllBox()
			return self:ChangeBoss()
		end
		
		if nTimerCount == nWaitTime then
			return self:RefreshBox()
		end		
		
		
	end
	
end

function tbDangBoss:ClearAllBox()
	local nMapId	= GetMissionV(self.tbMissionV.CUR_MAPID)
	ClearMapNpcWithName(nMapId, self.tbBox.szName)
end

function tbDangBoss:TranBattleState(nMapId, nPlayerCount)
	local szMsg = format("map %d\tplayer count?%d", nMapId, nPlayerCount)
	self:WriteLog(szMsg)
	if nPlayerCount < self.nMinPlayerCount then
		Msg2MSAll(self.nMissionId, format("<color=green>人数不够 %d,此层活动取消!<color>", self.nMinPlayerCount))
		return self:CloseGameInMap(nMapId)	
	else
		Msg2MSAll(self.nMissionId, "<color=green>活动开始!<color>")
		SetMissionV(self.tbMissionV.MISSION_STATE, self.BATTLE_STATE)
		SetMissionV(self.tbMissionV.WAIT_TIME, 0)
		return self:ChangeBoss()	
	end
end


function tbDangBoss:_GetPlayerTable(nGroupId)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	local tbBoss		= {}
	nGroupId = nGroupId or 0
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, nGroupId)
	
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, nGroupId);
		if (pidx > 0) then
			if self:IsBoss(pidx) == 1 then
				tinsert(tbBoss, {nIndex = pidx} )
			else
				tinsert(tbPlayer, {nIndex = pidx} )
			end
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	return tbPlayer, tbBoss
end

function tbDangBoss:ChangeBoss()
	local nTimerCount	= GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nRound	= GetMissionV(self.tbMissionV.ROUND)
	SetMissionV(self.tbMissionV.NEXT_TIME, nTimerCount + 60 * 5)
	SetMissionV(self.tbMissionV.ROUND, nRound + 1)
	local tbPlayer, tbBoss = self:_GetPlayerTable(nGroupId)
	
	for i=1, getn(tbBoss) do
		doFunByPlayer(tbBoss[i].nIndex, self.AddBossAward, self)
	end
	if tbPlayer and getn(tbPlayer) > 0 then	
		doFunByPlayer(tbPlayer[random(1, getn(tbPlayer))].nIndex, self.BecomeBoss, self)
	end
	
end

function tbDangBoss:AddBossAward()
	local szName = GetName()
	local szMsg = format("<color=yellow>%s<color> 变身成金鱼有无双的生命力", szName)
	Msg2MSAll(self.nMissionId, szMsg)
	self:BecomeNormal()
	self.tbTask:AddAwardCount()
end


function tbDangBoss:BecomeNormal()
	SetMoveSpeed(-1)
	SetCurCamp(1)
	RestoreOwnFeature()
	for i=1, getn(self.tbBossSkill) do
		local tbSkill = self.tbBossSkill[i]
		for j=1, getn(tbSkill) do
			if tbSkill[j].szType and tbSkill[j].szType == "aura" then
				RemoveSkillState(tbSkill[j].nId)
			else
				DelMagic(tbSkill[j].nId)
			end
		end
	end
	SetDeathScript(self.szNormalPlayerDeathScript);
end

function tbDangBoss:BecomeBoss()
	SetMissionV(self.tbMissionV.BOSS_NAME_ID, FileName2Id( GetName() ) )
	SetMissionV(self.tbMissionV.BOSS_BORN_DATE, GetRoleCreateTimeData() )
	SetCurCamp(2)
	SetMoveSpeed(20)
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	local nLevel = random(1, getn(self.tbBossSkill) )
	local tbSkill = self.tbBossSkill[nLevel]
	local tbBossFace = 
	{
		[3] = 1395,
		[2] = 1396,
		[1] = 1397
	}
	
	ChangeOwnFeature( 0,0,tbBossFace[nLevel])
	
	for i=1, getn(tbSkill) do
		if tbSkill[i].szType == "aura" then
			local nLevel = ceil(nPlayerCount * tbSkill[i].nLevel / self.nMaxPlayerCount)
			AddSkillState(tbSkill[i].nId, 20, tbSkill[i].nType, tbSkill[i].nTime)
		else
			AddMagic(tbSkill[i].nId, tbSkill[i].nLevel)
		end
	end
	RestoreMana();
	RestoreLife();
	RestoreStamina();

	local tbBossName = 
	{
		[3] = "大力鱼",
		[2] = "金刚鱼",
		[1] = "鱼魔王"
	}
	
	SetDeathScript(self.szBossPlayerDeathScript);
	local szFile = "\\settings\\maps\\chunfenggu\\niu.txt"
	local nPosX, nPosY = getadata(szFile);
	SetPos(floor(nPosX / 32), floor(nPosY / 32));
	Msg2MSAll(self.nMissionId, format("<color=yellow>%s<color> 变身成 <color=yellow>%s<color>, 赶快去抓 ,现在在(%d,%d)", GetName(), tbBossName[nLevel], floor(nPosX / 32 / 8), floor(nPosY / 32 / 16)))
end

function tbDangBoss:RefreshBox()
	Msg2MSAll(self.nMissionId, "周围出现很多宝箱,我们还是赶快去开宝箱吧!")
	local nMapId	= GetMissionV(self.tbMissionV.CUR_MAPID)
	local szFile = "\\settings\\maps\\chunfenggu\\xiangzi.txt"
	local nCount = ceil(GetMSPlayerCount(self.nMissionId, 0) * 1.2)
	local tbPoint = getndata(szFile, nCount);
	local nTimerCount	= GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nNextTime	= GetMissionV(self.tbMissionV.NEXT_TIME)
	local nWaitTime	= GetMissionV(self.tbMissionV.WAIT_TIME)

	for i=1, getn(tbPoint) do
		self:Debug(tbPoint[i][1]/32,tbPoint[i][2]/32)
		basemission_CallNpc(self.tbBox, nMapId, tbPoint[i][1],tbPoint[i][2])
	end
	
end

function tbDangBoss:BossOnDeath(nNpcIndex)	
	local nTimerCount	= GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nNextTime	= GetMissionV(self.tbMissionV.NEXT_TIME)
	local nWaitTime	= GetMissionV(self.tbMissionV.WAIT_TIME)
	nWaitTime = nTimerCount + 15
	nNextTime = nWaitTime + 60
	SetMissionV(self.tbMissionV.NEXT_TIME, nNextTime)
	SetMissionV(self.tbMissionV.WAIT_TIME, nWaitTime)
	local nPlayerIndex = NpcIdx2PIdx(nNpcIndex);
	local szMsg = format("%s 变身成金鱼已经被打跑了, 朝廷将重赏各位斗鱼英才. <enter>之后<color=yellow>%d<color>将会出现很多宝箱, 各位要注意了！", GetName(), nWaitTime - nTimerCount)
	Msg2MSAll(self.nMissionId, szMsg)
	SetMissionV(self.tbMissionV.BOSS_NAME_ID, 0)
	SetMissionV(self.tbMissionV.BOSS_BORN_DATE, 0)
	self:BecomeNormal()
end

function tbDangBoss:GiveKillPlayerExp()
	local nExp = self.nKillPlayerExp
	if self.tbTask:GetKillPlayerExp() < self.tbTask.nMaxKillPlayerExp then
		self.tbTask:AddKillPlayerExp(nExp)		
		tbAwardTemplet:GiveAwardByList({nExp = nExp}, format("打败玩家: %s",GetName()) )
	else
		Msg2Player("打败获得经验值最高的玩家.")
	end
	
end

function tbDangBoss:PlayerOnDeath(nNpcIndex)
	
	local nPlayerIndex = NpcIdx2PIdx(nNpcIndex);
	
	if nPlayerIndex > 0 and self:IsBoss(nPlayerIndex) == 1 then
		doFunByPlayer(nPlayerIndex, self.GiveKillPlayerExp, self)
		
		local szBossName = doFunByPlayer(nPlayerIndex, GetName)
		local szName = GetName()
		Msg2MSPlayer(self.nMissionId, format("金鱼 %s 打败 %s!", szBossName, szName))
	end
	
	
end

function tbDangBoss:IsBoss(nPlayerIndex)
	local nBossNameId = tonumber(format("%u", GetMissionV(self.tbMissionV.BOSS_NAME_ID)))
	local nBossBornDate = GetMissionV(self.tbMissionV.BOSS_BORN_DATE)
	local szPlayerName = doFunByPlayer(nPlayerIndex, GetName)
	local nPlayerBornDate = doFunByPlayer(nPlayerIndex, GetRoleCreateTimeData)
	return (FileName2Id(szPlayerName) == nBossNameId and nPlayerBornDate == nBossBornDate)
end

function tbDangBoss:IsBossExist()
	local nBossNameId = tonumber(format("%u", GetMissionV(self.tbMissionV.BOSS_NAME_ID)))
	local nBossBornDate = GetMissionV(self.tbMissionV.BOSS_BORN_DATE)
	
	return nBossNameId ~= 0 and nBossBornDate ~= 0
	
end

function tbDangBoss:OnClose()
	
	SetMissionV(self.tbMissionV.MISSION_STATE, self.CLOSE_STATE)
	local tbPlayer, tbBoss = self:_GetPlayerTable(nGroupId)
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, self.GotoSignUpPlace, self)
	end
	for i=1, getn(tbBoss) do
		doFunByPlayer(tbBoss[i].nIndex, self.AddBossAward, self)
		doFunByPlayer(tbBoss[i].nIndex, self.GotoSignUpPlace, self)
	end
	
end

function tbDangBoss:GotoSignUpPlace()
	local nMapId, nPosX, nPosY = self.tbTask:GetLastPos()
	
	if nMapId == 0 or nPosX == 0 or nPosY == 0 then
		nMapId = 176
		nPosX = 1657
		nPosY = 3261
	end
	NewWorld(nMapId, nPosX, nPosY)
end

function tbDangBoss:GotoBattlePlace()
	for i=1, getn(self.tbMapId) do
		if SubWorldID2Idx(self.tbMapId[i]) >= 0 then
			local nMapId = self.tbMapId[i]
			local szFile = "\\settings\\maps\\chunfenggu\\ren.txt";
			local nPosX, nPosY = getadata(szFile);
			NewWorld(nMapId, floor(nPosX / 32), floor(nPosY / 32));
			return 
		end
	end
end

function tbDangBoss:ChaosTable(tb)
	local nCount = getn(tb)
	for i = 1, nCount do 
		local j = random(1,nCount)
		tb[i], tb[j] = tb[j], tb[i];
	end
end


function tbDangBoss:WriteLog(szMsg)
	WriteLog(format("[%s]\t%s\t%s.", "dou niu mission",GetLocalDate("%Y-%m-%d %H:%M"), szMsg))
end


function tbDangBoss:IsPlayerEligible()
	return GetLevel() >= self.nMinLevel and (self.bIsCharged ~= 1 or (self.bIsCharged == 1 and IsCharged() == 1))
end

function tbDangBoss:Debug(...)
	--return call(print,arg)
end