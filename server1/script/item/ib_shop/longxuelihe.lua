-- �ļ�������longxuelihe.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������Ѫ��� ʹ�ÿɻ��
-- ����ʱ�䣺2011-07-11 11:54:21

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "��Ѫ��", tbProp = {6,1,2117,1,0,0}, nCount = 3},	
	{szName = "�ν������", tbProp = {6,1,190,1,0,0}, nCount = 5},
	{szName = "�ν�������", tbProp = {6,1,178,1,0,0}, nCount = 5},	-- ��ƷID��ȷ��
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ�������ĲƲ���ȫ��������%d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	-- �жϱ����ռ�
	tbAwardTemplet:GiveAwardByList(%tbAward, "ʹ����Ѫ���", 1)
	return 0
end