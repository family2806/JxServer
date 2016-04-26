Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "积功助力丸", tbProp = {6,1,2952,1,0,0}, nCount = 2},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为保护大侠的财产，请留下%d %dx%d装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"Giamgia_KTC", "使用助力丸礼包"});
	return 0
end