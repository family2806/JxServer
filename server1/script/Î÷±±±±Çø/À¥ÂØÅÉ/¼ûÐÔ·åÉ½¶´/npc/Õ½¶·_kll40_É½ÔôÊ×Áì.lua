-- ���Է�ɽ���Թ� ս��NPC ɽ������ ����40������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+20) and (HaveItem(212) == 0) and (random(0,99) < 30) then
		AddEventItem(212)
		Msg2Player("�õ�һ��Կ��")
		AddNote("���ɽ�����������õ�һ��Կ��")
	end
end;
