Include("\\script\\activitysys\\config\\39\\seed.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local _OnBreak = function()
	Msg2Player("Thu thËp ®øt ®o¹n")
end

local _GetAward = function(nNpcIdx, dwNpcId, nFlag)
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang kh«ng ®ñ") ~= 1 then
		return 0
	end
	
	SetNpcParam(nNpcIdx, ValenAct_TSK_AWARD, 1)
	local nScore = GetNpcParam(nNpcIdx, ValenAct_TSK_SCORE)
	local nAwardCount = floor((nScore+4)/5)
--	Msg2Player(format("·ÖÊýÊÇ%d", nScore))
	local tbAward = {}
	local szAction = "get"
	if nFlag == 0 then
--By NgaVN: ÏãÃµ¹åºÍQu¶ §Ëu Hång»ñµÃÊ±ÊÇ±»ËøÎïÆ·.	
		tbAward = {{szName = "DÞ H­¬ng Hoa Hång", tbProp = {6, 1, 3113, 1, 0, 0}, nBindState = -2, nExpiredTime = 20120301, nCount = nAwardCount,},}
		szAction = format("%s %s",szAction, "DÞ H­¬ng Hoa Hång")
	else
		tbAward = {{szName = "Qu¶ §Ëu Hång", tbProp = {6, 1, 3114, 1, 0, 0}, nBindState = -2, nExpiredTime = 20120301, nCount = nAwardCount,},}
		szAction = format("%s %s",szAction, "Qu¶ §Ëu Hång")
	end
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, szAction})
	AddNpcSkillState(nNpcIdx, 662,1, 1, 0)	-- ¹Ø±Õ¸ÐÌ¾ºÅ
	Msg2Player("Thu thËp kÕt thóc!")
end 

function CheckPlantTree(nNpcIndex)
	if tbValenTree:IsDuring() ~= 1 then
		return
	end
	local tbTreeInfo = tbValenTree:GetTreeInfo(nNpcIndex)
	if tbTreeInfo == nil then
		return
	end
	
	local nTreeState = GetNpcParam(nNpcIndex, ValenAct_TREE_STATE)	
	local nStateCount = getn(ValenAct_tbNpcId)
	if nTreeState == nStateCount then
		return 1
	end
	
	local szCurPlayerName = GetName()
	if szCurPlayerName ~= tbTreeInfo.szOwer and tbTreeInfo.szTreeType == "§Ëu Hång" then
		tbValenTree:ShowRandomDialog(nNpcIndex)
		return
	elseif tbTreeInfo.szTreeType == "H¹t Gièng Hoa Hång" then
		local nTeamSize = GetTeamSize()
		if nTeamSize < 2 then
			Talk(1, "", "Xin h·y mêi ng­êi h÷u duyªn víi ng­¬i hoÆc phèi ngÉu cïng nhau tæ ®éi råi h·y ®Õn!")
			return 
		end
		
		local nInTeam, nOwerSameTeam = 0, 0
		for i = 1, GetTeamSize() do
			local nMemberIndex = GetTeamMember(i)
			local szMemberName = CallPlayerFunction(nMemberIndex, GetName)
			if szCurPlayerName == szMemberName then
				nInTeam = 1
			end
			if tbTreeInfo.szOwer == szMemberName then
				nOwerSameTeam = 1
			end
		end
		if nInTeam ~= 1 or nOwerSameTeam ~= 1 then
			tbValenTree:ShowRandomDialog(nNpcIndex)
			return
		end
	end	
	
	if tbValenTree:CheckTeamConfig(tbTreeInfo.szTreeType, ValenAct_nGrowing) ~= 1 then
		return
	end
	return 1
end

function main()
	local nNpcIndex = GetLastDiagNpc()
	if CheckPlantTree(nNpcIndex) ~= 1 then
		return
	end
	
	local szCurPlayerName = GetName()
	local nTreeState = GetNpcParam(nNpcIndex, ValenAct_TREE_STATE)	
	local nStateCount = getn(ValenAct_tbNpcId)
	local tbTreeInfo = tbValenTree:GetTreeInfo(nNpcIndex)
	if nTreeState == nStateCount then
		if szCurPlayerName == tbTreeInfo.szOwer then
			local nAward = GetNpcParam(nNpcIndex, ValenAct_TSK_AWARD)
			if nAward == 1 then
				Talk(1, "", "C©y nµy ®· ®­îc nhËn th­ëng!")
				return
			else
			Msg2Player("B¾t ®Çu thu ho¹ch")
			local nFlag = 0
			if tbTreeInfo.szWork == tbTreeInfo.szOwer then
				nFlag = 1
			end
			tbProgressBar:OpenByConfig(1, %_GetAward, {nNpcIndex, GetNpcId(nNpcIndex), nFlag}, %_OnBreak)
			end
		else
			Talk(1, "", "Ng­¬i kh«ng ph¶i chñ nh©n cña c©y nµy!")
		end
		return
	end
