ITEMTYPE = 1; --��������
szItem = "������"
szEffect = "����7��";
nSkillId = 674;
nSkillLevel = 15;
nTime = 7;

function main(nItemID, nNpcIndex)
	
	local nTargetPlayerIndex = NpcIdx2PIdx(nNpcIndex)
	if nTargetPlayerIndex == 0 then
		Msg2Player("�õ���ֻ�ܶ����ʹ��!");
		return 1
	end
	
	local szSelfName = GetName()
	local szTargetName = GetNpcName(nNpcIndex)
	local szItemName = GetItemName(nItemID)
	
	local nOldPlayerIndex = PlayerIndex
	
	PlayerIndex = nTargetPlayerIndex
	AddSkillState(nSkillId, nSkillLevel, 0, nTime * 18)
	Msg2Player(format("%s����ʹ����:%s!", szSelfName, szItemName));
	PlayerIndex = nOldPlayerIndex
	
	Msg2Player(format("���Ŀ��:%s ʹ��:%s!", szTargetName, szItemName));
	
	return 0
end