-- 翠烟门 战斗NPC 翠烟门弟子 入门任务（情花）
-- by：Dan_Deng(2003-07-25)

function OnDeath()
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) and (random(0,100) < 66) then		-- 任务中，有66%的机率
		AddEventItem(106)
		Msg2Player("获得情花")
		AddNote("在花魁阵获得情花 ")
	end
end;
