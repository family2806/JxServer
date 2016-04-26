-- 见性峰山洞迷宫 战斗NPC 山贼小头目 昆仑40级任务
-- by：Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+10) then			--带着任务
		SetTask(9,40*256+20)
		Msg2Player("打败山贼小头目，血魂神剑被山贼小头目藏起来了")
		AddNote("打败山贼小头目，血魂神剑被山贼小头目藏起来了 ")
	end
end;
