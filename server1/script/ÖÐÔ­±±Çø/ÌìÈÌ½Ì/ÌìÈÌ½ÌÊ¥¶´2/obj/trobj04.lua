--description: ���̽�ʥ�����㱦�� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) then
		if (HaveItem(132) == 1) then
			Talk(1,"","�����ѿ�")
		elseif (HaveItem(102) == 1) then
			DelItem(102)
			AddEventItem(132)
--			SetTask(4, 68)
			AddNote("�򿪱��䣬�õ�����ʥ��Ƥ��һ��")
			Msg2Player("�򿪱��䣬�õ���Ƥ��һ�� ")
		else
			Talk(1,"","û��Կ�ף��򲻿�����.")
		end
	else
		Talk(1,"","û��Կ�ף��򲻿�����.")
	end
end;
