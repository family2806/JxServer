--description: ������������ 20������
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+40) and (HaveItem(41) == 0) then			-- ������50%��Ϊ100%
		AddEventItem(41) 
		Msg2Player("�õ�����Ȧ ")
		AddNote("��������ܳ��������õ�����Ȧ")
	end
end;
