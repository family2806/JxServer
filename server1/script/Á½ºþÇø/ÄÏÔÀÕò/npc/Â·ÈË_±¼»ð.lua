-- ������ ·�� ����
-- 2004/4/17 ���Ա������� by fangjieying

function main()
	Uworld76 = GetTask(76)
	if (Uworld76 == 10) then
		Talk(1,"","һƥ����վ�����£������Ŷ�����ͬ��Ľ���")
		SetTask(76,20)
		Msg2Player("������ƥ���ˣ�Ӧ���Ǻ�������й�")
	elseif (Uworld76 == 50) and (HaveItem(375) == 1) then		-- �κ���
		DelItem(375)
		SetTask(76,60)
		DelMagic(396)
		if (HaveMagic(397) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(397)
		end
		Msg2Player("��������·�����ķ�")
		Talk(1,"","���Ѫ�ںϸ������£�ͬʱ�˴�����¶�����ķ���������۾����������������������������¶�����ķ�")
	elseif (Uworld76 >10) and (Uworld76 < 50) then
		Talk(1,"","�����һ���������һ��")
	elseif (Uworld76 > 50) then
		Talk(1,"","��ҽ���˱���Ĳ�")
	else
		Talk(1,"","��ƥ��ë����Ѫ�����ֽ�'����'")
	end
end
