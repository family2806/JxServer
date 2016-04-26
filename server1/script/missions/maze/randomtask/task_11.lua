-- 11.	有个美丽的少女破碗儿，地上有很多花，少女要求玩家交纳1亿两银子，否则采集最红的一朵花，
-- 不论采了哪朵，都不能完成任务，要采集和上交3次，然后破碗儿还是不满意，召唤出11个小破碗儿，击败所有小破碗儿后或者上交1亿两银子过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\progressbar.lua")

pTask = Task:New(11)

function pTask:OnStart()
	local pos_boss = self:GetPosition().t11_boss
	local pos_flower = self:GetPosition().t13_lamp
	local mapid = self:GetMapId()
	self.m_BossIndex = DlgNpcManager:AddNpc("破碗儿", 1704, mapid, pos_boss.x, pos_boss.y, self, 0)
	self.m_Step = 1
	self.m_Collections = {}
	self.m_GiveCount = 0
	self.m_Monsters = {}
	self.m_Flowers = {}
	for i = 1, 10 do
		local nNpcIndex = DlgNpcManager:AddNpc("花", 1706, mapid, pos_flower[i].x, pos_flower[i].y, self, i)
		local tb = {}
		tb.NpcIndex = nNpcIndex
		tb.Bars = {}
		tinsert(self.m_Flowers, tb)
	end
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Flowers) then
		for i = 1, getn(self.m_Flowers) do
			local tb = self.m_Flowers[i]
			if (tb.NpcIndex > 0) then
				DlgNpcManager:DelNpc(tb.NpcIndex)
			end
			for j = 1, getn(tb.Bars) do
				if (tb.Bars[j] > 0) then
					DelTimer(tb.Bars[j])
				end
			end
		end
		self.m_Flowers = nil
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:CallMonsters()
	local pos = self:GetPosition().t11_monster
	local mapid = self:GetMapId()
	for i = 1, 11 do
		local nIndex = FightNpcManager:AddNpc("小破碗儿", 1705, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nIndex)
	end
end

function pTask:OnDeath(nKilledIndex, player, nIndex)
	self.m_Monsters[nIndex] = 0
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	self:Proceed()
end

function pTask:Say(player, nIndex)
	if (nIndex == 0) then
		return self:BossSay(player)
	else
		return self:FlowerSay(player, nIndex)
	end
end

function pTask:BossSay(player)
	if (self.m_Step == 1) then
		return "想过关吗？交500万两买路费吧.", {"给", "不给", "让我想想"}
	elseif (self.m_Step < 5) then
		local name = player:GetName()
		local count = self.m_Collections[name]
		if (not count or count == 0) then
			player:Say("等你摘到我要的话后再来找我")
			return
		end
		if (self.m_Step == 2) then
			player:Say("这朵花不红，你们再去摘些.")
			self.m_Collections[name] = count - 1
			self.m_Step = 3
		elseif (self.m_Step == 3) then
			player:Say("这个也算红色吗？继续去摘吧，否则休想过关.")
			self.m_Collections[name] = count - 1
			self.m_Step = 4
		elseif (self.m_Step == 4) then
			player:Say("我真是对你太失望了，姐妹们，拉出去打!")
			self:CallMonsters()
			self.m_Step = 5
		end
	else
		player:Say("姐妹们，给我拉出去打!")
	end
end

function pTask:FlowerSay(player, nIndex)
	if (self.m_Step >= 2) then
		local tb = self.m_Flowers[nIndex]
		local nId = ProgressBarList:Open("摘到了", player, 3, self, tb)
		tinsert(tb.Bars, nId)
	end
end

function pTask:OnAnswer(player, sel, nIndex)
	if (self.m_Step == 1) then
		if (sel == 1) then
			-- 交银子
			if (player:Pay(5000000) == 0) then
				player:Say("凑够钱了再来找我")
			else
				self:Proceed()
			end
		elseif (sel == 2) then
			player:Say("不给啊？那就给我摘一朵最红的话回来.")
			self.m_Step = 2
		end
	end
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.NpcIndex > 0) then
		local name = player:GetName()
		player:Say("你摘到一朵红花")
		self:BroadCast(format("%s 摘到一朵红花", name))
		DlgNpcManager:DelNpc(tb.NpcIndex)
		tb.NpcIndex = 0
		local count = self.m_Collections[name] or 0
		self.m_Collections[name] = count + 1
	end
end

function pTask:OnProgressbarBreak(nId, tb)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
end
