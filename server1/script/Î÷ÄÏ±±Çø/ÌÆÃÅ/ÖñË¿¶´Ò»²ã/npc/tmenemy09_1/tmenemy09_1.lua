--description: ���ų�ʦ���� ��˿����һ�����
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 60*256+20) and (HaveItem(99) == 0) and (random(0,99) <= 40)) then		--��������û��Կ�׶�ʱ������Ϊ50%
		AddEventItem(99) 
		Msg2Player("Nh�n ch�a kh�a th� 2 ")
--		SetTask(2, 64)
		AddNote("����˿����һ�㣬��ܹ��Nh�n ch�a kh�a th� 2 . ")
	end
end;
