-- ؤ���ض� ս��NPC02 ��ʦ���񣨶�Ӧ����4��
-- by��Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(204) == 0) then			--����������û��Կ��
		AddEventItem(204)
		AddNote("���ܶ����Ĳ㣬���һ��Կ�� ")
		Msg2Player("���ܶ����Ĳ㣬���һ��Կ�� ")
	end
end;
