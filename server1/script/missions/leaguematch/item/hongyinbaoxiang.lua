Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName="鸿影之沈园晚醉", nQuality=1, tbProp={0, 204}, nExpiredTime = 1440, nBindState = -2},
	{szName="鸿影之剑挂西方", nQuality=1, tbProp={0, 205}, nExpiredTime = 1440, nBindState = -2},
	{szName="鸿影之苜蓿相忘", nQuality=1, tbProp={0, 206}, nExpiredTime = 1440, nBindState = -2},
	{szName="鸿影之红袖招", nQuality=1, tbProp={0, 207}, nExpiredTime = 1440, nBindState = -2},
}
function main()
	
	if  CountFreeRoomByWH(2, 5, 1) < 1 then
		Talk(1, "", format("为确保大侠财产安全，请留下 %d %dx%d 装备空位", 1, 2, 5))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "hongying baoxiang")
	
end