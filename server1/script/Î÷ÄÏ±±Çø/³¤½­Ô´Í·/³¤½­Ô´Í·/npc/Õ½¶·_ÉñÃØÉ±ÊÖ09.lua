function OnDeath ()
	Uworld128 = GetTask(128)
	Uworld134 = GetTask(134)
	if (Uworld128 == 30) then
		Uworld134 = SetBit(Uworld134,9,1)
		if (Uworld134 == 1023) then
			SetTask(128,40)
			Msg2Player("你逃离神秘杀手，可以去解救界无邪 ")
			AddNote("你逃离神秘杀手，可以去解救界无邪")
		elseif (Uworld134 ~= GetTask(134)) then
			SetTask(134,Uworld134)
			Msg2Player("你杀死一个神秘杀手")
		else
			-- 重复杀死同一只NPC，不给提示
		end
	end
end