-- 雁荡山迷宫 战斗NPC 蜘蛛01（五毒10级任务、拳倾天下任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 10*256+10) then		-- 在任务中，按机率打出（取消机率）。
		AddEventItem(86)			-- 物品蜘蛛
		if (GetItemCount(86) >= 10) then
			Msg2Player("你捉到了10只毒蜘蛛")
			AddNote("你捉到了10只毒蜘蛛")
		else
			Msg2Player("捉到了10只毒蜘蛛")
		end
	elseif (GetTask(75) == 10) and (GetTask(52) == 10) and (random(0,99) < 75) then		-- 拳倾天下任务，按机率得到
		AddEventItem(86)
		if (GetItemCount(86) >= 7) then
			Msg2Player("捉到了7只毒蜘蛛,可以回去了，奉命")
		else
			Msg2Player("抓到一只毒蜘蛛 ")
		end
	end
end;
