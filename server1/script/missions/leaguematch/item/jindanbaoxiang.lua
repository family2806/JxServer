Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName=" Kim �an ch�n kinh ", tbProp={6, 1, 2217, 1, 0, 0}, nExpiredTime = 10080},
	{szName=" H�ng �nh b�o r��ng ", tbProp={6, 1, 2218, 1, 0, 0} , nBindState = -2},
}
function main()
	
	
	if  CountFreeRoomByWH(1, 1, 1) < 1 then
		Talk(1, "", format("V� b�o ��m ��i hi�p t�i s�n an to�n , xin/m�i l�u l�i %d %dx%d trang b� ch� tr�ng ", 1, 1, 1))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "jindanbaoxiang")
	
end