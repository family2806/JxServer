Include("\\script\\lib\\pay.lua")
Include("\\script\\missions\\basemission\\class.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\missions\\killbossmatch\\class.lua")

local tbMissionData = 
{
	nMissionId	= 68,--
	tbTimer		= {{112,18*5}},--计时器Id98 1秒一次
	tbMapId		= {906},--默认地图
	nReadyTime = 60*5,
	nMaxPlayerCount = 200,
	nMinLevel = 120,
	
	nPlayerCountPerGroup = 20,
	TSK_nCountPerDay = 1864,
	TSK_IsUsePerDay = 1914
}

tbMissionData.tbMissionV = 
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	CUR_MAPID		= 3,
}

tbMissionData.tbMissionS = {}


if not tbKillBossMatch_ready then
	tbKillBossMatch_ready = tbBaseMission:new(tbMissionData)
end

function tbKillBossMatch_ready:OnInit()
	
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
	local nMapId = SubWorldIdx2ID(SubWorld)
	SetMissionV(self.tbMissionV.CUR_MAPID, nMapId)
end


function tbKillBossMatch_ready:GotoReadyScene()
	local nMapId = self.tbMapId[1]
	for i=1, getn(self.tbMapId) do
		if SubWorldID2Idx(self.tbMapId[i]) >= 0 then
			nMapId = self.tbMapId[i]
			break
		end
	end	
	
	self:SetLastPos(GetWorldPos())
	
	nPosX, nPosY = getadatatow("\\settings\\maps\\chrismas\\player.txt", 2, 15);
	NewWorld(nMapId, floor(nPosX/32), floor(nPosY/32))
end

function tbKillBossMatch_ready:_CheckMission()
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	print(nMissionState)
	if nMissionState ~= 1 then
		Msg2Player("<color=yellow>目前不是报名时间<color>")
		return
	end
	if self.nMaxPlayerCount and nPlayerCount > self.nMaxPlayerCount then
		Msg2Player("参加活动的人数已够，请等下一轮吧!")
		return 
	end
	return 1
end

function tbKillBossMatch_ready:OnPlayerJoin()
	
	
	if self:_CheckMission() ~= 1 or self:IsPlayerEligible() ~= 1 then
		self:GotoSignUpPlace()
		return 0
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
	SetFightState(0);
	SetPKFlag(0)
	SetCurCamp(1);
	
	return 1
end


function tbKillBossMatch_ready:OnLeave()

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




function tbKillBossMatch_ready:OnTimer()
	local nMapId = GetMissionV(self.tbMissionV.CUR_MAPID)
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)	
	nTimerCount = nTimerCount + 5
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	
	
	if nTimerCount < self.nReadyTime then
		local szMsg	= format("准备时间还有 <color=yellow>%d<color> 秒", self.nReadyTime - nTimerCount)
		if mod(nTimerCount, 10) == 0 then
			Msg2MSAll(self.nMissionId, szMsg);
		end
		return 
	end
	
	if nTimerCount >= self.nReadyTime then		
		if tbKillBossMatch:StartGame() == 1 then
			self:GroupingPlayer()
		end
		return self:CloseGameInMap(nMapId)
	end
end



function tbKillBossMatch_ready:_GetPlayerTable(nGroupId)
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


function tbKillBossMatch_ready:GroupingPlayer()
	local tbPlayer = self:_GetPlayerTable(0)
	self:ChaosTable(tbPlayer)
	local j = 1;
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, self.GotoMarchScene, self, j)
		if mod(i, self.nPlayerCountPerGroup) == 0 then
			j = j + 1
		end
	end
end

function tbKillBossMatch_ready:KickAllPlayer()
	local tbPlayer = self:_GetPlayerTable(0)
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, self.GotoSignUpPlace, self)
	end
end

function tbKillBossMatch_ready:OnClose()		
	SetMissionV(self.tbMissionV.MISSION_STATE, 3)
	Msg2MSAll(self.nMisssionId, "不能移动到其他地图.")
	self:KickAllPlayer()
end

function tbKillBossMatch_ready:GotoMarchScene(nGroupId)
	
	tbKillBossMatch:GotoMarchScene(nGroupId)
	
end

function tbKillBossMatch_ready:GotoSignUpPlace()
	local nMapId, nPosX, nPosY = self:GetLastPos()
	if nMapId == 0 or nPosX == 0 or nPosY == 0 then
		nMapId = 11
		nPosX = 3143
		nPosY = 5065
	end
	NewWorld(nMapId, nPosX, nPosY)
end

function tbKillBossMatch_ready:ChaosTable(tb)
	local nCount = getn(tb)
	for i = 1, nCount do 
		local j = random(1,nCount)
		tb[i], tb[j] = tb[j], tb[i];
	end
end

function tbKillBossMatch_ready:IsPlayerEligible()
	
	if PlayerFunLib:CheckIsTransLife("") ~= 1 and PlayerFunLib:CheckLevel(self.nMinLevel, "", ">=") ~= 1 then
		Msg2Player(format("需要 %d 级以上或者人物已转生才能参加活动", self.nMinLevel))
		return 
	end
	
	if PlayerFunLib:IsCharged("需要充值才能参加") ~= 1 then
		return 
	end
	
	--TSK_IsUsePerDay
	
	if PlayerFunLib:GetTaskDailyCount(self.TSK_nCountPerDay) >= 1 + PlayerFunLib:GetTaskDailyCount(self.TSK_IsUsePerDay) then
	
		Msg2Player("每天每个人物只能参加一次平安季活动")
		return
	end
	
	
	return 1
end

function tbKillBossMatch_ready:WriteLog(szMsg)
	
	WriteLog(format("[%s]\t%s\t%s.", "wabao mission",GetLocalDate("%Y-%m-%d %H:%M"), szMsg))
end