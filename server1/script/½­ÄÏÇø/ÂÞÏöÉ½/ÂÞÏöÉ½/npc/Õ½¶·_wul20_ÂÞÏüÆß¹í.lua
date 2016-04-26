-- 罗宵山迷宫 战斗NPC 色鬼01（五毒20级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	i = GetItemCount("人头")
	if (UTask_wu == 20*256+10) and (i < 7) and (random(0,99) < 80) then		-- 在任务中，按机率打出。
		AddEventItem(85)
		if (i >= 6) then
			Msg2Player("你杀了罗宵七鬼，拿了7个头")
			AddNote("你杀了罗宵七鬼，拿了7个头，交给白莹莹")
		else
			Msg2Player("得到一个人头")
		end
	end
end;
