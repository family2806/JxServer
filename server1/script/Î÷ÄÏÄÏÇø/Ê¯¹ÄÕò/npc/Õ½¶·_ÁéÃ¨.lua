-- 石鼓镇 战斗 灵猫 新手任务：阿琼的戒指
-- By：Dan_Deng(2003-09-04)

function OnDeath()
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 5) and (HaveItem(234) == 0) and (random(0,99) < 66) then
		AddEventItem(234)
		Msg2Player("打败灵猫，拿到戒指")
		AddNote("打败灵猫，拿到戒指")
	end
end;
