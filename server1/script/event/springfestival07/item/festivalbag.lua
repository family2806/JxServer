Include([[\script\event\springfestival07\head.lua]]);

tab_goods = {
{"小爆竹",	1351	,	80	,},
{"中爆竹",	1352	,	96	,},
{"大爆竹",	1353	,	100	,},
};
function main()
	if (sf07_isactive() == 0) then
		Say("此物品已过期", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>只有50级以上的充值玩家<color>才可以使用压岁包?", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() == 0) then
		Say("请先整理背包!", 0);
		return 1;
	end;
	local nSeed = random(1, 100);
	for i = 1, getn(tab_goods) do
		if (tab_goods[i][3] >= nSeed) then
			AddItem(6, 1, tab_goods[i][2], 1,0,0,0);
			Msg2Player("你已经打开1个压岁包，得到1 <color=yellow>"..tab_goods[i][1].."<color>.");
			break;
		end;
	end;
end;