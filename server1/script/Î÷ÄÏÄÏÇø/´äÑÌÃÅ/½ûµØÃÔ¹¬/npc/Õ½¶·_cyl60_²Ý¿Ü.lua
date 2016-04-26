-- 翠烟门禁地迷宫 战斗NPC ？？？（翠烟门出师任务）
-- by：Dan_Deng(2003-07-27)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 60*256+10) and (HaveItem(237) == 0) and (random(1,100) < 20) then		-- 20%机率
		AddEventItem(237)
		Msg2Player("获得方形绣花手帕. ")
		AddNote("获得绣花手帕. ")
	end
end;
