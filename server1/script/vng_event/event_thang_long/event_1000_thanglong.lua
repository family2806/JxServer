Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

EventThangLong = {}

EventThangLong.FILE_PATH = "settings//event_1000_thanglong.txt"

EventThangLong.EndDate = 20101023
--EventThangLong.TaskCountGiveItem = 2739
EventThangLong.TaskDailyGiveItem =2739
EventThangLong.TaskGetAwardInTime =2740

EventThangLong.tbAwardServer = 
{
	[1] = {1,10,{szName = "经验值", nExp = 5000000}},	
	[2] = {11,20,{szName = "经验值", nExp = 8000000}},	
	[3] = {21,30,{szName = "经验值", nExp = 10000000}},	
	[4] = {31,40,{szName = "经验值", nExp = 15000000}},	
	[5] = {41,50,{szName = "经验值", nExp = 20000000}},	
	[6] = {51,60,{szName = "经验值", nExp = 30000000}},	
	[7] = {61,10e5,{szName = "经验值", nExp = 50000000}},	
}

function EventThangLong:IsActive()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate <= self.EndDate) then
		return 1
	else
		return 0
	end
end

function EventThangLong:ShowDialog()
	local nHour = tonumber(GetLocalDate("%H%M"))
	local tbOpt = {}
	local str = "庆祝1000年升龙-河内节日"
	if (nHour >= 1200 and nHour <= 1400) then
		tinsert(tbOpt, "我想领取1000年升龙奖励/#EventThangLong:GetAward(1)")
	end
	
	if (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbOpt, "我想领取1000年升龙奖励/#EventThangLong:GetAward(2)")
	end
	tinsert(tbOpt, "我想交10个功状令/#EventThangLong:GiveItem()")
	tinsert(tbOpt, "我想看已交功状令数量/#EventThangLong:ViewTotalDragonItem()")
	tinsert(tbOpt, "<#>Tho竧/OnCancel")
	if ( getn( tbOpt ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpt ), tbOpt )	
end

function EventThangLong:GiveItem()
	PlayerFunLib:AddTaskDaily(self.TaskDailyGiveItem,1)
	if (CalcEquiproomItemCount(6,1,30048,-1) < 10) then
		Say("大侠带的不足<color=yellow>功状令<color>!",0)
		return 
	end
	
	if (ConsumeEquiproomItem(10, 6, 1, 30048, -1)) then
		--SetTask(self.TaskCountGiveItem, GetTask(self.TaskCountGiveItem)+1)
		self:AddTotalDragonItem()
		tbAwardTemplet:GiveAwardByList({szName ="经验值", nExp = 500000}, "Award exp give 功状令")
		Msg2Player(self:GetNotify())
		
		local  nTotalScore = loadsavevalue(self.FILE_PATH)
		if (nTotalScore > 0 and mod(nTotalScore, 1000) == 0)  then
			tbAwardTemplet:GiveAwardByList({szName ="经验值", nExp = 10000000}, "Award special exp give 功状令")
			Say( "你是第...个完成任务的人 ".. floor(nTotalScore/1000) ..", 领取特别奖励" , 0 )	
		end
	end
end

function EventThangLong:AddTotalDragonItem()
	local nTotalScore = loadsavevalue( self.FILE_PATH )
	nTotalScore = nTotalScore + 1
	savevalue(self.FILE_PATH, nTotalScore)
end

function EventThangLong:ViewTotalDragonItem()
	local nTotalScore = loadsavevalue(self.FILE_PATH)
	--local nPlayerScore =GetTask(self.TaskCountGiveItem)
	local szServerScore = self:GetNotify()
	--local szShowResult = "\大侠已交功状令的总数量为 <color=yellow>" .. nPlayerScore .. "<color>." .. "/n/t" .. szServerScore
	Say( szServerScore , 0 )	
end

function EventThangLong:GetNotify()
	local nTotalScore = loadsavevalue(self.FILE_PATH)
	local nCountFinishQuest = floor(nTotalScore/1000)
	local nCurCountQuest = mod(nTotalScore,1000)
	local szMsg = "剑侠server <color=yellow> " .. nCountFinishQuest .. "<color> 次完成庆祝1000年升龙-河内任务，目前已完成 <color=yellow>" .. nCurCountQuest ..  "<color> 任务"
	return szMsg
end

function EventThangLong:GetAward(nTime)
	if (PlayerFunLib:GetTaskDailyCount(self.TaskDailyGiveItem) < 1) then
		Say( "今天大侠未交功状令" , 0 )
		return	
	end
	
	
	if (GetTask(2735) < 3) then
		Say( "今天大侠未完成3个开宝箱任务!" , 0 )
		return	
	end
	
	
	local tbScoreIndex = self:GetPlayerAwardTable()
	if (tbScoreIndex == nil) then
		Say( "大侠所交功状令数量不够" , 0 )	
		return
	end
	
	if (nTime == 1) then
		if (PlayerFunLib:GetTaskDailyCount(self.TaskGetAwardInTime) >= 1) then
			Say( "大侠已领此次奖励!" , 0 )	
			return
		end
		PlayerFunLib:AddTaskDaily(self.TaskGetAwardInTime,1)
		tbAwardTemplet:GiveAwardByList(tbScoreIndex, "Award Server give dragon")
	else
		if (PlayerFunLib:GetTaskDailyCount(self.TaskGetAwardInTime) >= 2) then
			Say( "大侠已领此次奖励!" , 0 )	
			return
		end
		PlayerFunLib:AddTaskDaily(self.TaskGetAwardInTime,2)
		tbAwardTemplet:GiveAwardByList(tbScoreIndex, "Award Server give dragon")
	end
	
end

function EventThangLong:GetPlayerAwardTable()
	--local nScore = GetTask(self.TaskCountGiveItem)
	local nScore =  loadsavevalue(self.FILE_PATH)
	nScore = floor(nScore/1000)
	if (nScore > 60) then
		return self.tbAwardServer[7][3]
	else
		for i = 1, getn(self.tbAwardServer) do
			local nTemp = self.tbAwardServer[i]
			if (nScore >= nTemp[1] and nScore <= nTemp[2]) then
				return nTemp[3]
			end
		end
	end
	
	return nil
end
