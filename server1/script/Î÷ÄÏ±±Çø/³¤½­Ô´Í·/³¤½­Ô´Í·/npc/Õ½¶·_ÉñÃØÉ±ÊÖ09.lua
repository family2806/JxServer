function OnDeath ()
	Uworld128 = GetTask(128)
	Uworld134 = GetTask(134)
	if (Uworld128 == 30) then
		Uworld134 = SetBit(Uworld134,9,1)
		if (Uworld134 == 1023) then
			SetTask(128,40)
			Msg2Player("����������ɱ�֣�����ȥ��Ƚ���а ")
			AddNote("����������ɱ�֣�����ȥ��Ƚ���а")
		elseif (Uworld134 ~= GetTask(134)) then
			SetTask(134,Uworld134)
			Msg2Player("��ɱ��һ������ɱ��")
		else
			-- �ظ�ɱ��ͬһֻNPC��������ʾ
		end
	end
end