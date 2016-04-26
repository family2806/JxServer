-- 塔林迷宫 战斗NPC ？？ 30级任务
-- by：Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 30*256+10) and (random(0,99) < 50) then
		SetTask(7,30*256+20)
		Msg2Player("原来行踪诡秘的人是金人, 他们的同党已经偷了般若波罗蜜多心经，跑到北剑阁西边的金光洞了. ")
		AddNote("在塔林行踪诡秘的人是金人, 他们的同党已经偷了般若波罗蜜多心经，跑到北剑阁西边的金光洞了. ")
	end
end;
