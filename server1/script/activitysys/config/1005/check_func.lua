Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")

tbPVLB_Check = {}

function tbPVLB_Check:IsNewPlayer()
	local nBitVal1 = %tbExtPointLib:GetBitValue(%nEXT_POINT_ID, %nEXT_POINT_BIT_NEW_ACCOUNT) --½ÉcodeÐÂÕËºÅ
	local nBitVal2 = %tbExtPointLib:GetBitValue(%nEXT_POINT_ID, %nEXT_POINT_BIT_OLD_ACCOUNT)--½Écode ¾ÉÕËºÅ
	local nBitVal3 = %tbExtPointLib:GetBitValue(%nEXT_POINT_ID, %nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--ÒÑÁì½±
	if nBitVal1 == 0 and nBitVal2 == 0 then		
		return 0
	end
	if CalcItemCount(-1, 6, 1, 30141, -1) ~= 1 or nBitVal3 ~= 1 then
		return 0
	end
	return 1
end

function tbPVLB_Check:CheckTime()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if %nSTART_DATE and %nSTART_DATE ~= 0 and %nSTART_DATE > nCurDate then
		return 0
	end
	if %nEND_DATE and %nEND_DATE ~= 0 and %nEND_DATE <= nCurDate then
		return 0
	end
	return 1
end