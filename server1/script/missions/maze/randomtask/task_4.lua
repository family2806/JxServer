--一个BOSS五彩龙蛛
--每隔30秒在某个玩家身边刷一个npc蜘蛛网
--打死BOSS过关

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")


pTask = Task:New(4)

function pTask:InitStep()
	print("task4 init")
end

Step1 = Step:New()

function Step1:Start(task)
	local nMapId = task:GetMapId()
	local tbPos = task:GetPosition()
	self.nNpcIndex = FightNpcManager:AddNpc("五彩龙珠", 1631, nMapId, tbPos.boss.x, tbPos.boss.y, self, 1, 1, 1)
	self.pTask = task
	-- self.pTask.nTimerId = TimerList:AddTimer(self, 30*18)
end

-- function Step1:OnTime()
-- end

function Step1:OnDeath()
	if (self.pTask) then
		self.pTask:Proceed()
	end
	if (self.nNpcIndex) then
		self.nNpcIndex = nil
	end
end

function Step1:OnPlayerDeath(player)
	self.pTask:BroadCast(format("因为不及时打散蛛丝，%s中毒死亡.", player:GetName()))
end

function Step1:Destroy()
	self.pTask = nil
	if (self.nNpcIndex) then
		FightNpcManager:DelNpc(self.nNpcIndex)
		self.nNpcIndex = nil
	end
end

pTask:AddStep(clone(Step1))
