Include([[\script\event\springfestival07\head.lua]]);

tab_goods = {
{"С����",	1351	,	80	,},
{"�б���",	1352	,	96	,},
{"����",	1353	,	100	,},
};
function main()
	if (sf07_isactive() == 0) then
		Say("����Ʒ�ѹ���", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ֻ��50�����ϵĳ�ֵ���<color>�ſ���ʹ��ѹ���?", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() == 0) then
		Say("����������!", 0);
		return 1;
	end;
	local nSeed = random(1, 100);
	for i = 1, getn(tab_goods) do
		if (tab_goods[i][3] >= nSeed) then
			AddItem(6, 1, tab_goods[i][2], 1,0,0,0);
			Msg2Player("���Ѿ���1��ѹ������õ�1 <color=yellow>"..tab_goods[i][1].."<color>.");
			break;
		end;
	end;
end;