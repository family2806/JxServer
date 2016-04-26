Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\lib\\awardtemplet.lua")
function main()
	local tbEgg = {szName="五彩幸运蛋", tbProp={6, 1, 1714, 1, 0, 0}, nCount = 10, nExpiredTime = 30}
	local pDungeon = DungeonList[MAP_ID]
	if not pDungeon then
		return
	end
	local pData = pDungeon.tbPlayer[GetName()]
	if not pData then
		return
	end
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "", "请整理背包")
	end
	if not pData.bIsGetEgg then
		tbAwardTemplet:Give(tbEgg, 1, {"乱战九州谷","领取幸运蛋"})
		pData.bIsGetEgg = 1
	else
		Talk(1, "", "你已经领奖了")
	end	
end

function OnCancel()
	
end