--	print("tree main szCurPlayerName = " .. szCurPlayerName)
--	print("tree main tbTreeInfo.szWork = " .. tbTreeInfo.szWork)
--	print("tree main tbTreeInfo.szOwer = " .. tbTreeInfo.szOwer)
	
	local nTskState =  GetNpcParam(nNpcIndex, ValenAct_TSK_STATE)
--	print("tree main nTskState = " .. nTskState)
	if szCurPlayerName == tbTreeInfo.szWork then
		--nothing
	elseif szCurPlayerName == tbTreeInfo.szOwer then
		if 1 <= nTskState and nTskState <= 2 then
			Talk(1, "", "Xin h·y mêi ng­êi cã duyªn hoÆc phèi ngÉu cña ng­¬i ®Õn hoµn thµnh nhiÖm vô!")
		else
			tbValenTree:ShowRandomDialog(nNpcIndex)
		end
		return
	end	

	
	if nTskState == 1 then
		AddNpcSkillState(nNpcIndex, 662,1, 1, 0) -- ¹Ø±Õ¸ÐÌ¾ºÅ
		local nRandTime = random(5, 15)
		local nTaskId = random(1, nTreeState+1)
		local szInfo = format("Xin h·y t¹i %sgi©y sau%s", nRandTime, ValenAct_Op[nTaskId])
		SetNpcParam(nNpcIndex, ValenAct_TSK_ID_AND_RANDOMTIME, nTaskId*100+nRandTime)
		SetNpcParam(nNpcIndex, ValenAct_TSK_ACCTIME, GetCurServerTime())
		SetNpcParam(nNpcIndex, ValenAct_TSK_STATE, nTskState+1)
		AddNpcSkillState(nNpcIndex, 764, 1, 1, 30*60*18)	-- ¿ªÆôÎÊºÅ
		Talk(1, "", szInfo)
		return
	elseif nTskState == 2 then
		local nTaskInfo = GetNpcParam(nNpcIndex, ValenAct_TSK_ID_AND_RANDOMTIME)
		local nRandTime, nTaskId = mod(nTaskInfo, 100), floor(nTaskInfo/100)
		local szTitle = format("<npc>hiÖn t¹i%s?", ValenAct_Op[nTaskId])
		local nTskAccTime = GetNpcParam(nNpcIndex, ValenAct_TSK_ACCTIME)
		local tbOpt = {}
		tinsert(tbOpt, {"X¸c nhËn", ValenTaskSure, {nNpcIndex, GetNpcId(nNpcIndex), nRandTime, nTskAccTime}})
		tinsert(tbOpt, {"Ta ®ang ®îi ®©y"})
		CreateNewSayEx(szTitle, tbOpt)
	else
		tbValenTree:ShowRandomDialog(nNpcIndex)
	end
end

function ValenTaskSure(nNpcIndex, dwNpcId, nRandTime, nTskAccTime)
	if CheckPlantTree(nNpcIndex) ~= 1 then
		return
	end
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return
	end	
	local tbScoreList = {
		{nMin = -1, nMax = 1, nScore = 10,},
		{nMin = -3, nMax = 3, nScore = 8,},
		{nMin = -5, nMax = 5, nScore = 7,},
		{nMin = -8, nMax = 8, nScore = 6,},
	}
	local nTskState =  GetNpcParam(nNpcIndex, ValenAct_TSK_STATE)
	if nTskState ~= 2 then
		return
	end
	
	local nCurAccTime = GetNpcParam(nNpcIndex, ValenAct_TSK_ACCTIME)
	if nTskAccTime ~= nCurAccTime then
		return
	end
	local nDifTime = GetCurServerTime()-(nRandTime+nCurAccTime)
	local nScore = 5
	for i = 1, getn(tbScoreList) do
		local tbScore = tbScoreList[i]
		if tbScore.nMin <= nDifTime and nDifTime <= tbScore.nMax then
			nScore = tbScore.nScore
			break
		end
	end
	nScore = nScore + GetNpcParam(nNpcIndex, ValenAct_TSK_SCORE)
	SetNpcParam(nNpcIndex, ValenAct_TSK_STATE, nTskState + 1)
	SetNpcParam(nNpcIndex, ValenAct_TSK_SCORE, nScore)
--	Msg2Player(format("·ÖÊýÊÇ%d", GetNpcParam(nNpcIndex, ValenAct_TSK_SCORE)))
	AddNpcSkillState(nNpcIndex, 764,1, 1, 0) -- ¹Ø±ÕÎÊºÅ
end

