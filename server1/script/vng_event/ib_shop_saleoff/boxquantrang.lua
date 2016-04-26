Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName="面具 - 英雄战场",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "sudungquangtrangcamhop", 1)
	return 0
end