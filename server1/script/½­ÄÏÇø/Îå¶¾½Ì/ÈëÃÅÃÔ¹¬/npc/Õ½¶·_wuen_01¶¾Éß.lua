-- 五毒教五毒洞 战斗NPC 毒蛇01（五毒入门任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) and (HaveItem(227) == 0) and (random(0,99) < 80) then		-- 在任务中并且无任务物品
		AddEventItem(227)
		Msg2Player("你得到第一根孔雀羽毛。")
		AddNote("你得到第一根孔雀羽毛。")
	end
end;
