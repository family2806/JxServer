--��ԭ���� ������ ·�˾Ƶ��ƹ�ĶԻ�
--��������������: ���ֻ�
--by Dan_Deng(2003-07-21)

--ʹ�ñ���: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 3) or (UTask_world40 == 4)) then
		Talk(1,"sele_buy","�����㶹����?")
	else
		i = random(0,1)
		if (i==0) then
			Talk(1,"","������ĵ�һ�ز����Ǳ�������㶹��.")
		else
			Talk(1,"","��͹ٽ���.")
		end
	end
end;

function sele_buy()
	Say("�������������ز�����Ȼ�У����ǣ��۸��е��100������.",2,"��/yes","̫���� /no")
end;

function yes()
	if(GetCash() >= 100)then
		Talk(1,"","���ԣ�һ�����㶹��!")
		Pay(100);
		AddEventItem(187);
		Msg2Player("����һ�����㶹��");
		AddNote("��һ�����㶹�� ")
--		SetTask(68,4);
	else
		Talk(1,"","���ݲ����������⣬ʲôʱ��Ǯ��������.")
	end
end;

function no()
end;
