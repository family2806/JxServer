function main()
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();--��������
	if nMemCount == 0 then
		Msg2Player("����30�����ڻ��˫������ֵ����.")
		AddSkillState(440, 1, 1, 32400);
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember( i );--�����е�i����PlayerIndex
			Msg2Player("����30�����ڻ��˫������ֵ����.")
			AddSkillState(440, 1, 1, 32400);
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end