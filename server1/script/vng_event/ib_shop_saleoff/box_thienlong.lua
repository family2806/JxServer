Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "������", tbProp = {6,1,2256,1,0,0}, nCount = 2, nExpiredTime=4320},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ���Ʋ���ȫ�������� %d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "ʹ��������", 1)
	return 0
end