Include("\\script\\activitysys\\config\\1001\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")

function pActivity:VngAddWeeklyTask(nTaskID, nValue)
	%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
	--Msg2Player(%VngTaskWeekly:GetWeeklyCount(nTaskID))
end

