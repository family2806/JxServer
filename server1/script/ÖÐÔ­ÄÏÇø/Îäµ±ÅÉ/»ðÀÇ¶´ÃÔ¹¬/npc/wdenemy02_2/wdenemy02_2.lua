--description: �䵱ɽ ���Ƕ��Թ�����
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+50) and (HaveItem(67) == 0) then
		Talk(2,"","��Ϊ��������ϣ��ű����������������������!","��Ҫ��������!")
		AddEventItem(67)
		Msg2Player("���������ӻ����ϰ�Ķ��ӣ����͸���һ�����. ")
--		SetTask(5, 26)
		AddNote("��ܻ��Ƕ�����ǣ����������ӻ����ϰ�Ķ��ӣ����һ�����. ")
	end
end;