function ChangeValenTreeNpc(nOldNpcIndex, nFeatureId, nTreeState)
	local tbTreeInfo = tbValenTree:GetTreeInfo(nOldNpcIndex)
	local szPlayerName = tbTreeInfo.szOwer
	local szNpcName = format("%s cña %s", ValenAct_tbConfig[tbTreeInfo.szTreeType].tbName[nTreeState], szPlayerName)
	local nX32, nY32, nMapIndex = GetNpcPos(nOldNpcIndex)
	local nResultNpcIndex = nil
	if nMapIndex and nMapIndex >= 0 then
		local nNewNpcIndex = AddNpcEx(nFeatureId, 95, 0, nMapIndex, nX32, nY32, 0, szNpcName, 0)
		if nNewNpcIndex and nNewNpcIndex > 0 then
			local nPubTime = random(1,30)
			local nOldScore = GetNpcParam(nOldNpcIndex, ValenAct_TSK_SCORE)
			SetNpcActiveRegion(nNewNpcIndex, 1)				
			SetNpcParam(nNewNpcIndex, ValenAct_TSK_CREATETIME, GetCurServerTime())
			SetNpcParam(nNewNpcIndex, ValenAct_TSK_SCORE, nOldScore)
			SetNpcParam(nNewNpcIndex, ValenAct_TSK_AWARD, 0)
			SetNpcScript(nNewNpcIndex, "\\script\\activitysys\\config\\39\\tree.lua")
			tbValenTree:AddTree(nNewNpcIndex, szTreeType, szPlayerName, tbTreeInfo)
			nResultNpcIndex = nNewNpcIndex
		end
	end
	tbValenTree:DelTree(nOldNpcIndex)
	DelNpc(nOldNpcIndex)
	return nResultNpcIndex
end

function OnTimer(nNpcIndex)
	local nTreeState = GetNpcParam(nNpcIndex, ValenAct_TREE_STATE)	
--	print("nTreeState", nTreeState)
	local nStateCount = getn(ValenAct_tbNpcId)
--	print("nStateCount", nStateCount)
	local nCurTime = GetNpcParam(nNpcIndex, ValenAct_TSK_CREATETIME)
	local nDifTime = GetCurServerTime()-nCurTime
--	print("nDifTime", nDifTime)
	if nTreeState == nStateCount then
		tbValenTree:DelTree(nNpcIndex)
		DelNpc(nNpcIndex)
		return
	end
	
	
	local nTskState = GetNpcParam(nNpcIndex, ValenAct_TSK_STATE)
--	print("nTskState", nTskState)
	if nTskState == 0 then
		local nPubTime = GetNpcParam(nNpcIndex, ValenAct_TSK_PUBTIME)
		AddNpcSkillState(nNpcIndex, 662, 1, 1, 30*60*18) -- ¿ªÆô¸ÐÌ¾ºÅ
		SetNpcParam(nNpcIndex, ValenAct_TSK_STATE, nTskState+1)
		SetNpcParam(nNpcIndex, ValenAct_TSK_SINGLE_TIME, nPubTime)
		SetNpcTimer(nNpcIndex, (ValenAct_nMidTime-nPubTime)*18)
	elseif nTskState == 1 then
		AddNpcSkillState(nNpcIndex, 662,1, 1, 0) -- ¹Ø±Õ¸ÐÌ¾ºÅ
		SetNpcParam(nNpcIndex, ValenAct_TSK_STATE, ValenAct_nTskStepCount)
		SetNpcParam(nNpcIndex, ValenAct_TSK_SINGLE_TIME, ValenAct_nMidTime)
		SetNpcTimer(nNpcIndex, (ValenAct_nLoopTime-ValenAct_nMidTime)*18)
	else
		
		local nTskSingleTime = GetNpcParam(nNpcIndex, ValenAct_TSK_SINGLE_TIME)
		if nTskSingleTime < ValenAct_nMidTime then
			SetNpcParam(nNpcIndex, ValenAct_TSK_SINGLE_TIME, ValenAct_nMidTime)
			SetNpcTimer(nNpcIndex, (ValenAct_nLoopTime-ValenAct_nMidTime)*18)
			return
		end
		
		if nTskState == 2 then
			AddNpcSkillState(nNpcIndex, 764,1, 1, 0) -- ¹Ø±ÕÎÊºÅ
		end
		
		if nDifTime>= ValenAct_nStepTaskTime and nDifTime < ValenAct_nStepTime then
			SetNpcTimer(nNpcIndex, 18 * ValenAct_nStepPartTime)
		else 
			local nTmpNpcIndex = nNpcIndex
			if nDifTime >= ValenAct_nStepTime then
				local nNewNpcIndex = ChangeValenTreeNpc(nNpcIndex, ValenAct_tbNpcId[nTreeState+1], nTreeState+1)
				nTmpNpcIndex = nNewNpcIndex
				SetNpcParam(nNewNpcIndex, ValenAct_TREE_STATE, nTreeState+1)	
				if nTreeState+1 == nStateCount then
					AddNpcSkillState(nNewNpcIndex, 662, 1, 1, 30*60*18) -- ¿ªÆô¸ÐÌ¾ºÅ
					SetNpcTimer(nNewNpcIndex, 18 * ValenAct_nPickTime)
					return
				end
			end
			local nPubTime = random(1,30)
			SetNpcParam(nTmpNpcIndex, ValenAct_TSK_PUBTIME, nPubTime)
			SetNpcParam(nTmpNpcIndex, ValenAct_TSK_SINGLE_TIME, 0)
			SetNpcParam(nTmpNpcIndex, ValenAct_TSK_STATE, 0)
			SetNpcTimer(nTmpNpcIndex, 18*nPubTime)
		end
	end
end