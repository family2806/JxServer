--description: �䵱ɽ ���Ƕ��Թ�����
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+20) and (HaveItem(66) == 0) then
		AddEventItem(66)
		Msg2Player("�ҵ����˵���ϵ���. ")
--	SetTask(5, 23)	
		AddNote("������Ƕ�����ܻ��ǣ��õ����˵���ϵ���. ")
	end
end;
