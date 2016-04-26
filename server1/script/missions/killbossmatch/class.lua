Include("\\script\\lib\\pay.lua")
Include("\\script\\missions\\basemission\\class.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\activitysys\\functionlib.lua")

Include("\\script\\lib\\awardtemplet.lua")

--Include("\\script\\player\\playerevent.lua")


local tbMissionData = 
{
	nMissionId	= 69,--
	tbTimer		= {{113,18*5}},--计时器Id98 1秒一次
	tbMapId		= {907,908,909,910,911,912,913,914,915,916},--默认地图
	nLatencyTime= 60*25, --活动时间
	TSK_nCountPerDay = 1864,
	
	tbNpc = 
	{
		{nNpcId = 1481, szName = "一鬼", nLevel = 100, nSeries = 0, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1485, szName = "二鬼", nLevel = 100, nSeries = 1, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1488, szName = "三鬼", nLevel = 100, nSeries = 1, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1483, szName = "四鬼", nLevel = 100, nSeries = 2, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1482, szName = "五鬼", nLevel = 100, nSeries = 2, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1480, szName = "六鬼", nLevel = 100, nSeries = 3, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1489, szName = "七鬼", nLevel = 100, nSeries = 3, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1486, szName = "八鬼", nLevel = 100, nSeries = 4, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1487, szName = "九鬼", nLevel = 100, nSeries = 4, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		{nNpcId = 1484, szName = "十鬼", nLevel = 100, nSeries = 0, szDeathScript = "\\script\\missions\\killbossmatch\\npcdeath.lua"},
		
		
	},
	tbNpcPos = 
	{
		{1266,3241},
		{1330,3313},
		{1422,3467},
		{1607,3347},
		{1647,3301},
		{1545,3282},
		{1445,3368},
		{1402,3277},
		{1444,3210},
		{1485,3175},
		{1421,3120},
		{1505,3431},
	},
	tbRankAward = 
	{
		[1]  = {nExp = 40000000},
		[2]  = {nExp = 30000000},
		[3]  = {nExp = 20000000},
		[4]  = {nExp = 15000000},
		[5]  = {nExp = 15000000},
		[6]  = {nExp = 15000000},
		[7]  = {nExp = 10000000},
		[8]  = {nExp = 10000000},
		[9]  = {nExp = 10000000},
		[10] = {nExp = 10000000},

	},
}

tbMissionData.tbMissionV = 
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	CUR_MAPID		= 3,
	KILL_COUNT		= 4,
	KILL_TIME		= 5,
}

tbMissionData.tbMissionS = {}


if not tbKillBossMatch then
	tbKillBossMatch = tbBaseMission:new(tbMissionData)
end

function tbKillBossMatch:OnInit()
	
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
	SetMissionV(self.tbMissionV.KILL_COUNT, 0)
	
	local nMapId = SubWorldIdx2ID(SubWorld)
	SetMissionV(self.tbMissionV.CUR_MAPID, nMapId)
	self.nRank = 0
	ClearMapNpc(nMapId)
	ClearMapObj(nMapId)
	ClearMapTrap(nMapId)
	self:_RefreshNpc(nMapId)
	
end



function tbKillBossMatch:OnPlayerJoin()
	
	
	if self:_CheckMission() ~= 1 then
		self:GotoSignUpPlace()
		return 0
	end
--	if GetMSPlayerCount(self.nMissionId, 0) == 0 then
--		SetMissionV(self.tbMissionV.KILL_TIME, GetCurServerTime());
--	end
	
	PlayerFunLib:AddTaskDaily(self.TSK_nCountPerDay, 1)
	
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
	SetPKFlag(0)
	SetCurCamp(1);
	
	return 1
end


function tbKillBossMatch:OnLeave()

	SetTaskTemp(200,0);
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(1);
	ForbidEnmity( 0 )
	SetPKFlag(0)
	DisabledStall(0);
	ForbitTrade(0);
	SetCurCamp(GetCamp());
	ForbidChangePK(0);
	DisabledUseTownP(0);	--禁止使用回程；
end


function tbKillBossMatch:OnTimer()
	local nMapId = GetMissionV(self.tbMissionV.CUR_MAPID)
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	
	nTimerCount = nTimerCount + 5
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	
	
	if nTimerCount < self.nLatencyTime then
		local szMsg	= format("时间还有 <color=yellow>%d<color> 秒.", self.nLatencyTime - nTimerCount)
		if mod(nTimerCount, 10) == 0 then
			Msg2MSAll(self.nMissionId, szMsg);
		end
		return 
	end
	print(GetMissionV(self.tbMissionV.KILL_COUNT), GetMissionV(self.tbMissionV.KILL_TIME))
	if GetMissionV(self.tbMissionV.KILL_COUNT) >= getn(self.tbNpc) and GetMissionV(self.tbMissionV.KILL_TIME) + 15 <= nTimerCount then
		--最后boss死亡
		
		self:CloseGameInMap(nMapId)
	end
	
	
	if nTimerCount >= self.nLatencyTime then
		self:CloseGameInMap(nMapId)
		return 
	end	
