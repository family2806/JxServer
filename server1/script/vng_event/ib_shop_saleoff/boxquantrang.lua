Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "sudungquangtrangcamhop", 1)
	return 0
end