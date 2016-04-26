-- 大理城恶霸秘道 战斗NPC ？？？（翠烟门40级任务）
-- by：Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+10) and (random(0,100) < 40) then				-- 40%的机率成功
		SetTask(6,40*256+20)
		AddNote("解救被困在密道里的少女，知道恶霸已经把其他女孩带去苍山了. ")
		Msg2Player("打败恶霸的助手，解救被困在密道里的少女，知道恶霸已经把其他女孩带去苍山了. ")
	end
end;
