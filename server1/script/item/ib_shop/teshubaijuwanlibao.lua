-- 文件名　：teshubaijuwanlibao.lua
-- 创建者　：wangjingjun
-- 内容　　：特殊白驹丸 集合三个特殊白驹丸
-- 创建时间：2011-07-12 11:17:19

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "特别大白驹丸", tbProp = {6,1,1157,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保大侠的财产安全，请留下%d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	-- 判断背包空间
	tbAwardTemplet:GiveAwardByList(%tbAward, "使用特别大白驹丸礼包", 1)
	return 0
end