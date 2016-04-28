Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\12\\extend.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\log.lua")

NPC_PARAM_POS = 1
NPC_PARAM_DEATH = 2
NPC_PARAM_TASK_ID = 3

TRACK_LIST = 
{
	{1564*32,2759*32},
	{1581*32,2758*32},
	{1597*32,2758*32},
	{1616*32,2756*32},
	{1640*32,2755*32},
	{1665*32,2757*32},
	{1687*32,2757*32},
	{1703*32,2757*32},
	{1720*32,2755*32},
	{1733*32,2756*32},
	{1749*32,2755*32},
	{1766*32,2755*32},
	{1785*32,2756*32},
	{1809*32,2757*32},
	{1825*32,2758*32},
	{1843*32,2756*32},
	{1865*32,2755*32},
}

tbCarriage = {}


function add_carriage(nMapId, nTaskId, szName, nCamp)
	
	local szScriptPath = "\\script\\activitysys\\config\\12\\carriage.lua"

	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		local nNpcIndex = AddNpcEx(1903, 1, random(0,4), nMapIndex, %TRACK_LIST[1][1], %TRACK_LIST[1][2], 1, szName, 0)
		if nNpcIndex > 0 then
			SetNpcAI(nNpcIndex, 0)
			SetNpcCurCamp(nNpcIndex, nCamp)
			SetNpcActiveRegion(nNpcIndex, 1)
			SetNpcParam(nNpcIndex, %NPC_PARAM_POS, 2)
			SetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID, nTaskId)
			SetNpcScript(nNpcIndex, szScriptPath)
			SetNpcTimer(nNpcIndex, 18)
			return nNpcIndex
		end
	end
	return 0
end

function OnTimer(nNpcIndex, nTimeOut)
	local nPosId = GetNpcParam(nNpcIndex, %NPC_PARAM_POS)
	local tbPos =  %TRACK_LIST[nPosId]
	
	if not tbPos then
		return
	end
	
	if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
		return 
	end
	
	if is_arrive_at(nNpcIndex, tbPos[1], tbPos[2]) then
		nPosId = nPosId + 1
		SetNpcParam(nNpcIndex, %NPC_PARAM_POS, nPosId)
		tbPos =  %TRACK_LIST[nPosId]
	end
	
	if nPosId > getn(%TRACK_LIST) then
		SetNpcParam(nNpcIndex, %NPC_PARAM_DEATH, 1)
		local nTaskId = GetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID)
		pActivity:TaskFinish(nTaskId)
		DelNpc(nNpcIndex)
	else
		NpcWalk(nNpcIndex, tbPos[1]/32, tbPos[2]/32)
	end
	
	SetNpcTimer(nNpcIndex, 18)
end

function is_arrive_at(nNpcIndex, nX, nY)
	local MAX_DIS = 100
	local nX32, nY32 = GetNpcPos(nNpcIndex)

	if abs(nX - nX32) < MAX_DIS and abs(nY - nY32) < MAX_DIS then
		return 1
	end
end

function OnDeath(nNpcIndex)
	if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
		return
	end
	
	SetNpcParam(nNpcIndex, %NPC_PARAM_DEATH, 1)
	
	if (PlayerId and PlayerId > 0) and (PlayerIndex and PlayerIndex > 0) then 
		local szPlayerName = ""
		szPlayerName = GetName()
		local szAction = format("%s ®· tiªu diÖt %s", szPlayerName, GetNpcName(nNpcIndex))
		
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, szAction)		
	end
	
	local nTaskId = GetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID)
	pActivity:TaskFailed(nTaskId, nNpcIndex)
	
	local tbAward = {[1]={szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},},}
	
	if (PlayerId and PlayerId > 0) and (PlayerIndex and PlayerIndex > 0) then 
		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Carriage Drop Item", 1)
	else
		tbDropTemplet:GiveAwardByList(nNpcIndex, -1, tbAward, "Carriage Drop Item", 1)
	end
	
end
