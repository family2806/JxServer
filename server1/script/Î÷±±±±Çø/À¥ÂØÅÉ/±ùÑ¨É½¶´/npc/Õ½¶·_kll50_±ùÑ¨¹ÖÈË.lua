-- ��Ѩ�Թ� ս��NPC ��Ѩ���ˣ�����50������
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	if (GetTask(9) == 50*256+127) and (HaveItem(10) == 0) then
		AddEventItem(10)
		AddNote("��ܱ����еĹ��ˣ��õ���ͷ�ϵ�һ��ͷ�� ")
		Msg2Player("��ܱ����еĹ��ˣ��õ���ͷ�ϵ�һ��ͷ�� ")
	end
end;
