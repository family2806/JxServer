--description: ���ų�ʦ���� ��˿�������㱦��
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()

	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("һ�������ӡ�", 2, "Ҫ/accept", "��Ҫ/refuse")
		else
			Talk(1,"","���Ѵ�����һ�����䣬�����ٿ����˱���!")
		end
	elseif (UTask_tm == 60*256+70) then
		Talk(1,"","�����ѿ�")
	else
		Talk(1,"","��򿪱��䣬���ǣ��������Ѿ�������!")
	end
end;

function accept()
	Earn(10000)
	SetTask(2, 60*256+70)
	AddNote("����˿��������ı�������һ��������. ")
	Msg2Player("���һ�������� ")
end;

function refuse()
end;
