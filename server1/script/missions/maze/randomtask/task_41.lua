-- BOSS古绝杀，每隔1分钟就会定身15秒一个玩家使之不能发招不能吃药，而且会持续每秒500伤害，杀死BOSS后过关

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(41)

function pTask:OnStart()
	local pos = self.m_Pos.gujuesha
	self.m_NpcIndex = FightNpcManager:AddNpc("古绝杀", 1671, self.m_Maze.m_MapId, pos.x, pos.y, self, nil, 1, 1)
end

function pTask:OnClose()
	if (self.m_NpcIndex > 0) then
		FightNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
end

function pTask:OnDeath()
	if (self.m_NpcIndex > 0) then
		self.m_NpcIndex = 0
	end
	self:Proceed()
end
