function OnDeath()
	Uworld130 = GetTask(130)
	if (Uworld130 == 30) then
		SetTask(130,33)
		Msg2Player("��������")
	elseif (Uworld130 == 36) then
		SetTask(130,40)
		AddNote("����㣬�۶��ˣ���̾Ϣ���˴�")
		Talk(3,"Uworld130_good","������������2��λ�����Ҫ������ô�޴���������.","������:��","�úã��������ģ�������Ҳ������!")
	end
end

function Uworld130_good()
	Msg2Player("����㣬�۶��ˣ���̾Ϣ���˴�")
	SetFightState(0)
	NewWorld(131,1530,3228)			-- �Զ��͵�̾Ϣ���˴�
end
