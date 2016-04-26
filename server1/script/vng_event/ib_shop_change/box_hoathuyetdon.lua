Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "阴阳活血丹", tbProp = {6,1,2953,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为保护大侠的财产，请留下%d %dx%d装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"Giamgia_KTC", "使用活血丹礼包"});
	
	return 0
end

