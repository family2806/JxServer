-- 少林木人巷 战斗NPC ？？ （少林10级任务、拳倾天下任务）
-- by：Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 10*256+10) and (HaveItem(26) == 0) and (random(0,99) < 80) then
		AddEventItem(26) 
		Msg2Player("拿到金莲花. ")
		AddNote("找到金莲花. ")
	elseif (GetTask(75) == 10) and (GetTask(54) == 10) and (HaveItem(26) == 0) and (random(0,99) < 40) then		-- 拳倾天下任务，按机率得到
		AddEventItem(26)
		Msg2Player("拿到金莲花，可以回去见蔡大叔. ")
	end
end;
