function OnDeath()
	Uworld125 = GetTask(125)
	if (Uworld125 == 10) or (Uworld125 == 15) then
		SetTask(125,15)
		AddEventItem(388)
		Msg2Player("������������� ")
		AddNote("�������������")
--	elseif (Uworld125 == 20) and (HaveItem(387) == 0) then
--		AddEventItem(387)
--		Msg2Player("�ػ�����������顣")
--		AddNote("�ػ�����������顣")
	end
end
