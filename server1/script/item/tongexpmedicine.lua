IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
	--Msg2Player("�˹����Ժ󿪷�.��л֧��!")
	--return 1
	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 32400);
	else
		Say("Ŀǰ��ϵͳ˫������ʱ�䣬��ʱ�޷�ʹ�������������", 0)
		return 1
	end
	return 0
end