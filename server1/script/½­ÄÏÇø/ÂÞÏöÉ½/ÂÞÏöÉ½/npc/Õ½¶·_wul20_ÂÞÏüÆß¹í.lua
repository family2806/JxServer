-- ����ɽ�Թ� ս��NPC ɫ��01���嶾20������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	i = GetItemCount("��ͷ")
	if (UTask_wu == 20*256+10) and (i < 7) and (random(0,99) < 80) then		-- �������У������ʴ����
		AddEventItem(85)
		if (i >= 6) then
			Msg2Player("��ɱ�������߹�����7��ͷ")
			AddNote("��ɱ�������߹�����7��ͷ��������ӨӨ")
		else
			Msg2Player("�õ�һ����ͷ")
		end
	end
end;
