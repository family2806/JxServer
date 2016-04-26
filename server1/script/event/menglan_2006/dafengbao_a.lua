
tab_goods = {
	{"蓝水晶",	0.005, 4,	238},
	{"紫水晶",	0.005, 4,	239},
	{"绿水晶",	0.005, 4,	240},
	{"仙草露",	0.65, 6,	1,	71},
	{"披风",	0.01, 6,	1,	15},
	{"武林秘籍",	0.001, 6,	1,	26},
	{"洗水晶",	0.001, 6,	1,	22},
	{"铁罗汉",	0.01, 6,	1,	23},
	{"天山宝露",	0.15, 6,	1,	72},
	{"药丸包",	0.1626, 6,	1,	910},
	{"安邦冰晶石项链",	0.0001, 164},
	{"安邦菊花石指环",	0.0001, 165},
	{"安邦田黄石玉佩",	0.0001, 166},
	{"安邦鸡血石戒指",	0.0001, 167}

}

function main(nItem)
	local nSeed = random(1, 10000);
	
	local nIdx = 1;
	local nTotal = 0;
	for i = 1, getn(tab_goods) do
		nTotal = nTotal + tab_goods[i][2] * 10000;
		if (nSeed <= nTotal) then
			nIdx = i;
			break
		end;
	end;
	if (nIdx < 4) then
		AddEventItem(tab_goods[nIdx][4]);
	elseif (nIdx < 11) then
		AddItem(6, 1, tab_goods[nIdx][5], 1, 0, 0, 0);
	else
		AddGoldItem(0, tab_goods[nIdx][3]);
	end;
	if (nIdx < 4 or (nIdx >= 6 and nIdx <= 8) or nIdx >= 11) then
		WriteLog(date("%Y-%m-%d-%H:%M")..", 玩家["..GetName().."]打开压岁钱包，得到 "..tab_goods[nIdx][1]..".");
		AddGlobalNews("玩家 ["..GetName().."] 打开压岁钱包，得到 "..tab_goods[nIdx][1]..".");

	end;
	Msg2Player("你得到 <color=yellow>"..tab_goods[nIdx][1].."<color>");
end;
