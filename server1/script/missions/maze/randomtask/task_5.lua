-- 5.	24个宝箱，叫做剑冢秘宝，每打开1个就会出现3个会眩晕的怪物钰龙弟子，把剑冢秘宝开完把钰龙弟子杀完后过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(5)
pTask.m_BoxCount = 24
pTask.m_MonsterCount = 8

function pTask:OnStart()
	self.m_Boxs = {}
	self.m_Monsters = {}
	local pos = self:GetPosition().t5_box
	for i = 1, self.m_BoxCount do
		local nNpcIndex = DlgNpcManager:AddNpc("剑冢秘宝", 1698, self:GetMapId(), pos[i].x, pos[i].y, self, i)
		if (nNpcIndex <= 0) then
			self:LogError("TASK5: failed to create box npc")
		end
		local tb = {}
		tb.Index = i
		tb.NpcIndex = nNpcIndex
		tb.Timers = {}
		tinsert(self.m_Boxs, tb)
	end
end

function pTask:OnDestroy()
	for i = 1, getn(self.m_Boxs) do
		local tb = self.m_Boxs[i]
		if (tb.NpcIndex > 0) then
			DlgNpcManager:DelNpc(tb.NpcIndex)
		end
		for j = 1, getn(tb.Timers) do
			if (tb.Timers[j] > 0) then
				ProgressBarList:Close(tb.Timers[j])
			end
		end
	end
	self.m_Boxs = nil
	for i = 1, getn(self.m_Monsters) do
		local nNpcIndex = self.m_Monsters[i]
		if (nNpcIndex > 0) then
			FightNpcManager:DelNpc(nNpcIndex)
		end
	end
	self.m_Monsters = nil
end

function pTask:Say(pPlayer, nIndex)
	local tb = self.m_Boxs[nIndex]
	if (not tb) then
		self:LogError(format("TASK5: box[%d] not found", nIndex))
		return
	end
	if (tb.NpcIndex == 0) then
		return
	end
	local nId = ProgressBarList:Open("正在打开", pPlayer, 3, self, tb)
	if (nId <= 0) then
		self:LogError("TASK5: failed to open progressbar")
	end
	tinsert(tb.Timers, nId)
end

function pTask:CleanTimer(nId, tb)
	for i = 1, getn(tb.Timers) do
		if (tb.Timers[i] == nId) then
			tb.Timers[i] = 0
			return
		end
	end
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	self:CleanTimer(nId, tb)
	if (tb.NpcIndex == 0) then
		return
	end
	self:BroadCast("成功打开.")
	local task5_npc_tb = {1654,1796}
	local pos = self:GetPosition().t5_box
	for i = 1, 3 do
		local nIndex = getn(self.m_Monsters) + 1
		local nNpcId = task5_npc_tb[random(1, getn(task5_npc_tb))]
		local nNpcIndex = FightNpcManager:AddNpc("玉龙弟子", nNpcId, self:GetMapId(), pos[tb.Index].x, pos[tb.Index].y, self, nIndex, 1, 1)
		if (nNpcIndex <= 0) then
			self:LogError("TASK5: failed to create monster npc")
		end
		tinsert(self.m_Monsters, nNpcIndex)
		-- TODO: 给物品
--		player:AddItem(6, 0, 1, 1, 0, 0)
--		player:Msg2Player("你获得了一个xxx物品。")
--		Event5OpenBoxAward(player.m_PlayerIndex)
	end
	-- 删除箱子NPC
	DlgNpcManager:DelNpc(tb.NpcIndex)
	tb.NpcIndex = 0
end

function pTask:OnProgressbarBreak(nId, tb)
	self:BroadCast("打开失败.")
	self:CleanTimer(nId, tb)
end

function pTask:CheckFinish()
	for i = 1, getn(self.m_Boxs) do
		local tb = self.m_Boxs[i]
		if (tb.NpcIndex > 0) then
			-- 箱子没开完
			return 0
		end
	end
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			-- 怪没打完
			return 0
		end
	end
	return 1
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	local nNpcIndex = self.m_Monsters[nIndex]
	if (nNpcIndex > 0) then
		self.m_Monsters[nIndex] = 0
	end
	if (self:CheckFinish() == 1) then
		self:Proceed()
	end
end
