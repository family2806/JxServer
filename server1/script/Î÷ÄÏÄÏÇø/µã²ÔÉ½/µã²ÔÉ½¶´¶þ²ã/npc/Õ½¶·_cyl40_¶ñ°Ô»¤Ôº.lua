-- 点苍山恶霸洞 战斗NPC ？？？02（翠烟门40级任务）
-- by：Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(196) == 0) and (random(0,100) < 40) then				-- 40%的机率成功
		AddEventItem(196)
		Msg2Player("拿到铁钥匙 ")
		AddNote("找出铁钥匙 ")
	end
end;
