--description: ��ɱ������6������10������
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(56) == 0)) then
		AddEventItem(56)
		Msg2Player("�õ�������Ƭ6. ")
		AddNote("�õ���ɱ��������Ƭ6. ")
	end
end;
