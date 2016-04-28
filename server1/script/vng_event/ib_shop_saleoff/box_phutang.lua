Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName="Phï Tang DiÖn Tr¸o",tbProp={0,11,494,1,0,0},nCount=2,nExpiredTime=180},
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö dông Phï Tang CÈm Hép", 1)
	return 0
end