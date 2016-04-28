Include("\\script\\activitysys\\config\\39\\head.lua")
Include("\\script\\activitysys\\functionlib.lua")


function pActivity:GetSeedTime(TSK_SEEDTIME, TSK_SEEDTIME_EX)
	---»î¶¯Ã»ÓÐ¿çÔÂ£¬¼ò»¯ÅÐ¶Ï
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
		Talk(1, "", "Sè lÇn nhËn ®· dïng hÕt")
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
		Talk(1, "", "Ng­¬i ®· cã D©y Hång råi")
		return
	end
	return 1
end
--By: NgaVN
function pActivity:GiveRedline()
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d")) 
--By: NgaVN - 	È¥³ýºìÏßÑ°ÕÒÒöÔµºÅµÄ¹¦ÄÜ
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
		Talk(1, "", format("Xin h·y ®¶m b¶o %s ng­êi tæ ®éi", nNormSize))
		return 
	end
	
	for i = 1, nTeamSize do
		local nMemberIndex = GetTeamMember(i)
		if CallPlayerFunction(nMemberIndex, PlayerFunLib.CheckTotalLevel, PlayerFunLib, 120,"",">=") ~= 1 then
			Talk(1, "", format("Xin h·y x¸c nhËn ng­¬i vµ ®éi ngò cña ng­¬i ®· ®¹t ®Õn %d cÊp",120))
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
			Talk(1, "", "Xin h·y x¸c nhËn ng­¬i vµ ng­êi h÷u duyªn ®Òu cã T¬ Hång råi h·y ®Õn nhËn H¹t Gièng Hoa Hång")
			return
		end
		nSexScore = nSexScore + nMemberSex
		--nRedlineScore = nRedlineScore + nValenNumber
	end
	if nSexScore ~= nNormSex then
		Talk(1, "", "CÇn ph¶i phï hîp víi ®iÒu kiÖn yªu cÇu råi h·y ®Õn nhËn H¹t Gièng Hoa Hång")
		return
	end
--By: NgaVN - 	È¥³ýºìÏßÑ°ÕÒÒöÔµºÅµÄ¹¦ÄÜ	
--	if (floor(nRedlineScore/2)*2) ~= nRedlineScore then
--		Talk(1, "", "Xin h·y x¸c nhËn ®éi ngò cña ng­¬i lµ ng­êi h÷u duyªn víi ng­¬i hoÆc ®· lµ phèi ngÉu cña ng­¬i sau ®ã míi ®Õn nhËn H¹t Gièng Hoa Hång nhÐ.")
--		return 
--	end
	return 1
end

function pActivity:CheckBagIsFree(nStackCount, nCount)
	local nFreeCellCount = ceil(nCount/nStackCount)
	if PlayerFunLib:CheckFreeBagCell(nFreeCellCount, format("CÇn cã %d kh«ng gian hµnh trang", nFreeCellCount)) ~= 1 then
		return 
	end
	return 1
end

function pActivity:CheckDateEx()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
		Talk(1, "", "Ho¹t ®éng vÉn ch­a b¾t ®Çu, xin h·y kiªn nhÉn chê ®îi")
		return nil
	end
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		Talk(1, "", "§¹i hiÖp l­îng thø, ho¹t ®éng lÇn nµy ®· kÕt thóc")
		return nil
	end
	return 1
end