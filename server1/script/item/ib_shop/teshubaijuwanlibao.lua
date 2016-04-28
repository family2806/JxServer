-- 文件名　：teshubaijuwanlibao.lua
-- 创建者　：wangjingjun
-- 内容　　：特殊白驹丸 集合三个特殊白驹丸
-- 创建时间：2011-07-12 11:17:19

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "Чi B筩h C莡 Ho祅 c Bi謙", tbProp = {6,1,1157,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nCount, nWidth, nHeight))
		return 1
	end
	-- 判断背包空间
	tbAwardTemplet:GiveAwardByList(%tbAward, "使用Чi B筩h C莡 Ho祅 c Bi謙礼包", 1)
	return 0
end