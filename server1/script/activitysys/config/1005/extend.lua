Include("\\script\\activitysys\\config\\1005\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")

function pActivity:CheckMaxBitTaskValue(tbBitTask)
	if %tbPVLB_Check:IsNewPlayer() ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(tbBitTask) == 1 then
		return nil
	end
	return 1
end

function pActivity:CheckNewPlayer()
	if %tbPVLB_Check:IsNewPlayer() ~= 1 then
		return nil
	end
	return 1
end