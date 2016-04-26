Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
if not tbVNG_RedCandle then
	tbVNG_RedCandle = {}
end
tbVNG_RedCandle.nInterval = 15*18
tbVNG_RedCandle.nEndTime = 5*60
tbVNG_RedCandle.tbAward = {nExp = 500000}
tbVNG_RedCandle.nTask_DailyLimit = 2923
tbVNG_RedCandle.nTask_Limit_Candle_At_1Time = 2924
tbVNG_RedCandle.nTask_OverLoad_IDRole= 2928
tbVNG_RedCandle.tbPlayerList = {}
tbVNG_RedCandle.nStartDate = 201202130000
tbVNG_RedCandle.nEndDate = 201202232400
function main(nItemIdx)
	if tbVNG_RedCandle:IsActive() ~= 1 then
		Talk(1, "", "该物品只能在这个时间内使用：2012年2月13日0时到2012年2月23日24时")
		return 1
	end
	if PlayerFunLib:CheckTaskDaily(tbVNG_RedCandle.nTask_DailyLimit, 5, "使用物品达上限，明天继续使用", "<") == nil then
		return 1
	end
	if PlayerFunLib:VnCheckInCity ("default") == nil then
		return 1
	end
	if PlayerFunLib:CheckTotalLevel(150,"",">=") == nil then
		return 1
	end
	if GetCurServerTime() - GetTask(tbVNG_RedCandle.nTask_Limit_Candle_At_1Time) <= tbVNG_RedCandle.nEndTime then
		Talk(1, "", "每人只能在一个时间使用1跟红蜡烛.")
		return 1
	end
	if tbVNG_RedCandle:UseCandle() ~= 1 then
		return 1
	else
		PlayerFunLib:AddTaskDaily(tbVNG_RedCandle.nTask_DailyLimit, 1)
		local nCount = PlayerFunLib:GetTaskDailyCount(tbVNG_RedCandle.nTask_DailyLimit)
		if nCount == 5 then
			tbLog:PlayerActionLog("EventTinhNhan2012", "SuDung5LanVatPhamNenDo")
		end
		SetTask(tbVNG_RedCandle.nTask_Limit_Candle_At_1Time, GetCurServerTime())
		return 0
	end	
end

function tbVNG_RedCandle:IsActive()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < self.nStartDate or nTime > self.nEndDate then
		return 0
	end
	return 1
end

function tbVNG_RedCandle:UseCandle()
	local nWorld, nX, nY =GetWorldPos()	
	local nNameID = String2Id(GetName())
	if self.tbPlayerList[nNameID] and self.tbPlayerList[nNameID].strPlayerName == GetName() then		
		Talk(1, "", "每人只能在一个时间使用1跟红蜡烛.")
		return 0
	end
	self.tbPlayerList[nNameID] = {}	
	self.tbPlayerList[nNameID].nMapID = nWorld	
	self.tbPlayerList[nNameID].nStartTime = GetCurServerTime()	
	self.tbPlayerList[nNameID].strPlayerName = GetName()	
	SetTask(tbVNG_RedCandle.nTask_OverLoad_IDRole, floor(nNameID/1e9))
	nNameID = mod(nNameID,1e9)
	AddTimer(self.nInterval, "tbVNG_RedCandle:OnTime", nNameID)
	return 1
end
function tbVNG_RedCandle:OnTime(nNameID)
	local nameid = nNameID + GetTask(tbVNG_RedCandle.nTask_OverLoad_IDRole)*1e9
	local player = self.tbPlayerList[nameid]
	if not player or String2Id(player.strPlayerName) ~= nameid  then
		print("He thong phat hien sai sot")
		return 0, nil
	end	
	local nOldPlayer = PlayerIndex;
	local nPlayerIdx = SearchPlayer(player.strPlayerName)
	if nPlayerIdx > 0 then
		PlayerIndex = nPlayerIdx
		local nWorld, nX, nY =GetWorldPos()
		if nWorld ~= player.nMapID or GetFightState() ~= 0 then			
			Msg2Player("该红蜡烛只能在您使用的城市非战斗区域有效.")
		else
			tbAwardTemplet:Give(self.tbAward, 1,{"EventTinhNhan2012","SuDungNenDoNhanThuong"})
		end		
	
	end
	
	local nElapsedTime = GetCurServerTime() - player.nStartTime
	if nElapsedTime >= self.nEndTime then				
		self.tbPlayerList[nameid] = nil						
		return 0,nil			
	end	
	PlayerIndex = nOldPlayer		
	return self.nInterval, nNameID
end