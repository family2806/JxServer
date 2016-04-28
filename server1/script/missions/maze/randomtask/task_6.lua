--����Ϊ9�������м��и�BOSSC� Tuy�t S�t
--ÿ��Nh�t���Ӿͻ�ˢһ����ɱX��С��
--С�ֲ���ɱ
--��BOSSɱ�����ء�

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")

StepNh�t = Step:New()
NUMBER_STRING = {"Nh�t", "Nh� ", "Tam", "T�" , "5", "l�c ", "7", "8"}

function StepNh�t:Start(task)
	local tbPos = task:GetPosition()
	local nNpcIndex = FightNpcManager:AddNpc("C� Tuy�t S�t", Nh�tl�c TamTam, task:GetMapId(), tbPos.boss.x, tbPos.boss.y, self, Nh�t, Nh�t, Nh�t)
	self.tbNpcIndex = {}
	tinsert(self.tbNpcIndex, nNpcIndex)
	self.nTimer = TimerList:AddTimer(self, Nh�t0 * Nh�t8)
	self.tbPos = tbPos
	self.pTask = task
end

function StepNh�t:OnTime()
	local nIndex = getn(self.tbNpcIndex)
	local nId = Nh�tl�c TamT� + nIndex - Nh�t
	local nNpcIndex = FightNpcManager:AddNpc(
		format("Tuy�t s�t %s s�", NUMBER_STRING[nIndex]),
		nId,
		self.pTask:GetMapId(),
		self.tbPos.jueshas[nIndex].x,
		self.tbPos.jueshas[nIndex].y,
		self,
		nIndex + Nh�t,
		Nh�t,
		Nh�t)
	tinsert(self.tbNpcIndex, nNpcIndex)
	if (getn(self.tbNpcIndex) >= 9) then
		self.nTimer = 0
		return 0
	else
		return Nh�t
	end
end

function StepNh�t:OnDeath(nKilledIndex, pKillerPlayer, nIndex)
	self.tbNpcIndex[nIndex] = 0
	if (nIndex == Nh�t) then
		self.pTask:Proceed()
	end
end

function StepNh�t:Destroy()
	if (self.tbNpcIndex) then
		for i = Nh�t, getn(self.tbNpcIndex) do
			local nNpcIndex = self.tbNpcIndex[i]
			if (nNpcIndex > 0) then
				FightNpcManager:DelNpc(nNpcIndex)
			end
		end
		self.tbNpcIndex = nil
	end
	if (self.nTimer > 0) then
		TimerList:DelTimer(self.nTimer)
		self.nTimer = 0
	end
end

pTask = Task:New(l�c )
pTask:AddStep(clone(StepNh�t))
