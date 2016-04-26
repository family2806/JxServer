Include("\\script\\lib\\awardtemplet.lua")

tbTimeActive =
{
	[1] = {1100, 1130},
	[2] = {1300, 1330},
	[3] = {1500, 1530},
	[4] = {1700, 1730},
	[5] = {1900, 1930},
	[6] = {2100, 2130},
	[7] = {2300, 2330},
}
tbAwardTK =
{
	{szName = "乾坤造化丹(大) ", tbProp = {6, 1, 215, 0, 0, 0}, nCount = 40, nExpiredTime = 1440, nBindState = -2},	
	{szName = "宋金飞速丸", tbProp = {6, 1, 190, 0, 0, 0}, nCount = 20, nExpiredTime = 1440, nBindState = -2},	
	{szName = "令牌", tbProp = {6, 1, 157, 0, 0, 0}, nCount = 10, nExpiredTime = 1440, nBindState = -2},	
}

TASK_RESET_DAILY_AWARD_TK	= 2776
TASK_INDEX_AWARD_TK				= 2777

nEndDate = 20101107

function Start_Date()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate <= nEndDate) then
		return 1
	else
		return 0
	end
end

function CheckTimeActive()
	local nHour = tonumber(date("%H%M"))
	for i = 1, getn(tbTimeActive) do 
		if (nHour >= tbTimeActive[i][1] and nHour <=  tbTimeActive[i][2]) then
			return i
		end
	end
	return 0
end

function GetAwardTK()
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "装备不足10个空位.");
		return
	end
	
	ResetDailyAwardTK()
	
	local nIndex = CheckTimeActive()
	
	if (GetTask(TASK_INDEX_AWARD_TK) ~= nIndex) then
		SetTask(TASK_INDEX_AWARD_TK, nIndex)
		for i = 1, getn(tbAwardTK) do
			tbAwardTemplet:GiveAwardByList(tbAwardTK[i] , "接收宋金帮助");
		end
	else
		Talk(1, "", "大侠不是领了吗!");
		return
	end
end

function ResetDailyAwardTK()
	local taskTemp = GetTask(TASK_RESET_DAILY_AWARD_TK)
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	if (taskTemp ~= nCurrDate) then
		SetTask(TASK_RESET_DAILY_AWARD_TK, nCurrDate)
		SetTask(TASK_INDEX_AWARD_TK, 0)
	end
end