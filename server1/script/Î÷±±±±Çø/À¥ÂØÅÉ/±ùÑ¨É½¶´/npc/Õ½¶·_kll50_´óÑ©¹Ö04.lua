-- ��Ѩ�Թ� ս��NPC ??04������50������
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	x = 4
	if (UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (GetBit(UTask_kl,x) == 0) then		--50����������δɱ����ֻѩ��
		i = SetBit(UTask_kl,x,1)
		if (i == 50*256+64+31) then		-- ���ϳ�Կ������
			SetTask(9,50*256+127)
			AddNote("��ɱ������ѩ�ֵ�·�ϣ�����ҵ����˵ľ���")
			Msg2Player("��ɱ������ѩ�ֵ�·�ϣ�����ҵ����˵ľ���")
		else
			SetTask(9,i)		-- ����ͱ������
			Msg2Player("�����ɽ�������·��ɱ��һ��ѩ��")
		end
	end
end;
