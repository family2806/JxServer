
tab_goods = {
	{"��ˮ��",	0.005, 4,	238},
	{"��ˮ��",	0.005, 4,	239},
	{"��ˮ��",	0.005, 4,	240},
	{"�ɲ�¶",	0.65, 6,	1,	71},
	{"����",	0.01, 6,	1,	15},
	{"�����ؼ�",	0.001, 6,	1,	26},
	{"ϴˮ��",	0.001, 6,	1,	22},
	{"���޺�",	0.01, 6,	1,	23},
	{"��ɽ��¶",	0.15, 6,	1,	72},
	{"ҩ���",	0.1626, 6,	1,	910},
	{"�������ʯ����",	0.0001, 164},
	{"����ջ�ʯָ��",	0.0001, 165},
	{"�������ʯ����",	0.0001, 166},
	{"���Ѫʯ��ָ",	0.0001, 167}

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
		WriteLog(date("%Y-%m-%d-%H:%M")..", ���["..GetName().."]��ѹ��Ǯ�����õ� "..tab_goods[nIdx][1]..".");
		AddGlobalNews("��� ["..GetName().."] ��ѹ��Ǯ�����õ� "..tab_goods[nIdx][1]..".");

	end;
	Msg2Player("��õ� <color=yellow>"..tab_goods[nIdx][1].."<color>");
end;
