-- ÎÄ¼þÃû¡¡£ºdabaijuwanlibao.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£º§¹i B¹ch C©u hoµnÀñ°ü ¼¯ºÏÈý¸ö§¹i B¹ch C©u hoµn
-- ´´½¨Ê±¼ä£º2011-07-12 10:38:31

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "§¹i B¹ch C©u hoµn", tbProp = {6,1,130,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	-- ÅÐ¶Ï±³°ü¿Õ¼ä
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö dông §¹i B¹ch C©u Hoµn LÔ Bao", 1)
	return 0
end