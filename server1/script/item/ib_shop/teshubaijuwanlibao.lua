-- �ļ�������teshubaijuwanlibao.lua
-- �����ߡ���wangjingjun
-- ���ݡ���������׾��� ������������׾���
-- ����ʱ�䣺2011-07-12 11:17:19

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "�ر��׾���", tbProp = {6,1,1157,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ�������ĲƲ���ȫ��������%d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	-- �жϱ����ռ�
	tbAwardTemplet:GiveAwardByList(%tbAward, "ʹ���ر��׾������", 1)
	return 0
end