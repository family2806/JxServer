Include("\\script\\task\\150skilltask\\gaibang\\register.lua")

local tbFactSkill = {
	[6] = {[90] = {357, 359}, [120] = {714},},
}

function pTask:CheckMissionCondition()
	if GetLevel() < 150 then
		return
	end
	---������150����������Ҫ����2������ - Modified By NgaVN - 20121207
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

local _OnBreak = function(nNpcIndex)
	Msg2Player("�������ж�")
end

local _GetAward = function(nNpcIndex, dwNpcID, nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	if nNpcIndex == nil then
		Msg2Player("������ʧ��.")
		return 0
	end
	
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
		Msg2Player("�������ʧ��.")
		return 0
	end	
	
	Msg2Player("�������!")
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
end 


function pTask:Treat(nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcIndex = GetNpcId(nNpcIndex)
	Msg2Player("��ʼ����")
	tbProgressBar:OpenByConfig(9, %_GetAward, {nNpcIndex, dwNpcIndex, nAddStepNum, nTaskId, szTaskName, nGotoDetailId}, %_OnBreak, {nNpcIndex})
end