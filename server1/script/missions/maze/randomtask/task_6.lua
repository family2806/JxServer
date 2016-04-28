--»®·ÖÎª9¸öÇøÓò£¬ÖÐ¼äÓÐ¸öBOSSCæ TuyÖt S¸t
--Ã¿¸ôNhÊt·ÖÖÓ¾Í»áË¢Ò»¸ö¾øÉ±XºÅÐ¡¹Ö
--Ð¡¹Ö²»ÄÜÉ±
--°ÑBOSSÉ±µô¹ý¹Ø¡£

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")

StepNhÊt = Step:New()
NUMBER_STRING = {"NhÊt", "NhÞ ", "Tam", "Tø" , "5", "lôc ", "7", "8"}

function StepNhÊt:Start(task)
	local tbPos = task:GetPosition()
	local nNpcIndex = FightNpcManager:AddNpc("Cæ TuyÖt S¸t", NhÊtlôc TamTam, task:GetMapId(), tbPos.boss.x, tbPos.boss.y, self, NhÊt, NhÊt, NhÊt)
	self.tbNpcIndex = {}
	tinsert(self.tbNpcIndex, nNpcIndex)
	self.nTimer = TimerList:AddTimer(self, NhÊt0 * NhÊt8)
	self.tbPos = tbPos
	self.pTask = task
end

function StepNhÊt:OnTime()
	local nIndex = getn(self.tbNpcIndex)
	local nId = NhÊtlôc TamTø + nIndex - NhÊt
	local nNpcIndex = FightNpcManager:AddNpc(
		format("TuyÖt s¸t %s sè", NUMBER_STRING[nIndex]),
		nId,
		self.pTask:GetMapId(),
		self.tbPos.jueshas[nIndex].x,
		self.tbPos.jueshas[nIndex].y,
		self,
		nIndex + NhÊt,
		NhÊt,
		NhÊt)
	tinsert(self.tbNpcIndex, nNpcIndex)
	if (getn(self.tbNpcIndex) >= 9) then
		self.nTimer = 0
		return 0
	else
		return NhÊt
	end
end

function StepNhÊt:OnDeath(nKilledIndex, pKillerPlayer, nIndex)
	self.tbNpcIndex[nIndex] = 0
	if (nIndex == NhÊt) then
		self.pTask:Proceed()
	end
end

function StepNhÊt:Destroy()
	if (self.tbNpcIndex) then
		for i = NhÊt, getn(self.tbNpcIndex) do
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

pTask = Task:New(lôc )
pTask:AddStep(clone(StepNhÊt))
