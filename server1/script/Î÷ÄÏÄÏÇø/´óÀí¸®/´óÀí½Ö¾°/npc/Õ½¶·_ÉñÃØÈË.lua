function OnDeath()
	if (GetTask(126) == 45) then
		SetTask(126,50)
		Msg2Player("ɱ�������ˣ���ȶ�˼��")
		AddNote("ɱ�������ˣ���ȶ�˼��")
		Talk(1,"Uworld126_kill","������ȥ������ұ���. ")
	end
end

function Uworld126_kill()
	SetFightState(0)
	NewWorld(162,1531,3157)
end
