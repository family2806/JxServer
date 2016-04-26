ITEMTYPE = 1; --公共道具
szItem = "天雷玉"
szEffect = "晕3秒";
nSkillId = 673;
nSkillLevel = 20;
nTime = 3;

function main(nItemID, nNpcIndex)
	
	local nTargetPlayerIndex = NpcIdx2PIdx(nNpcIndex)
	if nTargetPlayerIndex == 0 then
		Msg2Player("该道具只能对玩家使用!");
		return 1
	end
	
	local szSelfName = GetName()
	local szTargetName = GetNpcName(nNpcIndex)
	local szItemName = GetItemName(nItemID)
	
	local nOldPlayerIndex = PlayerIndex
	
	PlayerIndex = nTargetPlayerIndex
	AddSkillState(nSkillId, nSkillLevel, 0, nTime * 18)
	Msg2Player(format("%s 对你使用了:%s!", szSelfName, szItemName));
	PlayerIndex = nOldPlayerIndex
	
	Msg2Player(format("你对目标:%s 使用:%s!", szTargetName, szItemName));
	
	return 0
end