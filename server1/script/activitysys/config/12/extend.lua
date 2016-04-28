Include("\\script\\activitysys\\config\\12\\head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\12\\variables.lua")

pActivity.nPak = curpack()

pActivity.tbTaskList = {}
pActivity.nAutoId = 0
pActivity.nTaskCount = 0
pActivity.tbWinners = {}

local MAX_TASK_COUNT = 20

function pActivity:GiveTask()

	local szName = GetName()
	
	if self.nTaskCount >= %MAX_TASK_COUNT then
		return Talk(1, "", "Ng­êi ®i chuyÓn hµng nhiÒu qu¸, xin ®¹i hiÖp h·y chê ®îi.")
	end
	
	for k,v in self.tbTaskList do
		if v.szPlayerName == szName then
			return Talk(1, "", "Ng­¬i ®· tiÕp nhËn nhiÖm vô, kh«ng ®­îc nhËn tiÕp.")
		end
	end
	
	for k,v in self.tbWinners do
		if k == szName then
			return Talk(1, "", "PhÇn th­ëng lÇn tr­íc ng­¬i vÉn ch­a nhËn.")
		end
	end
	
	if self.pCompose:Compose() == 0 then
		return 
	end
	
	local pTask = {}
	pTask.nId = self:NewId()
	pTask.szPlayerName = szName
	pTask.nState = 0
	local nMapId = GetWorldPos()
	local szNpcName = format("%s Xe Ngùa", szName)

	DynamicExecute("\\script\\activitysys\\config\\12\\carriage.lua", "add_carriage", nMapId, pTask.nId, szNpcName, GetCurCamp())
	self:AddEscortTask(pTask.nId, pTask)	

	return 
end

function pActivity:NewId()
	self.nAutoId = self.nAutoId + 1
	return self.nAutoId
end

function pActivity:AddEscortTask(nTaskId, pTask)
	self.tbTaskList[nTaskId] = pTask
	self.nTaskCount = self.nTaskCount + 1
end

function pActivity:DelEscortTask(nTaskId)
	self.tbTaskList[nTaskId] = nil
	self.nTaskCount = self.nTaskCount - 1
end

function pActivity:TaskFailed(nTaskId, nNpcIndex)
	local pTask = self.tbTaskList[nTaskId]
	if not pTask then
		return
	end
	local szName = pTask.szPlayerName
	local  nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, "NhiÖm vô cña ng­¬i ®· thÊt b¹i.")
	end
	self:DelEscortTask(nTaskId)
end

function pActivity:TaskFinish(nTaskId, nNpcIndex)
	local pTask = self.tbTaskList[nTaskId]
	if not pTask then
		return
	end
	local szName = pTask.szPlayerName
	local  nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, "NhiÖm vô hoµn thµnh, ng­¬i cã thÓ trë vÒ nhËn phÇn th­ëng.")
	end
	self:AddWinner(szName)
	self:DelEscortTask(nTaskId)
end

function pActivity:AddWinner(szName)
	self.tbWinners[szName] = 1
end

function pActivity:DelWinner()
	local szName = GetName()
	self.tbWinners[szName] = nil
end

function pActivity:IsWinner()
	local szName = GetName()
	--return self.tbWinners[szName] == 1
	if self.tbWinners[szName] ~= 1 then
		Talk(1, "", "§¹i hiÖp vÉn ch­a giao hµng cho ta, nhanh ®i chuyÓn hµng ®Õn ®©y ®i.")
		return
	end
	
	return 1
end

function pActivity:CheckCamp(nCamp, szFailMsg)

	nLevel = lib:NumberParamTrans(nCamp)
	
	if GetCurCamp() ~= nCamp then
		return 1
	elseif szFailMsg then
		lib:ShowMessage(szFailMsg)
	end
	
end

function pActivity:ServerStart()
	local tbNpcId = {1607, 1608, 1609}
	
	for i=1,getn(%MOSTER_POS) do
		local nIndex = random(1, 3)
		NpcFunLib:AddFightNpc({szName="GiÆc Cá",nNpcId=tbNpcId[nIndex],nLevel=95,bNoRevive=0},{%MOSTER_POS[i]})
	end
	
end


function pActivity:GiveAward()
	
	local tbAward = {
		[1]={nExp_tl=40e6},
		[2]={szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nCount=1},
	}
	tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "NhËn phÇn th­ëng tõ Th­¬ng Bu«n"})
	
end

local tbFormula = {
	nWidth = 0,
	nHeight = 0,
	szComposeTitle = "Hçn Nguyªn Linh Lé",
	szFailMsg = "Ng­¬i kh«ng cã Hçn Nguyªn Linh Lé"
}

tbFormula.tbMaterial = {
	{
	szName="Hçn Nguyªn Linh Lé",
	tbProp={6,1,2312,1,0,0},
	nCount=1,
	pBindLimit = function(tbItem, nItemIndex)
		if GetItemBindState(nItemIndex) == 0 then
			return 1
		end
	end
	},
}
	
pActivity.pCompose = tbActivityCompose:new(tbFormula, "Giao Hçn Nguyªn Linh Lé")


