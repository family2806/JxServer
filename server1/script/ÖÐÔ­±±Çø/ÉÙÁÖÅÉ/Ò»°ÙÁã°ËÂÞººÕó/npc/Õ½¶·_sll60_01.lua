-- 少林罗汉阵迷宫 战斗NPC ??01（少林出师任务）
-- by：Dan_Deng(2003-08-04)

function OnDeath()
	UTask_sl = GetTask(7)
	if (UTask_sl == 60*256+10) then 		-- and (random(0,99) < 50)) then			-- 在任务中，50%机率
		i = random(0,4)
		if (i == 1) and (HaveItem(217) == 0) then
			AddEventItem(217)
			Msg2Player("你获得念珠")
			AddNote("你获得念珠")
		elseif (i == 2) and (HaveItem(215) == 0) then
			AddEventItem(215)
			Msg2Player("你获得禅杖. ")
			AddNote("你获得禅杖. ")
		elseif (i == 3) and (HaveItem(216) == 0) then
			AddEventItem(216)
			Msg2Player("你获得木鱼 ")
			AddNote("你获得木鱼")
		elseif (i == 4) and (HaveItem(214) == 0) then
			AddEventItem(214)
			Msg2Player("你获得钵盂. ")
			AddNote("你获得钵盂. ")
		else			-- 等于0时，不出道具
			return 0
		end
	end
end;
