function OnDeath()
	Uworld76 = GetTask(76)
	if (Uworld76 == 40) and (HaveItem(370) == 0) and (random(0,99) < 50) then
		AddEventItem(370)
		Msg2Player("Ìý¼ûÀ×Ïì")
		AddNote("Ìý¼ûÀ×Ïì")
	end
end
