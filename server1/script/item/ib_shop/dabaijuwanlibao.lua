-- �ļ�������dabaijuwanlibao.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������׾������ ����������׾���
-- ����ʱ�䣺2011-07-12 10:38:31

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "��׾���", tbProp = {6,1,130,1,0,0}, nCount = 3},	
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
	tbAwardTemplet:GiveAwardByList(%tbAward, "ʹ�ô�׾������", 1)
	return 0
end