end


function tbKillBossMatch:_RefreshNpc(nMapId)
	local tbTempPos = lib:CopyTB1(self.tbNpcPos)
	local tbTempNpc = lib:CopyTB1(self.tbNpc)
	self:ChaosTable(tbTempPos)
	self:ChaosTable(tbTempNpc)

	for i=1, 5 do
		
		basemission_CallNpc(tbTempNpc[i], nMapId, tbTempPos[i][1] * 32, tbTempPos[i][2] * 32) 
		basemission_CallNpc(tbTempNpc[i+5], nMapId, tbTempPos[i][1] * 32 + 32, tbTempPos[i][2] * 32 + 32) 
	end
end

function tbKillBossMatch:DoFunByAllPlayer(pFun, ...)
	tbPlayer = self:_GetPlayerTable(0)
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, pFun, unpack(arg))
	end
end

function tbKillBossMatch:GiveRankAward()
	
	if self.tbRankAward[self.nRank] then

		self:DoFunByAllPlayer(tbAwardTemplet.GiveAwardByList, tbAwardTemplet, self.tbRankAward[self.nRank], format("KillBossMatch,rank_%d_award", self.nRank))
		
	end
end

function tbKillBossMatch:OnKillNpc(nNpcIndex, nAttackIndex)
	local nMapId = GetMissionV(self.tbMissionV.CUR_MAPID)
	
	local nCount = GetMissionV(self.tbMissionV.KILL_COUNT) + 1
	SetMissionV(self.tbMissionV.KILL_COUNT, nCount) --个数
	SetMissionV(self.tbMissionV.KILL_TIME, GetMissionV(self.tbMissionV.SECOND_COUNTER)) --时间
	
	self:DoFunByAllPlayer(AddOwnExp, 5000000)
	
	if nCount >= getn(self.tbNpc) then
	--if nCount >= 1 then
		self.nRank = self.nRank + 1
		self:GiveRankAward()
	end
end



function tbKillBossMatch:_GetPlayerTable(nGroupId)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	nGroupId = nGroupId or 0
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, nGroupId)
	
	
	
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, nGroupId);
		if (pidx > 0) then
			tbPlayer[i] = {}
			tbPlayer[i].nIndex = pidx	
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	return tbPlayer
end



function tbKillBossMatch:KickAllPlayer()
	local tbPlayer = self:_GetPlayerTable(0)
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, self.GotoSignUpPlace, self)
	end
end

function tbKillBossMatch:OnClose()		
	SetMissionV(self.tbMissionV.MISSION_STATE, 3)
	
	
	self:KickAllPlayer()
	
	
end




function tbKillBossMatch:GotoMarchScene(nGroupId)
	
	local nMapId = self.tbMapId[nGroupId] or self.tbMapId[1]

	
	local tbPosList = 
	{
		{1476, 3274},
		{1579, 3186}
	}
	local tbPos = tbPosList[random(1,2)]
	NewWorld(nMapId, tbPos[1], tbPos[2]);
end

function tbKillBossMatch:GotoSignUpPlace()
	local nMapId, nPosX, nPosY = self:GetLastPos()
	if nMapId == 0 or nPosX == 0 or nPosY == 0 then
		nMapId = 11
		nPosX = 3143
		nPosY = 5065
	end
	NewWorld(nMapId, nPosX, nPosY)
end

function tbKillBossMatch:ChaosTable(tb)
	local nCount = getn(tb)
	for i = 1, nCount do 
		local j = random(1,nCount)
		tb[i], tb[j] = tb[j], tb[i];
	end
end

function tbKillBossMatch:IsPlayerEligible()
	return GetLevel() >= self.nMinLevel and (self.bIsCharged ~= 1 or (self.bIsCharged == 1 and IsCharged() == 1))
end

function tbKillBossMatch:WriteLog(szMsg)
	
	WriteLog(format("[%s]\t%s\t%s.", "wabao mission",GetLocalDate("%Y-%m-%d %H:%M"), szMsg))
end

function tbKillBossMatch:_CheckMission()
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	if nMissionState ~= 1 then
		Msg2Player("<color=yellow>目前不是报名时间<color>")
		return
	end
	if self.nMaxPlayerCount and nPlayerCount > self.nMaxPlayerCount then
		Msg2Player("参加活动的人数已够了，请等下一轮吧!")
		return 
	end
	return 1
end