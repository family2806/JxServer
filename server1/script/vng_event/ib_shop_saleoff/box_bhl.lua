Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{	
	{szName = "白虎令", tbProp = {6,1,2357,1,0,0}, nCount = 10},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 10
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1)
	return 0
end