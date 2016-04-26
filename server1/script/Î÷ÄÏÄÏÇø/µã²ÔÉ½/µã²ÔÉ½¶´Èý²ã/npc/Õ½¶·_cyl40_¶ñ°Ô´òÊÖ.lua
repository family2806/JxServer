-- 点苍山恶霸洞 战斗NPC ？？？03（翠烟门40级任务）
-- by：Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(198) == 0) and (random(0,100) < 30) then				-- 30%的机率成功
		AddEventItem(198)
		Msg2Player("拿到银钥匙 ")
		AddNote("找出银钥匙")
	end
end;
