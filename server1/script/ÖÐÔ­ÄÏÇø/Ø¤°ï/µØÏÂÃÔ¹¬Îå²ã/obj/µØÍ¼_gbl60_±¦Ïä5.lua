-- ؤ���ض� ����5 ��ʦ������¥����������Ӧ����8������9��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(202) == 1)) then
		Msg2Player("������ӿ��� ")
		DelItem(202)
		i = 0
		if (HaveItem(200) == 0) and (random(0,99) < 30) then
			AddEventItem(200)
			AddNote("���õ�8������ ")
			i = i + 1
		end
		if (HaveItem(205) == 0) and (random(0,99) < 30) then
			AddEventItem(205)
			AddNote("�õ���9������ ")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("������������")
		elseif (i == 1) then
			Msg2Player("����һ������ ")
		else
			Msg2Player("���ʧ������Ϊ���ӿտ�.")
		end
	else
		Talk(1,"","��������")
	end
end;
