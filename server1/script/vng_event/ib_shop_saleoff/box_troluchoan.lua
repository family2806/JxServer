Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "KÝch C«ng Trî Lùc Hoµn", tbProp = {6,1,2952,1,0,0}, nCount = 5, nExpiredTime=4320},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö dông Trî Lùc Hoµn LÔ Bao", 1)
	return 0
end