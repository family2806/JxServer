Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName="��� - Ӣ��ս��",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ���Ʋ���ȫ�������� %d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "sudungquangtrangcamhop", 1)
	return 0
end