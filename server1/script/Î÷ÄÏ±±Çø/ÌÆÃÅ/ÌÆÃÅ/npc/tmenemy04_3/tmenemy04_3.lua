--description: ���Ź�ʯ�����3 20������
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(39) == 0)) then		--û�й�ʯ��˿����
		AddEventItem(39)
		Msg2Player("�õ�������˿�������顰�ߡ��� ")
		AddNote("�õ�������˿�������顰�ߡ���")
	end
end;
