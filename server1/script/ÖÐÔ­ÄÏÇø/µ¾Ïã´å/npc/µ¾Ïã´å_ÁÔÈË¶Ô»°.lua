--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan

function main()
	UTask_world38=GetTask(66)
	if (UTask_world38==2) then
		Say("�������������ɽ��һֻ�ͻ��������ǹ���ҩ�ģ�������150��.", 2 ,"��/yes","����/no")
	else	
		Say("��������Ե��ˣ����ǵڶ�����û�˵�һ! ",0)	
	end
end;

function yes()
	if (GetCash() < 150) then
		Talk(1,"","����Ǯ�ˣ���������!")
	else
		Pay(150)
		AddEventItem(185)
		Msg2Player("�����˴��򻢹�")
		AddNote("�����˴��򻢹�")
	end
end;

function no()
end
	
