Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{	
	{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=8},
	{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=8},
	{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=8},
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 10
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1)
	return 0
end