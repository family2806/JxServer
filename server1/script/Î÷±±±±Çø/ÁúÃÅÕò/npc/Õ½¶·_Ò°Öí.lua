-- ������ ս�� Ұ�� ��������Ұ����
-- By��Dan_Deng(2003-09-17)

function OnDeath()
	UTask_world27 = GetTask(27)
	if (UTask_world27 == 5) and (random(0,99) < 80) then
		AddEventItem(228)
		if (GetItemCount(228) >= 3) then
			Msg2Player("ʲôʱ���õ�3��Ұ����ʲôʱ��ſ�����")
			AddNote("ʲôʱ���õ�3��Ұ����ʲôʱ��ſ�����")
		else
			Msg2Player("ɱ��һͷҰ���õ�һ����")
		end
	end
end;
