-- ؤ���ض� ����4 ��ʦ������¥��һ������Ӧ����6������7��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(204) == 1)) then
		Msg2Player("���Դ����ӿ��� ")
		DelItem(204)
		if (HaveItem(206) == 0) then
			AddEventItem(206)
			AddNote("���õ�6������")
			Msg2Player("����һ������")
		elseif (HaveItem(207) == 0) then
			AddEventItem(207)
			AddNote("���õ�7������ ")
			Msg2Player("����һ������ ")
		else
			Msg2Player("���ʧ������Ϊ���ӿտյ�.")
		end
	else
		Talk(1,"","��������")
	end
end;
