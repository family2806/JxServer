Include("\\script\\task\\150skilltask\\shaolin\\register.lua")

local tbFactSkill = {
	[0] = {[90] = {318, 319, 321}, [120] = {709},},
}

function pTask:CheckMissionCondition()
	if GetLevel() < 150 then
		return
	end
	---修改接受150级技能任务要重生两次以上 - Modified By NgaVN - 20121207
	local nTransLife = ST_GetTransLifeCount()	
	if nTransLife < 2  then
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == nil then
		return
	end
	local tbFact = %tbFactSkill[nFact]
	if tbFact == nil then
		return
	end
	local nFlag = 0
	for i = 1, getn(tbFact[90]) do
		if HaveMagic(tbFact[90][i]) >= 0 then
			nFlag = 1
			break
		end
	end
	if nFlag == 0 then
		return
	end
	if HaveMagic(tbFact[120][1]) < 0 then
		return
	end
	return 1
end

function pTask:Talk(szMsg)
	Talk(1, "", szMsg)
end