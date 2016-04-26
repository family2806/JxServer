Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
	
function main()
	local nMapId, nX, nY = GetWorldPos()
	if GameFloor1.tbMapList[nMapId] ~= 1 then
		Msg2Player("只能在天池秘境第一层使用")
		return 1
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize <= 1 then
		Msg2Player("在组队状态下才能使用")
		return 1
	end
	for i = 1, nTeamSize do 
		local nPlayerIndex = GetTeamMember(i)
		local nTmpMapId, nX, nY = DynamicExecuteByPlayer(nPlayerIndex, "", "GetWorldPos")
		if GameFloor1.tbMapList[nTmpMapId] == 1 then
			DynamicExecuteByPlayer(nPlayerIndex, "", "SetFightState", 0)
		end
	end
end