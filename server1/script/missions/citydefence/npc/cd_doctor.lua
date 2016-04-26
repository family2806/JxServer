function main()
	Say("守城军需官: 我这里有很多在战场上使用的贵重药品和物品。你可以使用 <color=yellow>宋金奖励<color>到我这里买<color=yellow>宋金物品<color>, 但是<color=red>士兵号角和信鸽<color>只能在宋金战场上使用，想要买什么？", 3, "买药品/salemedicine", "买宋金物品/sj_shop_sell", "取消/OnCancel")
end

function salemedicine()
	Sale(131, 1)
end

function sj_shop_sell()
	Sale(98, 4);			
end;

function OnCancel()
end
