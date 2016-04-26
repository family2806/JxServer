--L­u sè lÇn ho¹t ®éng trong tuÇn vµo task - Created by DinhHQ - 20110709
VngTaskWeekly = {}

function VngTaskWeekly:GetWeeklyCount(nTaskID)
	local nTaskVal = GetTask(nTaskID)
	local nCurDate = tonumber(GetLocalDate("%y%W"))
	local nDate = mod(nTaskVal, 10000)
	if nDate ~= nCurDate then
		nTaskVal = nCurDate
		nDate = nCurDate
		SetTask(nTaskID, nCurDate)
	end
	return ((nTaskVal - nDate)/10000)
end

function VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
	local nCount = self:GetWeeklyCount(nTaskID)
	nCount = nCount + nValue
	local nCurDate = tonumber(GetLocalDate("%y%W"))
	local nTaskVal = nCount * 10000 + nCurDate	
	SetTask(nTaskID, nTaskVal)
end