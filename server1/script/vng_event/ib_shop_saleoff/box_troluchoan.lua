Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "积功助力丸", tbProp = {6,1,2952,1,0,0}, nCount = 5, nExpiredTime=4320},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "使用助力丸礼包", 1)
	return 0
end