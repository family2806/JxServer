--description: ���̽�ʥ��������˶�Ы�������̳�ʦ����
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) and (HaveItem(102) == 0) then
		AddEventItem(102)
		Msg2Player("���һ��Կ��. ")
		AddNote("��ʥ���ڶ��㣬��ܶ�Ы�����õ�Կ�׿�����. ")
	end
end;
