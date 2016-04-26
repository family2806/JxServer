-- 黄河源头留仙洞迷宫3F 战斗NPC 山贼03（昆仑出师任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 0) and (random(1,99) < 40)) then
		AddEventItem(13)
		Msg2Player("拿到少昊锁")
		AddNote("拿到少昊锁")
	end
end;
