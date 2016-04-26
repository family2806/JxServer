function OnDeath()
	if (GetTask(126) == 45) then
		SetTask(126,50)
		Msg2Player("杀死神秘人，解救段思成")
		AddNote("杀死神秘人，解救段思成")
		Talk(1,"Uworld126_kill","会有人去找你给我报仇. ")
	end
end

function Uworld126_kill()
	SetFightState(0)
	NewWorld(162,1531,3157)
end
