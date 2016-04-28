Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\39\\valenhead.lua")
Include("\\script\\activitysys\\config\\39\\extend.lua")
Include("\\script\\activitysys\\config\\39\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbValenTree = {}
tbValenTree.tbAllInfo = {}

function main(nItemIndex)
	if %tbValenTree:IsDuring() ~= 1 then
		return 1
	end
	
	if PlayerFunLib:CheckTotalLevel(120,"default",">=") ~= 1 then
		return 1
	end
	
	local szTreeType = GetItemName(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if ValenAct_tbConfig[szTreeType] == nil then
		return 1
	end
	
	if nP ~= ValenAct_tbConfig[szTreeType].nItemIndex then
		return 1
	end
	
	if %tbValenTree:CheckCondition(szTreeType, ValenAct_nUnGrow) ~= 1 then
		return 1 
	end
	%tbValenTree:Create(szTreeType)
end

function tbValenTree:IsDuring()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if ValenAct_nStartDate == nil or nCurDate < ValenAct_nStartDate then
		Talk(1, "", "Ho¹t ®éng vÉn ch­a b¾t ®Çu, xin h·y kiªn nhÉn chê ®îi")
		return
	end 
	if ValenAct_nEndDate == nil or ValenAct_nEndDate <= nCurDate then
		Talk(1, "", "§¹i hiÖp l­îng thø, ho¹t ®éng lÇn nµy ®· kÕt thóc")
		return
	end
	return 1
end

function tbValenTree:IsInMap(szTreeType)
	local SubWordID, _, _ = GetWorldPos()
	if SubWordID ~= nil and SubWordID > 0 and GetFightState() == 1 then
		for i = 1, getn(ValenAct_tbMap) do
			if SubWordID == ValenAct_tbMap[i] then
				return 1
			end
		end
	end
	local szFailMsg = format("CÇn ph¶i trång ë ngoµi khu vùc thÊt ®¹i thµnh thÞ, b¸t ®¹i t©n thñ th«n míi trång ®­îc", szTreeType)
	Talk(1, "", szFailMsg)
	return
end

function tbValenTree:CheckTeamConfig(szTreeType, nFlag)
	local szFailMsg = ""
	local nNormSize = ValenAct_tbConfig[szTreeType].nTeamSize
--	print("nNormSize", nNormSize)
	if nNormSize ~= nil then
		local nTeamSize = GetTeamSize()
		if nNormSize and nTeamSize ~= nNormSize then
			szFailMsg = format("Xin h·y ®¶m b¶o %s ng­êi tæ ®éi", nNormSize)
			Talk(1, "", szFailMsg)
			return
		end
		
		local szLoverName = GetMateName()
		local nRedlineScore = 0
		local nTmpSexScore = 0
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
			local nRedLineCount = CallPlayerFunction(nMemberIndex, CalcEquiproomItemCount, 6, 1, ValenAct_nRedLineIndex, -1)
			if nRedLineCount == nil or nRedLineCount <= 0 then
				if nFlag == ValenAct_nUnGrow then
					szFailMsg = format("Xin h·y x¸c nhËn ng­¬i vµ ng­êi h÷u duyªn cña ng­¬i ®Òu ®· cã T¬ Hång råi h·y trång c©y%s", szTreeType)
				else
					szFailMsg = "Xin h·y x¸c nhËn ng­¬i vµ ng­êi h÷u duyªn cña ng­¬i ®Òu ®· cã T¬ Hång råi h·y hoµn thµnh nhiÖm vô"
				end
				Talk(1, "", szFailMsg)
				return
			end
--By: NgaVN - 	È¥³ýºìÏßÑ°ÕÒÒöÔµºÅ¹¦ÄÜ			
			--local nValenNumber = CallPlayerFunction(nMemberIndex, pActivity.GetTask, pActivity, TSK_REDLINE_NUM)
			--nRedlineScore = nRedlineScore + nValenNumber
--			print("nRedlineScore", nRedlineScore)
			nTmpSexScore = nTmpSexScore + nMemberSex
		end
		if nTmpSexScore ~= ValenAct_tbConfig[szTreeType].nSexScore then
			if nFlag == ValenAct_nUnGrow then
				szFailMsg = format("CÇn ph¶i tæ ®éi cã giíi tÝnh kh¸c nhau míi cã thÓ trång c©y%s!", szTreeType)
			else
				szFailMsg = "CÇn ph¶i tæ ®éi cã giíi tÝnh kh¸c nhau míi cã thÓ hoµn thµnh nhiÖm vô!"
			end
			Talk(1, "", szFailMsg)
			return
		end
--		print("floor(nRedlineScore/2)*2)",floor(nRedlineScore/2)*2)
--		print("nFlag,ValenAct_nUnGrow",nFlag ,ValenAct_nUnGrow)
--By: NgaVN - 	È¥³ýºìÏßÑ°ÕÒÒöÔµºÅ¹¦ÄÜ
--		if (floor(nRedlineScore/2)*2) ~= nRedlineScore then
--			if nFlag == ValenAct_nUnGrow then
--				Talk(1, "", format("Xin h·y x¸c nhËn ®éi ngò cña ng­¬i lµ ng­êi h÷u duyªn víi ng­¬i hoÆc ®· lµ phèi ngÉu cña ng­¬i sau ®ã míi ®Õn%s%s","Gieo h¹t", szTreeType))
--			else
--				Talk(1, "", format("Xin h·y x¸c nhËn ®éi ngò cña ng­¬i lµ ng­êi h÷u duyªn víi ng­¬i hoÆc ®· lµ phèi ngÉu cña ng­¬i sau ®ã míi ®Õn%s%s","Ch¨m sãc", szTreeType))
--			end
--			return 
--		end
	end
	return 1
end

function tbValenTree:CheckCondition(szTreeType, nFlag)
	if self:IsInMap(szTreeType) ~= 1 then
		return
	end
	if self:CheckTeamConfig(szTreeType, nFlag) ~= 1 then
		return
	end
	local nLastTime = pActivity.TaskGroup:GetTask(TSK_SEED_CD_TIME)
	local nDifTime =  GetCurServerTime() - nLastTime
	if nDifTime < 15 then
		Msg2Player(format("Ng­¬i võa trång mét h¹t gièng, xin h·y ®îi %d gi©y sau míi trång tiÕp", 15 - nDifTime))
		return
	end
	pActivity.TaskGroup:SetTask(TSK_SEED_CD_TIME, GetCurServerTime()) 
	return 1
end

function tbValenTree:AddTree(nNpcIndex, szTreeType, szOwer, tbTreeInfo)
	if tbTreeInfo ~= nil then
		self.tbAllInfo[nNpcIndex] = tbTreeInfo
		return
	end
	local szWork = szOwer
	local nNormSize = ValenAct_tbConfig[szTreeType].nTeamSize
	if nNormSize ~= nil then
		local nTeamSize = GetTeamSize() 
		if nTeamSize and nTeamSize > 0 then
			for i = 1, nTeamSize do
				local nMemberIndex = GetTeamMember(i)
				local szMemberName = CallPlayerFunction(nMemberIndex, GetName)
				if szMemberName ~= szOwer then
					szWork = szMemberName
					break
				end
			end
		end
	end
	self.tbAllInfo[nNpcIndex] = {}
	self.tbAllInfo[nNpcIndex].szTreeType = szTreeType
	self.tbAllInfo[nNpcIndex].szOwer = szOwer
	self.tbAllInfo[nNpcIndex].szWork = szWork
end

function tbValenTree:DelTree(nNpcIndex)
	if self.tbAllInfo[nNpcIndex] then
		self.tbAllInfo[nNpcIndex] = nil
	end
end

function tbValenTree:GetTreeInfo(nNpcIndex)
	if self.tbAllInfo[nNpcIndex] == nil then
		return
	end
	return self.tbAllInfo[nNpcIndex]
end

function tbValenTree:ShowRandomDialog(nNpcIndex)
	local szTreeType = self:GetTreeInfo(nNpcIndex).szTreeType
	local nDialogId = random(1, getn(ValenAct_tbConfig[szTreeType].tbDialog))
	Talk(1, "", ValenAct_tbConfig[szTreeType].tbDialog[nDialogId])
	return
end

function tbValenTree:Create(szTreeType)
	local nSubWordId, nX, nY = GetWorldPos()
	local szPlayerName = GetName()
	local szNpcName = format("%s cña %s", ValenAct_tbConfig[szTreeType].tbName[1], szPlayerName)
	local nNpcId = ValenAct_tbNpcId[1]
	local nMapIndex = SubWorldID2Idx(nSubWordId)
	if nMapIndex and nMapIndex >= 0 then
		local nNpcIndex = AddNpcEx(nNpcId, 95, 0, nMapIndex, nX*32, nY*32, 0, szNpcName, 0)
		if nNpcIndex and nNpcIndex > 0 then
			local nPubTime = random(1,30)
			SetNpcActiveRegion(nNpcIndex, 1)				
			SetNpcParam(nNpcIndex, ValenAct_TREE_STATE, 1)	
			SetNpcParam(nNpcIndex, ValenAct_TSK_STATE, 0)
			SetNpcParam(nNpcIndex, ValenAct_TSK_PUBTIME, nPubTime)
			SetNpcParam(nNpcIndex, ValenAct_TSK_CREATETIME, GetCurServerTime())
			SetNpcParam(nNpcIndex, ValenAct_TSK_SCORE, 0)
			SetNpcParam(nNpcIndex, ValenAct_TSK_AWARD, 0)
			SetNpcParam(nNpcIndex, ValenAct_TSK_SINGLE_TIME, 0)
			SetNpcTimer(nNpcIndex, 18*nPubTime)
			SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\39\\tree.lua")
			self:AddTree(nNpcIndex, szTreeType, szPlayerName)
		end
	end
end


