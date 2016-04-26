-- 文件名　：hunyuanlinglu_da.lua
-- 创建者　：wangjingjun
-- 内容　　：混元灵露（大） 含有1000精炼石，以及15个任务令牌和15个十级的修炼木人
-- 创建时间：2011-07-12 14:53:11

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\jingli.lua")

-- 任务令牌寻找矿石，任务的值为 211 - 216
local renwuSetmagicLevel = function(nItemIndex)
	SetItemMagicLevel(nItemIndex, 1, random(211,216)) -- 设置采矿任务
end


-- 任务令牌寻找矿石，任务的值为 211 - 216
local tbMask = 
{
	{szName = "令牌 ", tbProp = {6,2,1020,1,0,0}, nExpiredTime = 7*24*60, CallBack = renwuSetmagicLevel},	
	{szName = "木人", tbProp = {6,1,2969,1,0,0}, nCount = 15, nExpiredTime = 7*24*60},	
}

function main(nItemIndex)
--	local nWidth = 1
--	local nHeight = 2
--	local nCount = 16
	local nEnergy = 1000
--	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
--		Say(format("为确保大侠的财产安全，请留下%d %dx%d 装备空位", nCount, nWidth, nHeight))
--		return 1
--	end
	
--	local nRenWuCount = 15
--	local tbRealyAward = {}
	
--	for i=1,nRenWuCount do
--		tinsert(tbRealyAward, %tbMask[1])
--	end
--	tinsert(tbRealyAward, %tbMask[2])
	
	local player = Player:New(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	if (potion:Use(nEnergy) == 1) then
		tbAwardTemplet:GiveAwardByList(tbRealyAward, "使用混元灵露（大）", 1)
		return 0
	else
		return 1
	end
end
