--description: ��ɱ������1������10������
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(51) == 0)) then			--ȡ����������Ʒ���޵��жϣ��Ա���������
		AddEventItem(51)
		Msg2Player("�õ�������Ƭһ. ")
		AddNote("�õ���ɱ��������Ƭһ. ")
	end
end;
