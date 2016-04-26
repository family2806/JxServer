Include("\\script\\activitysys\\config\\19\\config.lua")
Include("\\script\\activitysys\\config\\19\\head.lua")
Include("\\script\\activitysys\\functionlib.lua")

function pActivity:CheckHongXian()
	if PlayerFunLib:CheckItemInBag({tbProp={6,1,2696,1,0,0},},1,"") then
		lib:ShowMessage("您已有红线了")
		return
	end
	return 1
end

function pActivity:GetTaskValue(nTaskId)
	local n = self.TaskGroup:GetTask(nTaskId)
end

function pActivity:SetTaskValue(nTaskId, nValue)
	self.TaskGroup:SetTask(nTaskId, nValue)
end

function pActivity:SetValentineRandNumber(nTaskId)
	local nValentineNumber = random(1, 100)
	self.TaskGroup:SetTask(nTaskId, nValentineNumber)
end

function pActivity:GetValentineRandNumber(nTaskId)
	local nValentineNumber = self.TaskGroup:GetTask(nTaskId, nValentineNumber)
	lib:ShowMessage(format("你的姻缘数为%d",nValentineNumber))
end

function pActivity:CheckValentineSeedTime(nTaskId, nValue, szFailMsg, szOption, nAddValue, nLimit, nTaskExId)
	nValue = lib:NumberParamTrans(nValue)
	local nTaskValue = self.TaskGroup:GetTask(nTaskId)
	
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))

	if nTaskValue == 0 then
		nTaskValue = 110212 * 256
	end
	
	local nAddTimes = nCurDate - floor(nTaskValue/256)
	
	if nAddTimes < 0 then
		nAddTimes = nAddTimes + 28
	end
	
	if floor(nTaskValue/256) ~= nCurDate then
		local nRemain = mod(nTaskValue, 256)
		nTaskValue = nCurDate * 256
		nRemain = (nRemain + nAddValue * nAddTimes <= nLimit) and (nRemain + nAddValue * nAddTimes) or nLimit
		self.TaskGroup:SetTask(nTaskId, nTaskValue + nRemain)
	end
	
	nTaskValue = self.TaskGroup:GetTask(nTaskId)
	if lib:OptionFunction(mod(nTaskValue, 256), nValue, szOption) then
		return 1
	else
		
		local nTaskExValue = self.TaskGroup:GetTask(nTaskExId)
		if nTaskExValue > 0 then
			return 1
		end
		lib:ShowMessage(szFailMsg)
	end
end

function pActivity:CheckGetMeiGuiHuaZiCondition()
	
	if GetLevel() < 150 and ST_IsTransLife() ~= 1 then
		Msg2Player("等级不够!")
		return 
	end
	
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		Msg2Player("请维持2人一队")
		return
	end
	
	local nPlayer1Idx = GetTeamMember(1)
	local nPlayer2Idx = GetTeamMember(2)

	local nPlayer1Sex = DynamicExecuteByPlayer(nPlayer1Idx, "", "GetSex")
	local nPlayer2Sex = DynamicExecuteByPlayer(nPlayer2Idx, "", "GetSex")
	if (nPlayer1Sex + nPlayer2Sex ~= 1) or (nPlayer1Sex * nPlayer2Sex ~= 0) then
		lib:ShowMessage("需要男女组队才能种玫瑰种子")
		return
	end
	
	local nValentinePlayerIdx = ((nPlayer1Idx == PlayerIndex) and nPlayer2Idx or nPlayer1Idx)
	local szLoverName = DynamicExecuteByPlayer(nValentinePlayerIdx, "", "GetMateName")
	local szCurPlayerName = GetName()
	if szCurPlayerName == szLoverName then
		return 1
	else

		local nPlayer1Number = CallPlayerFunction(nPlayer1Idx, self.TaskGroup.GetTask, self.TaskGroup, 1) --self.TaskGroup:GetTask(1) 
		local nFlag1 = CallPlayerFunction(nPlayer1Idx, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")

	 	if nFlag1 ~= 1 then
			lib:ShowMessage("请确认有缘人与你都有红线后来领玫瑰种子!")
			return
		end
		
		local nPlayer2Number = CallPlayerFunction(nPlayer2Idx, self.TaskGroup.GetTask, self.TaskGroup, 1) --self.TaskGroup:GetTask(1) 
		local nFlag2 = CallPlayerFunction(nPlayer2Idx, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
	 	if nFlag2 ~= 1 then
			lib:ShowMessage("请确认有缘人与你都有红线后来领玫瑰种子!")
			return
		end
		if self:NumberIsEven(nPlayer1Number + nPlayer2Number) ~= 1 then
			Msg2Player("请您的有缘人或者配偶来领玫瑰种子!")
			return
		end
		return 1
	end
end

function pActivity:SubSeedTime(nTaskId, nTaskExId)
	local nTaskValue = mod(self.TaskGroup:GetTask(nTaskId), 256)
	local nTmp = floor(self.TaskGroup:GetTask(nTaskId)/256) * 256
	local nTaskExValue = self.TaskGroup:GetTask(nTaskExId)
	if nTaskValue > 0 then
		self.TaskGroup:SetTask(nTaskId, nTmp + nTaskValue-1)
		return 1
	elseif nTaskExValue > 0 then
		self.TaskGroup:SetTask(nTaskExId, nTaskExValue-1)
		return 1
	end
end

function pActivity:NumberIsEven(nNumber)
	local nMid = floor(nNumber/2)
	if nMid * 2 == nNumber then
		return 1
	end
	return 0
end

function pActivity:GiveHongXian()
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d")) 
	nDay = nDay + 1
	if nDay > 28 then
		nDay = 1
		nMonth = 3
	end
	local nLimit = 20110000 + nMonth * 100 + nDay
	PlayerFunLib:GetItem({tbProp={6,1,2696,1,0,0},nBindState = -2,nExpiredTime=nLimit,},1,"情人节活动领红线")
end

function pActivity:CheckQJYYTime()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if 110213 <= nDate and nDate <= 110223 then
		return 1
	end
	Msg2Player("不是活动时间，道具没有价值!")
	return 
end