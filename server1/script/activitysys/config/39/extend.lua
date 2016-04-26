Include("\\script\\activitysys\\config\\39\\head.lua")
Include("\\script\\activitysys\\functionlib.lua")


function pActivity:GetSeedTime(TSK_SEEDTIME, TSK_SEEDTIME_EX)
	---活动没有跨月，简化判断
	local nMaxTime = 3
	local nSeedTimeInfo = self.TaskGroup:GetTask(TSK_SEEDTIME)
	local nSeedTimeEx = self.TaskGroup:GetTask(TSK_SEEDTIME_EX)
	local nInitDate = mod(floor(self.nStartDate/10000), 1000000)
	local nCurDay = tonumber(GetLocalDate("%y%m%d")) 
	if nSeedTimeInfo == 0 then
		nSeedTimeInfo = nInitDate * 256 + 1
	end
	
	local nLastDay, nRemainTime = floor(nSeedTimeInfo/256), mod(nSeedTimeInfo, 256)
	nRemainTime = nRemainTime + (nCurDay-nLastDay)
	if nRemainTime > nMaxTime then
		nRemainTime = nMaxTime
	end
	self.TaskGroup:SetTask(TSK_SEEDTIME, nCurDay*256+nRemainTime)
	return nRemainTime, nSeedTimeEx
end


function pActivity:CheckSeedTime(TSK_SEEDTIME, TSK_SEEDTIME_EX)
	local nSeedTime, nSeedTimeEx = self:GetSeedTime(TSK_SEEDTIME, TSK_SEEDTIME_EX)
	if nSeedTime <= 0 and nSeedTimeEx <= 0 then
		Talk(1, "", "领取次数已用完")
		return 
	end
	return 1
end

function pActivity:SubSeedTime(TSK_SEEDTIME, TSK_SEEDTIME_EX)
	local nSeedTime, nSeedTimeEx = self:GetSeedTime(TSK_SEEDTIME, TSK_SEEDTIME_EX)
	local nCurDay = tonumber(GetLocalDate("%y%m%d")) 
	if nSeedTime > 0 then
		self.TaskGroup:SetTask(TSK_SEEDTIME, nCurDay*256+nSeedTime-1)
		return 
	end
	self.TaskGroup:SetTask(TSK_SEEDTIME_EX, nSeedTimeEx-1)
end

function pActivity:CheckRedline()
	local nRedlineIndex = 3111
	local nItemCount = CalcItemCount(-1, 6, 1, nRedlineIndex, -1)
	if nItemCount > 0 then
		Talk(1, "", "你已有红线了")
		return
	end
	return 1
end
--By: NgaVN
function pActivity:GiveRedline()
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d")) 
--By: NgaVN - 	去除红线寻找姻缘号的功能
	--local nValenNumber = random(1, 100)
	
	--self.TaskGroup:SetTask(TSK_REDLINE_NUM, nValenNumber)
	nDay = nDay + 1
	if nDay > 29 then
		nDay = 1
		nMonth = 3
	end
	--local nLimit = 20120000 + nMonth * 100 + nDay
	local nLimit = 20120301
	PlayerFunLib:GetItem({tbProp={6,1,3111,1,0,0},nBindState = -2,nExpiredTime=nLimit,},1,"get red line")
end

function pActivity:CheckTeamConfig()
	local nNormSize = 2
	local nNormSex = 1
	local nTeamSize = GetTeamSize()
	local nSexScore = 0
	local nRedlineScore = 0
	if nTeamSize ~= nNormSize then
		Talk(1, "", format("请确保%s 组队人", nNormSize))
		return 
	end
	
	for i = 1, nTeamSize do
		local nMemberIndex = GetTeamMember(i)
		if CallPlayerFunction(nMemberIndex, PlayerFunLib.CheckTotalLevel, PlayerFunLib, 120,"",">=") ~= 1 then
			Talk(1, "", format("请确认你和你的队伍已达到%d级",120))
			return 
		end
	end
	
	local szLoverName = GetMateName()
	for i = 1, nTeamSize do
		local nMemberIndex = GetTeamMember(i)
		local nMemberName = CallPlayerFunction(nMemberIndex, GetName)
		if nMemberName == szLoverName then
			return 1
		end
	end
	
	for i = 1, nTeamSize do
		local nMemberIndex = GetTeamMember(i)
		local nMemberSex = CallPlayerFunction(nMemberIndex, GetSex)
		--local nValenNumber = CallPlayerFunction(nMemberIndex, self.TaskGroup.GetTask, self.TaskGroup, TSK_REDLINE_NUM)
		local nItemCount = CallPlayerFunction(nMemberIndex, CalcEquiproomItemCount, 6, 1, 3111, -1)
		if nItemCount <= 0 then
			Talk(1, "", "请确认你和你的有缘人都有红线，然后来领取玫瑰种子")
			return
		end
		nSexScore = nSexScore + nMemberSex
		--nRedlineScore = nRedlineScore + nValenNumber
	end
	if nSexScore ~= nNormSex then
		Talk(1, "", "需要符合要求条件，然后来领取玫瑰种子")
		return
	end
--By: NgaVN - 	去除红线寻找姻缘号的功能	
--	if (floor(nRedlineScore/2)*2) ~= nRedlineScore then
--		Talk(1, "", "请确认你的队伍是你的有缘人或者已经是你的配偶，然后才能来领取玫瑰种子")
--		return 
--	end
	return 1
end

function pActivity:CheckBagIsFree(nStackCount, nCount)
	local nFreeCellCount = ceil(nCount/nStackCount)
	if PlayerFunLib:CheckFreeBagCell(nFreeCellCount, format("需要?%d 装备空间", nFreeCellCount)) ~= 1 then
		return 
	end
	return 1
end

function pActivity:CheckDateEx()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
		Talk(1, "", "活动还未开始，请坚持等待")
		return nil
	end
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		Talk(1, "", "大侠谅解，此次活动已结束")
		return nil
	end
	return 1
end