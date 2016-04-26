-- 蜀冈山 战斗NPC 金兵 丐帮30级任务
-- by：Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 30*256+20) then			--30级任务中
		SetTask(8,30*256+30)
		AddNote("打败埋伏的金兵，各位失踪的丐帮弟子都被金兵伏兵给抓了. ")
		Msg2Player("打败埋伏的金兵，各位失踪的丐帮弟子都被金兵伏兵给抓了. ")
	end
end;
