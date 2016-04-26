-- 翠烟门 战斗NPC ??? 10级任务（翠羽簪）
-- by：Dan_Deng(2003-07-25)

function OnDeath()
	UTask_cy = GetTask(6);
	if (UTask_cy == 10*256+10) and (HaveItem(0) == 0) and (random(0,100) < 75) then			--任务中，75%机率出现
		AddEventItem(0) 
		Msg2Player("获得翠羽簪 ")
		AddNote("获得翠羽簪 ")
	end
end;
