-- ؤ���ض� ����2 ��ʦ���񣨶�¥����������Ӧ����3��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		if (HaveItem(208) == 0) and (random(0,99) < 50) then
			Msg2Player("������ӣ����һ������")
			AddEventItem(208)
			AddNote("��õ���������")
		else
			Msg2Player("���������û��ʲô ")
		end
	else
		Talk(1,"","�����������")
	end
end;
