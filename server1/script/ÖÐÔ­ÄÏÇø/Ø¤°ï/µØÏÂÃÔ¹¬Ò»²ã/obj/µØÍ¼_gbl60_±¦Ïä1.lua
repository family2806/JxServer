-- ؤ���ض� ����1 ��ʦ����һ¥��һ������Ӧ����1������2��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 1) then
		Msg2Player("�����ӿ��� ")
		DelItem(203)
		i = 0
		if ((HaveItem(211) == 0) and (random(0,99) < 60)) then
			AddEventItem(211)
			AddNote("��õ�һ������ ")
			i = i + 1
		end
		if ((HaveItem(201) == 0) and (random(0,99) < 60)) then
			AddEventItem(201)
			AddNote("��õڶ�������")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("����2������ ")			
		elseif (i == 1) then
			Msg2Player("����һ������ ")			
		else
			Msg2Player("���ʧ������Ϊ���ӿտ�.")
		end
	else
		Talk(1,"","��������")
	end
end;
