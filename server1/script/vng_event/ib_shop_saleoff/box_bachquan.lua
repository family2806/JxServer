Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	--{szName = "KÝch C«ng Trî Lùc Hoµn", tbProp = {6,1,2952,1,0,0}, nCount = 5, nExpiredTime=4320},	
	{szName = "Long HuyÕt Hoµn", tbProp = {6,1,2117,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "Viªm §Õ LÖnh", tbProp = {6,1,1617,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "Thiªn B¶o Khè LÖnh", tbProp = {6,1,2813,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "LÖnh Bµi Thñy TÆc", tbProp = {6,1,2745,1,0,0}, nCount = 1,nExpiredTime=1440},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"GiamGia30Thang4", "SuDungBachQuanLeBao"})
	return 0
end