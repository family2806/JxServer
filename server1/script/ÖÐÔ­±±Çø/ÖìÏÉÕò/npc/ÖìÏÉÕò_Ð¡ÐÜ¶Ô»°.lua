--��ԭ���� ������ ·��С�ܵĶԻ�
--��������������: ���ֻ�
--by Dan_Deng(2003-07-21)

--ʹ�ñ���: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 1) then
		Talk(2,"","С�ֵܣ�����˫˫���Ľ�ָ����?","�ҿ����������ߵ���ؤ��һ����ָ�������ǲ���˫˫����?")
		AddNote("˫˫����Ľ�ָ���ܱ���ؤ������. ")
		SetTask(68,2)
		Msg2Player("˫˫����Ľ�ָ���ܱ���ؤ������. ")
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","˫˫�����Һܺ�.")
		else
			Talk(1,"","�о������ߵ���ؤ�е����.")
		end
	end
end;
