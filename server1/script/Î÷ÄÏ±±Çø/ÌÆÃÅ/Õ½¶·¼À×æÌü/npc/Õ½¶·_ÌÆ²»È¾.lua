-- 战斗_唐不染.lua
-- by: Dan_Deng(2004-04-12)

function OnDeath()
	Uworld123 = GetTask(123)
	if (Uworld123 == 40) then
		SetTask(123,50)
		SetFightState(0)
		Talk(1,"","怎么我会输呢?!")
		Msg2Player("你已打败唐不染，还不去安慰他一下")
		NewWorld(36, 1592, 3193)		-- 送回祭祖厅
	end
end
