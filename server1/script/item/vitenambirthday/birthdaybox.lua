tbSHENGRILIHE_GIFT = {
			{ "<#> 鲜奶", 0.03, 975 },
			{ "<#> 精粉", 0.47, 976 },
			{ "<#> 糖精", 0.47, 977 },
			{ "<#> 鸡蛋", 0.03, 978 },
}

function main()
	local base = 0;
	local sum = 0;
	local gift_index = 0;
	for i = 1, getn( tbSHENGRILIHE_GIFT ) do
		base = base + tbSHENGRILIHE_GIFT[i][2] * 100000;
	end
	local rannum = random(base);
	for i = 1, getn(tbSHENGRILIHE_GIFT) do
		sum = tbSHENGRILIHE_GIFT[i][2] * 100000 + sum
		if ( sum >= rannum ) then
			gift_index = i;
			break
		end;
	end;
	if ( gift_index ~= 0 ) then
		AddEventItem(tbSHENGRILIHE_GIFT[gift_index][3])
		Msg2Player("<#> 您获得一个"..tbSHENGRILIHE_GIFT[gift_index][1])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..",use zhongqiu_lihe , get "..tbSHENGRILIHE_GIFT[gift_index][1])
	else
		Say("为什么什么也没有呢?", 0)
	end
end