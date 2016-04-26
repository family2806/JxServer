Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName="扶桑面罩",tbProp={0,11,494,1,0,0},nCount=2,nExpiredTime=180},
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("为确保财产安全，请留下 %d %dx%d 装备空位", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "使用扶桑锦盒", 1)
	return 0
end