--======================================================================
--Author:   Tan Qingyu
--Date:     2012-06-19
--Describe: 伤害量计算接口
--======================================================================

IncludeLib("SETTING")

BWDamageStat = {
	nMissionId = 4,
	tbEffectiveGroups = {[1] = {nDamage = 0}, [2] = {nDamage = 0}},
	nMaxMissionGroup = 400,
}

function BWDamageStat:StartPersonalStat(nPlayerIndex)
	CallPlayerFunction(nPlayerIndex, ST_StartDamageCounter)
end

function BWDamageStat:FinishPersonalStat(nPlayerIndex)
	CallPlayerFunction(nPlayerIndex, ST_StopDamageCounter)
end

function BWDamageStat:FetchPersonalDamage(nPlayerIndex)
	local nDamage = CallPlayerFunction(nPlayerIndex, ST_GetDamageCounter)
	self:ClearPersonalDamage(nPlayerIndex)
	return nDamage
end

function BWDamageStat:ClearPersonalDamage(nPlayerIndex)
	CallPlayerFunction(nPlayerIndex, ST_StopDamageCounter)
	CallPlayerFunction(nPlayerIndex, ST_StartDamageCounter)
end

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
function BWDamageStat:StartStat(nGroupID)
	if not self.tbEffectiveGroups[nGroupID] then
		return
	end
	local nIdx = 0
	local nPlayerIndex = 0
	for i = 1, self.nMaxMissionGroup do
		nIdx, nPlayerIndex = GetNextPlayer(self.nMissionId, nIdx, nGroupID)
		if nPlayerIndex > 0 then
			self:StartPersonalStat(nPlayerIndex)
		end
		if nIdx == 0 then break end
	end
end

function BWDamageStat:FinishStat(nGroupID)
	if not self.tbEffectiveGroups[nGroupID] then
		return
	end
	local nIdx = 0
	local nPlayerIndex = 0
	for i = 1, self.nMaxMissionGroup do
		nIdx, nPlayerIndex = GetNextPlayer(self.nMissionId, nIdx, nGroupID)
		if nPlayerIndex > 0 then
			self:FinishPersonalStat(nPlayerIndex)
		end
		if nIdx == 0 then break end
	end
end

function BWDamageStat:FetchDamageToGroup(nPlayerIndex, nGroupID)
	if not self.tbEffectiveGroups[nGroupID] then
		return
	end
	if nPlayerIndex > 0 then
		local nPersonalDamage = self:FetchPersonalDamage(nPlayerIndex)
		self.tbEffectiveGroups[nGroupID].nDamage = self.tbEffectiveGroups[nGroupID].nDamage + nPersonalDamage
	end
end

function BWDamageStat:GetGroupDamage(nGroupID)
	if not self.tbEffectiveGroups[nGroupID] then
		return
	end
	local nIdx = 0
	local nPlayerIndex = 0
	local nReceivedDamage = 0
	for i = 1, self.nMaxMissionGroup do
		nIdx, nPlayerIndex = GetNextPlayer(self.nMissionId, nIdx, nGroupID)
		self:FetchDamageToGroup(nPlayerIndex, nGroupID)
		if nIdx == 0 then break end
	end
	return self.tbEffectiveGroups[nGroupID].nDamage
end

function BWDamageStat:ClearStat()
	for k, v in self.tbEffectiveGroups do
		v.nDamage = 0
	end
end
