Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "Thiªn Long LÖnh", tbProp = {6,1,2256,1,0,0}, nCount = 2, nExpiredTime=4320},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö dông Thiªn Long LÔ Hép", 1)
	return 0
end