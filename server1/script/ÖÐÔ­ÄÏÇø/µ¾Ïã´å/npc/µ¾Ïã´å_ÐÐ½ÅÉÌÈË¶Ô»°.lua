--description: ���ִ�_�н�����
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan


function main()
	UTask_world38=GetTask(66)
	if (UTask_world38 == 2) then
		Say("��������������������ҩ��ֻҪ200��! ", 2 ,"��/yes","����/no")
	else	
		Talk(1,"","��Ϊ�н����ˣ����ϴ��������ǲ��ף��������еĻ������Ū���û�!")
	end
end;

function yes()
	if (GetCash()<200) then
		Talk(1,"","������Ǯ��������!")
	else
		Pay(200)
		AddEventItem(142)
		Msg2Player("���н����˴�������. ")
		AddNote("���н����˴�������. ")
	end
end

function no()
end
