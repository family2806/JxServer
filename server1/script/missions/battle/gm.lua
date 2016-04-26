Include("\\script\\missions\\battle\\manager.lua")

function get_battle_data(szKey)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if not pDungeon.pBattle then
		return
	end
	local Data = pDungeon.pBattle.Data
	return Data:GetPLData(GetName(), szKey)
end
function set_battle_data(szKey, nValue)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if not pDungeon.pBattle then
		return
	end
	local Data = pDungeon.pBattle.Data
	Data:SetPLData(GetName(), szKey, nValue)
end

function check_queue()
	local szName = GetName()
	local pPrevBattle = BattleManagerPlayer[szName]
	if pPrevBattle then
		local bRet = pPrevBattle:IsInPlaying(szName)
		if bRet then
			return Talk(1, "",  format("你正在 %d 战场", pPrevBattle.nId))
		else
			return Talk(1, "", format("你在 %d 战场准备", pPrevBattle.nId))
		end
	end
end