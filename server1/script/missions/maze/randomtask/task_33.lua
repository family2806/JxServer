-- 33.	20个小怪钰龙高手围着一个剑冢秘宝，杀完小怪才能开剑冢秘宝，开箱子有30%几率过关，30%几率继续刷小怪,40%几率继续刷剑冢秘宝
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(33)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_box = self:GetPosition().t33_box
	local pos_monster = self:GetPosition().t33_monster
	self.m_BoxIndex = DlgNpcManager:AddNpc("剑冢秘宝", 1698, mapid, pos_box.x, pos_box.y, self)
	self.m_BarId = 0
	self:AddMonsters()
end

function pTask:DelMonsters()
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:AddMonsters()
	local mapid = self:GetMapId()
	local pos_monster = self:GetPosition().t33_monster
	self.m_Monsters = {}
	for i = 1, 20 do
		local nNpcIndex = FightNpcManager:AddNpc("玉龙高手", 1695, mapid, pos_monster[i].x, pos_monster[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_BoxIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BoxIndex)
		self.m_BoxIndex = 0
	end
	self:DelMonsters()
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	self.m_Monsters[nIndex] = 0
end

function pTask:Say(pPlayer)
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("正在打开", pPlayer, 3, self)
end

function pTask:OnProgressbarTimeout(nId, param, player)
	self:BroadCast("正在打开.")
	self.m_BarId = 0
	local nNum = random(1, 100)
	if (nNum <= 30) then
		player:Say("你们正在开箱, 成功惊动到了机关，恭喜各位已过关")
		self:Proceed()
	elseif (nNum <= 60) then
		self:DelMonsters()
		self:AddMonsters()
		player:Say("你们正在开箱, 但是已经已经让怪物出现了")
	else
		player:Say("你们正在开箱, 发现里面还有一个宝箱")
	end
end

function pTask:OnProgressbarBreak(nId)
	self:BroadCast("打开失败.")
	self.m_BarId = 0
end
