function main()
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();--队伍人数
	if nMemCount == 0 then
		Msg2Player("您在30分钟内获得双倍经验值奖励.")
		AddSkillState(440, 1, 1, 32400);
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember( i );--队伍中第i个人PlayerIndex
			Msg2Player("您在30分钟内获得双倍经验值奖励.")
			AddSkillState(440, 1, 1, 32400);
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end