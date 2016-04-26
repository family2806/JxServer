-- 冰穴迷宫 战斗NPC 冰穴怪人（昆仑50级任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	if (GetTask(9) == 50*256+127) and (HaveItem(10) == 0) then
		AddEventItem(10)
		AddNote("打败冰洞中的怪人，拿到他头上的一撮头发 ")
		Msg2Player("打败冰洞中的怪人，拿到他头上的一撮头发 ")
	end
end;
