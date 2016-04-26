function OnDeath()
	Uworld76 = GetTask(76)
	if (Uworld76 == 40) and (HaveItem(372) == 0) and (random(0,99) < 50) then
		AddEventItem(372)
		Msg2Player("拿到白云的扇子. ")
		AddNote("拿到白云的扇子. ")
	end
end
