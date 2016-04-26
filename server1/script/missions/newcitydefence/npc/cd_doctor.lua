function main()
	Say("守城军需官：我这有很多种名贵药品，战场使用的物品。你可以使用 <color=yellow>宋金奖励<color> 到我这买<color=yellow>宋金物品<color>, 但是<color=red>士兵号角和鸽子<color>只能在宋金战场使用，想买什么？", 3, "买药品/salemedicine", "买宋金物品/sj_shop_sell", "取消/OnCancel")
end

function salemedicine()
	Sale(131, 1)
end

function sj_shop_sell()
	Sale(98, 4);			
end;

function OnCancel()
end
