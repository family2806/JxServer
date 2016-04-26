Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName="金丹真经", tbProp={6, 1, 2217, 1, 0, 0}, nExpiredTime = 10080},
	{szName="鸿影宝箱", tbProp={6, 1, 2218, 1, 0, 0} , nBindState = -2},
}
function main()
	
	
	if  CountFreeRoomByWH(1, 1, 1) < 1 then
		Talk(1, "", format("为确保大侠财产安全，请留下 %d %dx%d 装备空位", 1, 1, 1))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "jindanbaoxiang")
	
end