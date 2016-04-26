-- 34.	四个柱子，每个柱子周围有4个小怪，柱子周围的小怪钰龙弟子杀死后可以开柱子（3秒进度条），柱子的名字是一个字，
-- 4个柱子的名字加起来是一个词语，要按照顺序开启才能过关，否则就会招出很难打的BOSS刘骏，打死BOSS或者按顺序开柱子过关
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(34)

tbTASK34_IDIOM = {
	{"剑", "侠", "情", "缘"},
	{"风", "云", "再", "起"},
	{"江", "湖", "豪", "杰"},
	{"巾", "帼", "英", "雄"},
}

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_pillar = self:GetPosition().t34_pillar
	local pos_monster = self:GetPosition().t34_monster
	self.m_Pillars = {}
	self.m_Index = 1
	self.m_BossIndex = 0
	local idiom = tbTASK34_IDIOM[random(1, 4)]
	for i = 1, 4 do
		local nNpcIndex = DlgNpcManager:AddNpc(idiom[1], 1653, mapid, pos_pillar[i].x, pos_pillar[i].y, self, i)
		tinsert(self.m_Pillars, nNpcIndex)
	end
	self.m_Monsters = {}
	for i = 1, 16 do
		local nNpcIndex = FightNpcManager:AddNpc("玉龙弟子", 1654, mapid, pos_monster[i].x, pos_monster[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
	self.m_BarId = 0
end

function pTask:OnDestroy()
	if (self.m_Pillars) then
		for i = 1, getn(self.m_Pillars) do
			DlgNpcManager:DelNpc(self.m_Pillars[i])
		end
		self.m_Pillars = nil
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
end

function pTask:Say(player, nIndex)
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("打开", player, 3, self, nIndex)
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex > 0) then
		self.m_Monsters[nIndex] = 0
	else
		self.m_BossIndex = 0
		self:Proceed()
	end
end

function pTask:OnProgressbarTimeout(nId, nIndex)
	self.m_BarId = 0
	if (nIndex == self.m_Index) then
		if (nIndex == 4) then
			self:Proceed()
		else
			self.m_Index = self.m_Index + 1
		end
	elseif (self.m_BossIndex == 0) then
		local mapid = self:GetMapId()
		local pos = self:GetPosition().t34_boss
		self.m_BossIndex = FightNpcManager:AddNpc("刘俊", 1655, mapid, pos.x, pos.y, self, 0, 1, 1)
	end
end

function pTask:OnProgressbarBreak(nId, nIndex)
	self.m_BarId = 0
end
