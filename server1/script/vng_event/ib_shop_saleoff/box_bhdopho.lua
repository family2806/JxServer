Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{	
	{szName="�׻���ͼ��",tbProp={6,1,3173,1,0,0},nCount=8},
	{szName="�׻���ͼ��",tbProp={6,1,3174,1,0,0},nCount=8},
	{szName="�׻�Ьͼ��",tbProp={6,1,3175,1,0,0},nCount=8},
	{szName="�׻�����ͼ��",tbProp={6,1,3176,1,0,0},nCount=8},
	{szName="�׻�����ͼ��",tbProp={6,1,3177,1,0,0},nCount=8},
	{szName="�׻�����ͼ��",tbProp={6,1,3178,1,0,0},nCount=8},
	{szName="�׻�����ͼ��",tbProp={6,1,3179,1,0,0},nCount=8},
	{szName="�׻��Ͻ�ͼ��",tbProp={6,1,3180,1,0,0},nCount=8},
	{szName="�׻��½�ͼ��",tbProp={6,1,3181,1,0,0},nCount=8},
	{szName="�׻�����ͼ��",tbProp={6,1,3182,1,0,0},nCount=8},
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 10
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ���Ʋ���ȫ�������� %d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1)
	return 0
end