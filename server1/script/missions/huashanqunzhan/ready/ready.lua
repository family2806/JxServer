if huashanqunzhan_tbReady then
--	return 
end

Include("\\script\\missions\\huashanqunzhan\\huashanqunzhan.lua")

local tbMissionData = 
{
	nLatencyTime		= 15,
}
tbMissionData.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	RANK_COUNTER	= 3,	
}
tbMissionData.tbMissionS = 
{
	
}
huashanqunzhan_tbReady = huashanqunzhan:new(tbMissionData, huashanqunzhan) --从基类继承下来




huashanqunzhan_tbReady.tbWaitPos = 
{
	{1589, 3029},
	{1595, 2964},
	{1582, 2972},
	{1562, 2946},
	{1560, 2965},
	{1558, 2989},
	{1569, 3029},
}

function huashanqunzhan_tbReady:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)	
end

function huashanqunzhan_tbReady:OnRun()
	SetMissionV(self.tbMissionV.MISSION_STATE, 2)
end

function huashanqunzhan_tbReady:OnPlayerJoin()
	--传送到准备场
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	
	if nMissionState ~=1 and nMissionState ~= 2 then
		self:GotoSignUpPlace()
		Msg2Player("比赛未开始.")
		return Say("比赛未开始.", 0)
	end 
	
	

	if nPlayerCount >= self.nPlayerCountLimit then
		self:GotoSignUpPlace()
		Msg2Player("参加活动的人数已购，你下次再参加吧!")
		return Say("参加活动的人数已购，你下次再参加吧!", 0)
	end
	
	if GetLevel() < self.tbLevelLimit[1] then
		self:GotoSignUpPlace()
		Msg2Player(format("不够等级 %s,不能参加该级别擂台.", self.tbLevelLimit[1]))
		return Say(format("不够等级 %s,不能参加该级别擂台.", self.tbLevelLimit[1]), 0)
	elseif self.tbLevelLimit[2] and GetLevel() > self.tbLevelLimit[2] then
		self:GotoSignUpPlace()
		Msg2Player(format("你已超过级别 %s,不能参加该级别擂台.", self.tbLevelLimit[2]))
		return Say(format("你已超过级别 %s,不能参加该级别擂台.", self.tbLevelLimit[2]), 0)
	end
	if GetCash() < self.nMoney then
		self:GotoSignUpPlace()
		Msg2Player("Kh玭g  ng﹏ lng.")
		return Say("Kh玭g  ng﹏ lng.", 0)
	end
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	--设置非战斗状态 
	SetFightState(0);
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	--无死亡惩罚
	SetPunish(0);
	--关闭组队功能
	SetCreateTeam(0);
	LeaveTeam()
	--禁止仇杀
	ForbidEnmity( 1 )
	--打开PK开关 
	--开始应该都不能PK
	SetPKFlag(0)
	--禁止交易;
	DisabledStall(1);
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--禁止使用回程；
	SetCurCamp(4);	--设置临时阵营
	return 1;
end

function huashanqunzhan_tbReady:OnLeave()
	
	--关闭设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,0);
	--设置战斗状态
	SetFightState(0);
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	--SetLogoutRV(0);
	--死亡惩罚
	SetPunish(1);
	--开启组队功能
	SetCreateTeam(0);
	--打开PK开关 
	
	--设置仇杀
	ForbidEnmity( 0 )
	--开始应该都不能PK
	SetPKFlag(0)
	--关闭禁止交易;
	DisabledStall(0);
	ForbitTrade(0);
	
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	
	ForbidChangePK(0);
	DisabledUseTownP(0);	--关闭禁止使用回程；
	
end

function huashanqunzhan_tbReady:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	
	nTimerCount = nTimerCount + 1
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	local szMsg = format("还有 <color=yellow>%d<color> 分钟比赛才开始.", self.nLatencyTime - nTimerCount)
	
	
	if nTimerCount == self.nLatencyTime then
		return self:CloseGame()
	end
	Msg2MSAll(self.nMissionId, szMsg)
	
end

function huashanqunzhan_tbReady:OnClose()
	SetMissionV(self.tbMissionV.MISSION_STATE, 3)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	if (nPlayerCount <= 0) then
		return
	end;
	local bIsOpen = -1
	if nPlayerCount >= self.nMinPlayerCountLimit then
		bIsOpen = self.tbRef:StartGame()
	end
	
	
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	--self.tbRef:SetMissionV(self.tbRef.tbMissionV.PLAYER_COUNT, getn(tbPlayer));不在这里设置，可能出现问题
	for i = 1, getn(tbPlayer) do
		if bIsOpen ~= 1 then
			doFunByPlayer(tbPlayer[i], self.GotoSignUpPlace, self)
			if nPlayerCount >= self.nMinPlayerCountLimit then
				doFunByPlayer(tbPlayer[i], Msg2Player, "前方路不通，等下一场吧.")
			else
				doFunByPlayer(tbPlayer[i], Msg2Player, format("参加人数少于 %d, 比赛不能开始.",self.nMinPlayerCountLimit))
			end
		else
			local nX, nY = getadata("\\settings\\maps\\huashanqunzhan\\huashanjingji.txt")
			doFunByPlayer(tbPlayer[i], NewWorld, self.tbRef.nMapId, nX, nY)	
		end
		
	end
end

function huashanqunzhan_tbReady:GotoReadyPlace()
	local nRandId = random(1, getn(self.tbWaitPos))
	NewWorld(self.nMapId, self.tbWaitPos[nRandId][1], self.tbWaitPos[nRandId][2])
end


function huashanqunzhan_tbReady:CheckMathState()
	local nReadyState = self:GetMissionState()
	local nState = self.tbRef:GetMissionState()
	if (nReadyState ~= 1 and nReadyState ~= 2) then
		return  0 - nState
	else
		return 1
	end
end