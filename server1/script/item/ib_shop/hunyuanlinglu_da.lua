-- �ļ�������hunyuanlinglu_da.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������Ԫ��¶���� ����1000����ʯ���Լ�15���������ƺ�15��ʮ��������ľ��
-- ����ʱ�䣺2011-07-12 14:53:11

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\jingli.lua")

-- ��������Ѱ�ҿ�ʯ�������ֵΪ 211 - 216
local renwuSetmagicLevel = function(nItemIndex)
	SetItemMagicLevel(nItemIndex, 1, random(211,216)) -- ���òɿ�����
end


-- ��������Ѱ�ҿ�ʯ�������ֵΪ 211 - 216
local tbMask = 
{
	{szName = "���� ", tbProp = {6,2,1020,1,0,0}, nExpiredTime = 7*24*60, CallBack = renwuSetmagicLevel},	
	{szName = "ľ��", tbProp = {6,1,2969,1,0,0}, nCount = 15, nExpiredTime = 7*24*60},	
}

function main(nItemIndex)
--	local nWidth = 1
--	local nHeight = 2
--	local nCount = 16
	local nEnergy = 1000
--	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
--		Say(format("Ϊȷ�������ĲƲ���ȫ��������%d %dx%d װ����λ", nCount, nWidth, nHeight))
--		return 1
--	end
	
--	local nRenWuCount = 15
--	local tbRealyAward = {}
	
--	for i=1,nRenWuCount do
--		tinsert(tbRealyAward, %tbMask[1])
--	end
--	tinsert(tbRealyAward, %tbMask[2])
	
	local player = Player:New(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	if (potion:Use(nEnergy) == 1) then
		tbAwardTemplet:GiveAwardByList(tbRealyAward, "ʹ�û�Ԫ��¶����", 1)
		return 0
	else
		return 1
	end
end
