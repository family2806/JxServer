Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName="��ɣ����",tbProp={0,11,494,1,0,0},nCount=2,nExpiredTime=180},
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ���Ʋ���ȫ�������� %d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "ʹ�÷�ɣ����", 1)
	return 0
end