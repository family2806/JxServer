--description: ���ų�ʦ���� ��˿�������㱦��
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("������һ���������������", 2, "��Ҫ/accept", "����Ҫ /refuse")
		else
			Talk(1,"","�����ѿ�")
		end
	elseif (UTask_tm == 60*256+70) then 
		Talk(1,"","���Ѵ�����һ�����䣬�����ٿ����˱���!")
	else
		Talk(1,"","��򿪱��䣬���ǣ�������������!")
	end
end;

function accept()
	AddEventItem(49)
	Msg2Player("�o�õ����Ǿ����� ")
--	SetTask(2, 67)
	AddNote("����˿����������2�����䣬��������һ�������õ����Ǿ�����. ")
end;

function refuse()
end;
