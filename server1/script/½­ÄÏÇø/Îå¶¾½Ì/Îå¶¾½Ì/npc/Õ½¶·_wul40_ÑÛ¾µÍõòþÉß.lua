-- �嶾����Ѫ̶�Թ� ս��NPC �۾�������01���嶾40������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(143) == 0) and (random(0,99) < 60) then		-- �������У������ʴ����
		if (HaveItem(142) == 1) then
			if (random(0,99) < 60) then
				AddEventItem(143)
				DelItem(142)
				AddNote("ץ�����۾�������")
				Msg2Player("�������������������Ҳץ����")
			else
				Msg2Player("������������ץ�۾������ߣ����ǲ�С�ı���������")
			end
		else
			Msg2Player("�۾������ߵľ綾���ܽ⣬Ҫ��û��������������޷�ץס��")
		end
	end
end;
