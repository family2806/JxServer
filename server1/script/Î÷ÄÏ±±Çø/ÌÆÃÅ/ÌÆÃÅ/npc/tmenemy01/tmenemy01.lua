--description: �����񺣵�һ�ص���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 >= 20) and (Uworld37 < 127) and (HaveItem(33) == 0) and (random(0,99) < 50) then		--�����У�û����ɫ���ȣ�50%����
		AddEventItem(33)
		Msg2Player("�õ���ɫ����")
		AddNote("�ڵ�һ�ش����󣬵õ���ɫ����")
	end
end;
