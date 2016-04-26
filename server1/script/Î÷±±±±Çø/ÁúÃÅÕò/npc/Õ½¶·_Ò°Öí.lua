-- 龙门镇 战斗 野猪 新手任务：野猪肉
-- By：Dan_Deng(2003-09-17)

function OnDeath()
	UTask_world27 = GetTask(27)
	if (UTask_world27 == 5) and (random(0,99) < 80) then
		AddEventItem(228)
		if (GetItemCount(228) >= 3) then
			Msg2Player("什么时候拿到3块野猪肉什么时候才可以走")
			AddNote("什么时候拿到3块野猪肉什么时候才可以走")
		else
			Msg2Player("杀了一头野猪拿到一块肉")
		end
	end
end;
