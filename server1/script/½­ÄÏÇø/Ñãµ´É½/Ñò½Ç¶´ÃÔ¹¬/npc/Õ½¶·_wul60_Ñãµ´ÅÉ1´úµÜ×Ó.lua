-- 雁荡山羊角洞迷宫 战斗NPC 1代弟子（五毒出师任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 60*256+10) and (HaveItem(222) == 0)) then		-- 在任务中，尚未得到任务物品
		i = GetTaskTemp(48) + random(0,2)			-- 计数器随机加0到2，加到5即可打大BOSS
		if (i >= 5) then
			SetTask(10,60*256+20)
			SetTaskTemp(48,0)
			AddNote("雁荡派掌门已出现")
			Msg2Player("你杀了无数人之后, 雁荡派掌门最后出现了")
		else
			SetTaskTemp(48,i)
			Msg2Player("你杀了一名雁荡派的弟子")
		end
	end
end;
