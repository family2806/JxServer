-- ؤ���ض� ս��NPC03 ��ʦ���񣨶�Ӧ����5��
-- by��Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(202) == 0) then			--����������û��Կ��
		AddEventItem(202)
		AddNote("���ܶ�����㣬���һ��Կ��")
		Msg2Player("���ܶ�����㣬���һ��Կ��")
	end
end;
