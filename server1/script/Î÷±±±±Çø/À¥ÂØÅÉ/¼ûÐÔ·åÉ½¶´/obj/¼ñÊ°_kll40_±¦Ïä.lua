-- ���Է�ɽ�� ���� ����40������
-- by��Dan_Deng(2003-07-30)

function main()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 40*256+20) and (HaveItem(212) == 1)) then		-- Կ��Ӧʹ��ID��
		Msg2Player("��õ�Ѫ����")
		DelItem(212)
		AddEventItem(9)
		AddNote("��õ�Ѫ����")
		Msg2Player("��õ�Ѫ����")
	else
		Talk(1,"","������ס��")
	end
end;
