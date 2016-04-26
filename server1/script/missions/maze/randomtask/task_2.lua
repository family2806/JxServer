-- 2.	有8个柱子，柱子前面有1个守护的钰龙高手，钰龙高手的技能使得玩家无法开启柱子。
-- 钰龙高手只能由五行克他的玩家打最后一击打死才不会重生，否则会不断重生，每次重生怪的五行都会随机一次。
-- 要求开启8个柱子才能过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
IL("NPCINFO")

pTask = Task:New(2)
pTask.m_NpcCount 	= 8
pTask.m_PillarId 	= 1653	-- 柱子
pTask.m_GuardId 	= 1796	-- 钰龙高手

function pTask:OnStart()
	self.m_Pillars = {}
	self.m_Guards = {}
	self.m_Pos = self:GetPosition()
	local pos_pillar = self.m_Pos.t2_pillar
	local pos_guard = self.m_Pos.t2_guard
	for i = 1, self.m_NpcCount do
		local nPillarIndex = DlgNpcManager:AddNpc("柱子", self.m_PillarId, self:GetMapId(), pos_pillar[i].x, pos_pillar[i].y, self, i)
		if (nPillarIndex <= 0) then
			self:LogError("TASK2: failed to create pillar")
		else
			local tb = {}
			tb.NpcIndex = nPillarIndex
			tb.Status = 0
			tb.Bars = {}
			tb.Index = i
			self.m_Pillars[i] = tb
		end
		local nGuardIndex = FightNpcManager:AddNpc("玉龙高手", self.m_GuardId, self:GetMapId(), pos_guard[i].x, pos_guard[i].y, self, i, 1, 1)
		if (nGuardIndex <= 0) then
			self:LogError("TASK2: failed to create guard")
		end
		tinsert(self.m_Guards, nGuardIndex)
	end
end

function pTask:OnDestroy()
	-- 删除柱子
	if (self.m_Pillars) then
		for i = 1, getn(self.m_Pillars) do
			local tb = self.m_Pillars[i]
			if (tb ~= nil) then
				if (tb.NpcIndex > 0) then
					DlgNpcManager:DelNpc(tb.NpcIndex)
				end
				for i = 1, getn(tb.Bars) do
					if (tb.Bars[i] > 0) then
						ProgressBarList:Close(tb.Bars[i])
					end
				end
			end
		end
		self.m_Pillars = nil
	end
	-- 删除钰龙高手
	if (self.m_Guards) then
		for i = 1, getn(self.m_Guards) do
			if (self.m_Guards[i] > 0) then
				FightNpcManager:DelNpc(self.m_Guards[i])
			end
		end
		self.m_Guards = nil
	end
end

function pTask:Say(player, nIndex)
	local tb = self.m_Pillars[nIndex]
	if (not tb) then
		self:LogError(format("TASK2: failed to find pillar[%d]", nIndex))
		return
	end
	if (tb.Status == 1) then
		player:Say("柱子已打开")
		return
	end
	local nBarId = ProgressBarList:Open("正在打开", player, 3, self, tb)
	tinsert(tb.Bars, nBarId)
end

function pTask:OnProgressbarTimeout(nId, tb)
	self:BroadCast("成功打开.")
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.Status == 1) then
		return
	end
	tb.Status = 1
	for i = 1, getn(self.m_Pillars) do
		local tb = self.m_Pillars[i]
		if (tb ~= nil and tb.Status == 0) then
			return
		end
	end
	self:Proceed()
end

function pTask:OnProgressbarBreak(nId, tb)
	self:BroadCast("打开失败.")
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
end

function pTask:CheckKiller(nNpcIndex, pPlayer)
	local nKilledSeries = GetNpcSeries(nNpcIndex)
	local nKillerSeries = pPlayer:GetSeries()
	if (IsSeriesConquer(nKillerSeries, nKilledSeries) ~= 1) then
		return 0
	else
		return 1
	end
end

function pTask:OnDeath(nKilledIndex, pKillerPlayer, nIndex)
	local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_Guards[nIndex])
	if (nNpcIndex <= 0) then
		self:LogError(format("TASK2: failed to index guard[%d]", nIndex))
		return
	end
	if (not pKillerPlayer or self:CheckKiller(nNpcIndex, pKillerPlayer) == 0) then
		local pt = self:GetPosition().t2_guard[nIndex]
		local nGuardIndex = FightNpcManager:AddNpc("玉龙高手", self.m_GuardId, self:GetMapId(), pt.x, pt.y, self, nIndex, 1, 1)
		self.m_Guards[nIndex] = nGuardIndex
	else
		self.m_Guards[nIndex] = 0
	end
end
