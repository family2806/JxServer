tbZHONGQIULIHE_GIFT = {
			{ "<#>面粉", 0.45, 520 },
			{ "<#>砂糖", 0.45, 521 },
			{ "<#>莲蓉", 0.0435, 523 },
			{ "<#>豆沙", 0.04349, 524 },
			{ "<#>蛋", 0.01, 522 },
			{ "<#>杏仁", 0.002, 525 },
			{ "<#>花生", 0.001, 526 },
			{ "<#>椰丝", 0.00001, 527 },
}

function main()
	local base = 0;
	local sum = 0;
	local gift_index = 0;
	for i = 1, getn( tbZHONGQIULIHE_GIFT ) do
		base = base + tbZHONGQIULIHE_GIFT[i][2] * 100000;
	end
	local rannum = random(base);
	for i = 1, getn(tbZHONGQIULIHE_GIFT) do
		sum = tbZHONGQIULIHE_GIFT[i][2] * 100000 + sum
		if ( sum >= rannum ) then
			gift_index = i;
			break
		end;
	end;
	if ( gift_index ~= 0 ) then
		AddEventItem(tbZHONGQIULIHE_GIFT[gift_index][3])
		Msg2Player("<#>你获得一个"..tbZHONGQIULIHE_GIFT[gift_index][1])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..",use zhongqiu_lihe , get "..tbZHONGQIULIHE_GIFT[gift_index][1])
	else
		Say("咦？怎么什么都没有呐？", 0)
	end
end