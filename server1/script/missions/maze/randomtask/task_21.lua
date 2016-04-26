-- 21.	出现10个钰龙弟子（女）和10个钰龙弟子（男），要求把男怪全部杀死才能过关，但是每杀死一个女怪就会出现1个新的怪（男女随机）
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(21)
pTask.m_BaseIndex = 10000
pTask.m_BoyId = 1629
pTask.m_GirlId = 1800

function pTask:OnStart()
	self.m_Boys = {}
	self.m_Girls = {}
	local mapid = self:GetMapId()
	local pos_boy = self:GetPosition().t21_boy
	local pos_girl = self:GetPosition().t21_girl
	for i = 1, 10 do
		local tb = {}
		tb.Pos = pos_boy[i]
		tb.Index = i
		tb.IsBoy = 1
		local nNpcIndex = FightNpcManager:AddNpc("玉龙男弟子", self.m_BoyId, mapid, tb.Pos.x, tb.Pos.y, self, tb, 1, 1)
		tinsert(self.m_Boys, nNpcIndex)
	end
	for i = 1, 10 do
		local tb = {}
		tb.Pos = pos_girl[i]
		tb.Index = i
		tb.IsBoy = 0
		local nNpcIndex = FightNpcManager:AddNpc("玉龙女弟子", self.m_GirlId, mapid, tb.Pos.x, tb.Pos.y, self, tb, 1, 1)
		tinsert(self.m_Girls, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_Boys) then
		for i = 1, getn(self.m_Boys) do
			if (self.m_Boys[i] > 0) then
				FightNpcManager:DelNpc(self.m_Boys[i])
			end
		end
		self.m_Boys = nil
	end
	if (self.m_Girls) then
		for i = 1, getn(self.m_Girls) do
			if (self.m_Girls[i] > 0) then
				FightNpcManager:DelNpc(self.m_Girls[i])
			end
		end
		self.m_Girls = nil
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, tb)
	if (tb.IsBoy == 1) then
		-- 男怪
		self.m_Boys[tb.Index] = 0
		for i = 1, getn(self.m_Boys) do
			if (self.m_Boys[i] > 0) then
				return
			end
		end
		self:Proceed()
	else
		-- 女怪
		self.m_Girls[tb.Index] = 0
		local mapid = self:GetMapId()
		for i = 1, 2 do
			local inf = {}
			inf.Pos = tb.Pos
			if (random(0, 1) == 1) then
				inf.Index = getn(self.m_Boys) + 1
				inf.IsBoy = 1
				local nNpcIndex = FightNpcManager:AddNpc("玉龙男弟子", self.m_BoyId, mapid, tb.Pos.x, tb.Pos.y, self, inf, 1, 1)
				tinsert(self.m_Boys, nNpcIndex)
			else
				inf.Index = getn(self.m_Girls) + 1
				inf.IsBoy = 0
				local nNpcIndex = FightNpcManager:AddNpc("玉龙女弟子",self.m_GirlId, mapid, tb.Pos.x, tb.Pos.y, self, inf, 1, 1)
				tinsert(self.m_Girls, nNpcIndex)
			end
		end
	end
end
