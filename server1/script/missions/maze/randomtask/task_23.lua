-- 房间里刷出10个带无形蛊的高抗柱子（可共用20的火柱子点，但是要求遍布房间内，只在四角留有较为容易存活的空档点）。
-- 必须坚持5分钟（如果房间里没人则停止计时）才能过关

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")

pTask = Task:New(23)
pTask.m_Timeout = 300

function pTask:OnStart()
	self.m_Pillars = {}
	local poss = self.m_Pos.pillars
	for i = 1, getn(poss) do
		local index = FightNpcManager:AddNpc("柱子", 1672, self.m_Maze.m_MapId, poss[i].x, poss[i].y, self, i, 1, 1)
		tinsert(self.m_Pillars, index)
	end
	self.m_TimerId = TimerList:AddTimer(self, 18 * self.m_Timeout)
	self:BroadCast("计时现在开始.")
end

function pTask:OnDestroy()
	for i = 1, getn(self.m_Pillars) do
		local index = self.m_Pillars[i]
		if (index > 0) then
			FightNpcManager:DelNpc(self.m_Pillars[i])
		end
	end
	self.m_Pillars = nil
	if (self.m_TimerId > 0) then
		TimerList:DelTimer(self.m_TimerId)
		self.m_TimerId = 0
	end
end

function pTask:OnDeath(killed, player_killer, param)
	self.m_Pillars[param] = 0
end

function pTask:OnTime()
	self:BroadCast(format("计时 %d 分钟结束.", floor(self.m_Timeout / 60)))
	self.m_TimerId = 0
	self:Proceed()
	return 0
end

function pTask:OnEnter(player, count)
	-- DEBUG
	print(format("enter room: player(%s), count(%d)", player:GetName(), count))
	if (count == 1 and self.m_TimerId > 0) then
		player:Msg2Player("恢复时间.")
		TimerList:ResumeTimer(self.m_TimerId)
	end
end

function pTask:OnLeave(player, count)
	-- DEBUG
	print(format("leave room: player(%s), count(%d)", player:GetName(), count))
	if (count == 0 and self.m_TimerId > 0) then
		self:BroadCast("暂停时间.")
		TimerList:SuspendTimer(self.m_TimerId)
	end
end
