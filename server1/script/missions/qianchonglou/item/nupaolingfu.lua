Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\missions\\qianchonglou\\rule.lua")
MAX_LIMIT = 8
function main()
	if tbPlayerHandle:GetDailyLimit() >= MAX_LIMIT then
		Talk(1, "", format("每天最多只能使用 %d个", MAX_LIMIT))
		return 1
	end
	local _,_,nMapIndex = GetPos()
	
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon or pDungeon.szDungeonType ~= "endless tower" then
		Talk(1, "","该道具只能在天重楼使用.")
		return 1
	end
	tbPlayerHandle:AddBasePoint(100)
	tbPlayerHandle:AddDailyLimit(1)
end