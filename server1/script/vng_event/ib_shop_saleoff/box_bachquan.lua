Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	--{szName = "����������", tbProp = {6,1,2952,1,0,0}, nCount = 5, nExpiredTime=4320},	
	{szName = "��Ѫ��", tbProp = {6,1,2117,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "�׵���", tbProp = {6,1,1617,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "ǧ������", tbProp = {6,1,2813,1,0,0}, nCount = 1,nExpiredTime=1440},	
	{szName = "ˮ������", tbProp = {6,1,2745,1,0,0}, nCount = 1,nExpiredTime=1440},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("Ϊȷ���Ʋ���ȫ�������� %d %dx%d װ����λ", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"GiamGia30Thang4", "ʹ�ðٹ����"})
	return 0
end