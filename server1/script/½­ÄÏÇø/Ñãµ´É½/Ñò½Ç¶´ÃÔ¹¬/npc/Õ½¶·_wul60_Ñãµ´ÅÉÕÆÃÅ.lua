-- 雁荡山羊角洞迷宫 战斗NPC 大BOSS01（五毒出师任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 60*256+20) and (HaveItem(222) == 0) and (random(0,99) < 50) then
		AddEventItem(222)
		AddNote("你打败了雁荡派头领，把避毒珠拿回五毒教")
		Msg2Player("你打败了雁荡派头领，把避毒珠拿回五毒教")
	end
end;
