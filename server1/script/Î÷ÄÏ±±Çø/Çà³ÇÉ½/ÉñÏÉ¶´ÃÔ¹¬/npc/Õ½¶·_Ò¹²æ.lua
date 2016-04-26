function OnDeath()
	Uworld125 = GetTask(125)
	if (Uworld125 == 10) or (Uworld125 == 15) then
		SetTask(125,15)
		AddEventItem(388)
		Msg2Player("获峨嵋无字天书 ")
		AddNote("获峨嵋无字天书")
--	elseif (Uworld125 == 20) and (HaveItem(387) == 0) then
--		AddEventItem(387)
--		Msg2Player("重获峨嵋无字天书。")
--		AddNote("重获峨嵋无字天书。")
	end
end
