Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "Hçn Nguyªn Linh Lé", tbProp = {6,1,2312,1,0,0}, nCount = 10},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"GiamGia30Thang4", "SuDungHNLLLeBao"})
	return 0
end