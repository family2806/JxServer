-- ؤ���ض� ����3 ��ʦ������¥����������Ӧ����4������5��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		Msg2Player("������.")
		i = 0
		if ((HaveItem(209) == 0) and (random(0,99) < 40)) then
			AddEventItem(209)
			AddNote("����4������")
			i = i + 1
		end
		if ((HaveItem(210) == 0) and (random(0,99) < 40)) then
			AddEventItem(210)
			AddNote("���� 5������")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("���� 2������")
		elseif (i == 1) then
			Msg2Player("���� 1������")
		else
			Msg2Player("��ʧ����Ϊ���ӿտյ�.")
		end
	else
		Talk(1,"","��������")
	end
end;
