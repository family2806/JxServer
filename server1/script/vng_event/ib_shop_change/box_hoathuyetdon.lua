Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "�m������Ѫ��", tbProp = {6,1,2953,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊ���������ĲƲ���������%d %dx%dװ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"Giamgia_KTC", "ʹ�û�Ѫ�����"});
	
	return 0
end

