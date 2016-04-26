-- 文件名　：dabaijuwanlibao.lua
-- 创建者　：wangjingjun
-- 内容　　：大白驹丸礼包 集合三个大白驹丸
-- 创建时间：2011-07-12 10:38:31

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "大白驹丸", tbProp = {6,1,130,1,0,0}, nCount = 3},	
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
	tbAwardTemplet:GiveAwardByList(%tbAward, "使用大白驹丸礼包", 1)
	return 0
end