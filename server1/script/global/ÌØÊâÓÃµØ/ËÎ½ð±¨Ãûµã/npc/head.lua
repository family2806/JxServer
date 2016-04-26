
function talk_yulongtie()
	Say("这个是玉龙庄给各位英雄豪杰的请帖，不是谁都能得到它?",
		2,
		"我使用岳王魂之石来换取/get_yulongtie",
		"让我想想/Cancel")
end

-- 用岳王魂之石换取钰龙英雄帖
function get_yulongtie()
	if (CalcEquiproomItemCount(4, 507, 1, -1) < 1) then
		Say("你没有岳王魂之石，继续去练习，然后来这里?")
	else
		Say("你确定使用岳王魂之石兑换玉龙英雄帖进入剑冢迷宫吗?",
			2,
			"想/exchange_yulongtie",
			"让我想想/Cancel")	
	end
end

function exchange_yulongtie()
	if (CalcFreeItemCellCount() == 0) then
		Say("装备空位不足.")
	elseif (CalcEquiproomItemCount(4, 507, 1, -1) >= 1 and 
		ConsumeEquiproomItem(1, 4, 507, 1, -1) == 1) then
		AddItem(6, 1, 2622, 1, 0, 0)
		Msg2Player("你获得一个玉龙英雄帖.")
	end
end
