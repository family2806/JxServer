-- ���� ·��NPC ����ɣ�ؤ��10������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+20) then		--10��������
		SetTask(8,10*256+30)
		Talk(5,"L10_question_1","�þư��þƣ�һ����������˱�!...","�������������̳���ǻ�Ȫ����?","�����Ҿ�������ɣ�����ǻ�Ȫ�ƣ�������˭!","����ؤ����ӣ�������������֪�ɷ���̳��Ȫ���ø����£�","�����ش���ҵ����⣬��ƿ�ƾ��͸���!")
	elseif (UTask_gb == 10*256+30) then		--���³���
		Talk(1,"L10_question_1","�����������Ҽ���!")
	elseif ((UTask_gb == 10*256+40) and (HaveItem(76) == 0)) then		--�����ҰѾ�Ū����
		Talk(3,"","ʲô����Ū���˾�?","�ҵľư�!","�ܺã���������Ҳ�Ծ��м�ʶ���͸���!")
		AddEventItem(76)
		Msg2Player("�л�Ȫ��")
	else
		Talk(1,"","���Ҹ�һ�����ɣ�")
	end
end;

function L10_question_1()
	Say("��һ�ʣ���Ȫ�ƵĻ�Ȫ��ָʲô?",4,"���� /L10_wrong","����/L10_wrong","Ȫˮ/L10_question_2","�������� /L10_wrong")
end;

function L10_question_2()
	Say("��ͷ�����£���Ӱ�ɼ��ˣ���ʲô?",4,"�ܶ���/L10_wrong","3 �� /L10_question_3","2 �� /L10_wrong","1 �� /L10_wrong")
end;

function L10_question_3()
	Say("������:�����ĸ�����ָ�Ƶ�����",4,"���� /L10_wrong","����/L10_wrong","���� /L10_wrong","��� /L10_correct")
end;

function L10_wrong()
	Talk(1,"","���ˣ�������;���Ե!")
end;

function L10_correct()
	Talk(1,"","�ܺã���������Ծ�Ҳ�м�ʶ���͸���!")
	AddEventItem(76)
	SetTask(8,10*256+40)
	AddNote("�л�Ȫ�� ")
	Msg2Player("�л�Ȫ�� ")
end;
