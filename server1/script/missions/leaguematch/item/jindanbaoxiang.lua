Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName=" Kim ®an ch©n kinh ", tbProp={6, 1, 2217, 1, 0, 0}, nExpiredTime = 10080},
	{szName=" Hång ¶nh b¶o r­¬ng ", tbProp={6, 1, 2218, 1, 0, 0} , nBindState = -2},
}
function main()
	
	
	if  CountFreeRoomByWH(1, 1, 1) < 1 then
		Talk(1, "", format("V× b¶o ®¶m ®¹i hiÖp tµi s¶n an toµn , xin/mêi l­u l¹i %d %dx%d trang bÞ chç trèng ", 1, 1, 1))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "jindanbaoxiang")
	
end