--description: �ɶ�Ұ��Ұ�� ��������
--author: yuanlan	
--date: 2003/4/1

function OnDeath()
	Uworld11 = GetTask(11)
	if (Uworld11 < 255) and (Uworld11 >= 1) and (random(0,99) < 10) then		-- �����У�10%����
		if (Uworld11 < 10) then					-- ����ʮֻ���ټ���
			Uworld11 = Uworld11 + 1
			SetTask(11,Uworld11)
			Msg2Player("����ɱ��һֻ���Ҵ����Ұ���ˣ�Ŀǰһ��ɱ��"..(Uworld11 - 1).."ֻ ")
		else
			SetTask(11,100)
			Msg2Player("���Ѿ�ɱ��10ֻҰ�����Ի�ȥ������")
		end
	end
end;
