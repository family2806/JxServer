Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "����������", tbProp = {6,1,2952,1,0,0}, nCount = 2},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊ���������ĲƲ���������%d %dx%dװ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"Giamgia_KTC", "ʹ�����������"});
	return 0
end