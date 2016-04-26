Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
function main()
	local nMapId, nX,nY = GetWorldPos()
	if  GameFloor1.tbMapList[nMapId] ~= 1 then
		Msg2Player("只能在天池秘境第一层使用")
		return 1
	end
	SetFightState(0)
end