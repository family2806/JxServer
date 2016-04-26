-- 少林后山密室 战斗NPC ??01（少林40级任务）
-- by：Dan_Deng(2003-08-04)

function OnDeath()
	UTask_sl = GetTask(7)
	UTask_sl40tmp = GetTaskTemp(44)
	if (UTask_sl == 40*256+10) and (random(1,99) < 33) then
		SetTask(7,40*256+20)
		AddNote("拿到口诀：按摩尼八迷红. ")
		Msg2Player("拿到口诀：按摩尼八迷红. ")
	end
end;
