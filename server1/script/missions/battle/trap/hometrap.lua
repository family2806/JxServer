Include("\\script\\missions\\battle\\rule.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
function main(nAreaId)
	
	local nMapId = GetWorldPos()
	local szName = GetName()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if pDungeon.pBattle.nState == RUN_STATE then
		local nX, nY = pDungeon:GetRandomAPos(nAreaId, "hometocenterpos")
		SetPos(floor(nX/32), floor(nY/32))
		SetFightState(1)
	else
		local nCamp = pDungeon.pBattle:GetPlayerCamp(szName)
		if nCamp then
			local nX, nY = pDungeon:GetRandomAPos(CAMP2AREA[nCamp], "homepos")
			SetPos(floor(nX/32), floor(nY/32))
			SetFightState(0)
			Msg2Player("ǰ��ɽ���ص����϶��з���!�㲻Ҫ�����ǰ��")
		end
	end
end