Include("\\script\\task\\150skilltask\\tianren\\register.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")

local tbFactSkill = {
	[7] = {[90] = {361, 362, 391}, [120] = {715},},
}

function pTask:CheckMissionCondition()
	if GetLevel() < 150 then
		return
	end
	---调整接150技能任务需要重生2次以上  - Modified By NgaVN - 20121207
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

function pTask:CheckNoItem(nG, nD, nP)
	local nItemCount = CalcItemCount(-1, nG, nD, nP, -1)
	if nItemCount > 0 then
		return 
	end
	return 1
end

function pTask:CheckItemNoMsg(tbParam)
	local tbItemList = tbParam
	for i = 1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local nCount = tbItem.nCount or 1
		local nItemCount = CalcItemCount(3, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
		if nItemCount < nCount then
			return
		end
	end
	return 1
end

function pTask:GotoDetailEX(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
end