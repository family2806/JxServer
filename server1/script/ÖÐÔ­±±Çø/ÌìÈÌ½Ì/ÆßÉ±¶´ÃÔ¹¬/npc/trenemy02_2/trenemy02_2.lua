--description: ��ɱ������2������10������
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(52) == 0)) then
		AddEventItem(52)
		Msg2Player("�õ�������Ƭ��. ")
		AddNote("�õ���ɱ��������Ƭ��. ")
	end
end;
