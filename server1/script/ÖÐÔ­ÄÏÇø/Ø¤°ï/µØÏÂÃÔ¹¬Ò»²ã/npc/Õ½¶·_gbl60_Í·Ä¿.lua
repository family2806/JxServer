-- ؤ���ض� ս��NPC01 ��ʦ���񣨶�Ӧ����1��
-- by��Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 0) then			--����������û��Կ��
		AddEventItem(203)
		AddNote("���ܶ���һ�㣬���һ��Կ�� ")
		Msg2Player("���ܶ���һ�㣬���һ��Կ�� ")
	end
end;
