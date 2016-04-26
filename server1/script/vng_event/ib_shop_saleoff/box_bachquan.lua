Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	--{szName = "积功助力丸", tbProp = {6,1,2952,1,0,0}, nCount = 5, nExpiredTime=4320},	
	{szName = "龙血丸", tbProp = {6,1,2117,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "炎帝令", tbProp = {6,1,1617,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "千宝库令", tbProp = {6,1,2813,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "水贼令牌", tbProp = {6,1,2745,1,0,0}, nCount = 1,nExpiredTime=1440},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"GiamGia30Thang4", "使用百官礼包"})
	return 0
end