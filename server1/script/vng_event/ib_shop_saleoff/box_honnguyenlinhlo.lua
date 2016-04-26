Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "混元灵露", tbProp = {6,1,2312,1,0,0}, nCount = 10},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"GiamGia30Thang4", "使用混元灵露礼包"})
	return 0
end