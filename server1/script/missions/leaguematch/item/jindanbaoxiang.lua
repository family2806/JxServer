Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName="���澭", tbProp={6, 1, 2217, 1, 0, 0}, nExpiredTime = 10080},
	{szName="��Ӱ����", tbProp={6, 1, 2218, 1, 0, 0} , nBindState = -2},
}
function main()
	
	
	if  CountFreeRoomByWH(1, 1, 1) < 1 then
		Talk(1, "", format("Ϊȷ�������Ʋ���ȫ�������� %d %dx%d װ����λ", 1, 1, 1))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "jindanbaoxiang")
	
end