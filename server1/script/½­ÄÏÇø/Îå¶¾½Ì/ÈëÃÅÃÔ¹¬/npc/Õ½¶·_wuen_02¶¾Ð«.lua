-- 五毒教五毒洞 战斗NPC 毒蝎01（五毒入门任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) and (HaveItem(223) == 0) and (random(0,99) < 80) then		-- 在任务中并且无任务物品
		AddEventItem(223)
		Msg2Player("你得到第二根孔雀羽毛。")
		AddNote("你得到第二根孔雀羽毛。")
	end
end;
