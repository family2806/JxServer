
Include("\\script\\activitysys\\config\\2\\ambience_npc.lua")
tbAmbience= {}

tbAmbience.tbNpcList = tbAmbienceNpc


tbAmbience.PARAM_LIST_ID = 1
tbAmbience.PARAM_POS_ID = 2

function tbAmbience:CreateNpc()
	for i=1, getn(self.tbNpcList) do
		local tbNpc = self.tbNpcList[i]
		local tbPos = tbNpc.tbPos
		local nPosId = 1
		local nMapIndex = SubWorldID2Idx(tbNpc.nMapId)
		if nMapIndex >= 0 then
			local nNpcIndex = AddNpcEx(tbNpc.nNpcId, 1, 5, nMapIndex,tbPos[nPosId][1] * 32, tbPos[nPosId][2] * 32, 1, " ", 0)
			if nNpcIndex > 0 then
				SetNpcKind(nNpcIndex, 4)
				SetNpcAI(nNpcIndex, 0)
				local nPosCount = getn(tbPos)
				if nPosCount > 1 then
					SetNpcActiveRegion(nNpcIndex, 1)				
					SetNpcParam(nNpcIndex, self.PARAM_POS_ID, nPosId)	
				end
				if nPosCount > 1 or tbNpc.nSkillId then	
					SetNpcParam(nNpcIndex, self.PARAM_LIST_ID, i)
					SetNpcTimer(nNpcIndex, 18*10)
					SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\2\\ambience.lua")
				end
			end
		end
	end
end

MAX_DIS = 10
function tbAmbience:IsArriveAt(nNpcIndex, nX, nY)
	local nX32, nY32 = GetNpcPos(nNpcIndex)
	
	if abs(nX - nX32/32) < MAX_DIS and abs(nY - nY32/32) < MAX_DIS then
		return 1
	end
end

function tbAmbience:Walk(nNpcIndex)
	local nListId = GetNpcParam(nNpcIndex, self.PARAM_LIST_ID)
	local nNextPosId = GetNpcParam(nNpcIndex, self.PARAM_POS_ID)
	local tbNpc = self.tbNpcList[nListId]
	if not tbNpc or nNextPosId == 0 then
		return
	end
	
	local tbPos = tbNpc.tbPos
	if self:IsArriveAt(nNpcIndex, tbPos[nNextPosId][1], tbPos[nNextPosId][2]) then
		nNextPosId = mod(nNextPosId, getn(tbPos)) + 1
		SetNpcParam(nNpcIndex, self.PARAM_POS_ID, nNextPosId)
	end
	if random(1,100) <= 20 then
		NpcChat(nNpcIndex, format("Merry Christmas!!"))
	end
	
	NpcWalk(nNpcIndex, tbPos[nNextPosId][1], tbPos[nNextPosId][2]);
end

function tbAmbience:CastSkill(nNpcIndex)
	local nListId = GetNpcParam(nNpcIndex, self.PARAM_LIST_ID)
	local tbNpc = self.tbNpcList[nListId]
	if not tbNpc then
		return
	end
	if random(1,100) <= tbNpc.nRate then
		local nX32, nY32 = GetNpcPos(nNpcIndex)
		NpcCastSkill(nNpcIndex, tbNpc.nSkillId, 1, nX32, nY32)
	end
end

function OnTimer(nNpcIndex, nTimeOut)
	
	%tbAmbience:Walk(nNpcIndex)
	
	%tbAmbience:CastSkill(nNpcIndex)
	
	SetNpcTimer(nNpcIndex, 18*10)
end