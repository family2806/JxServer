--明月老人对话
--月饼换对应礼品
--mingyuelaoren.lua
--2005-09-07


tbCAKE2GIFT = {
		[891] = { "<#> 豆沙月饼 ", "<#> 1仙草露",			{ 6, 1, 71, 1, 0, 0, 0 } },
		[893] = { "<#> 蛋黄豆沙月饼", "<#> 1福缘露(大) ",		{ 6, 1, 124, 1, 0, 0, 0 } },
		[895] = { "<#> 果仁月饼", "<#> 神秘红包",			{ 6, 1, 402, 1, 0, 0, 0 } },
		[896] = { "<#> 什锦月饼 ", "shijin_ex_goldequip()" }
}

tbSHIJIN2GOLDEQUIP = {
		{ "<#> 黄金图谱- 定国青纱长衫", { 0, 159 }, 0.12 },
		{ "<#> 黄金图谱- 定国钨砂发冠", { 0, 160 }, 0.12 },
		{ "<#> 黄金图谱- 定国赤绢软靴", { 0, 161 }, 0.12 },
		{ "<#> 黄金图谱- 定国紫藤护腕", { 0, 162 }, 0.12 },
		{ "<#> 黄金图谱- 定国银蚕腰带", { 0, 163 }, 0.12 },
		{ "<#> 黄金图谱- 安邦冰晶石项链", { 0, 164 }, 0.1 },
		{ "<#> 黄金图谱- 安邦菊花石指环", { 0, 165 }, 0.1 },
		{ "<#> 黄金图谱- 安邦田黄石玉佩", { 0, 166 }, 0.1 },
		{ "<#> 黄金图谱- 安邦鸡血石戒指", { 0, 167 }, 0.1 },
}

function main()
	local tbOpp = {
				"<#> 这是豆沙月饼, 请品尝/#cake_ex_gift(891)",
				"<#> 这是蛋黄豆沙月饼, 请品尝/#cake_ex_gift(893)",
				"<#> 这是果仁月饼, 请品尝/#cake_ex_gift(895)",
				"<#> 这是什锦月饼, 请品尝/#cake_ex_gift(896)",
				"<#> 没什么！我只是探望老人而已!/OnCancel",
	}
	Say("<#> 这里师傅们做月饼的手艺都是上乘的. 每年我都等着中秋呢. 年轻人有话要说吗?", getn(tbOpp), tbOpp )
end

function OnCancel()
end

function cake_ex_gift(dtype)
	local count = CalcEquiproomItemCount( 6, 1, dtype, -1 )
	if ( count <= 0 ) then
		Say("<#> 年轻人！你的月饼呢？想戏弄老人吗?", 1, "<#> 对不起！我错了!/OnCancel" )
		return
	end
	Say("<#> 啊! 以前从未吃过这么好吃的月饼！这是一点诚意！有好吃的月饼要记得拿回来给我们啊！", 1, "领取奖励!/#take_ex_gift("..dtype..")")

end

function take_ex_gift(dtype)
	local dpass = ConsumeEquiproomItem(1, 6, 1, dtype, -1)
	if ( dpass ~= 1 ) then
		print("delete item cake error dtype = "..dtype)
		return
	end
	Msg2Player("<#> 你失去 1 "..tbCAKE2GIFT[dtype][1])
	
	if ( dtype == 896 ) then
		shijin_ex_goldequip()
	else
		AddItem(tbCAKE2GIFT[dtype][3][1], tbCAKE2GIFT[dtype][3][2], tbCAKE2GIFT[dtype][3][3], tbCAKE2GIFT[dtype][3][4], tbCAKE2GIFT[dtype][3][5], tbCAKE2GIFT[dtype][3][6], tbCAKE2GIFT[dtype][3][7] )
		Msg2Player("<#> 你得到 "..tbCAKE2GIFT[dtype][2])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[dtype][1].." in exchange for "..tbCAKE2GIFT[dtype][2])
	end
end

function shijin_ex_goldequip()
	local base = 0
	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		base = base + tbSHIJIN2GOLDEQUIP[ i ][ 3 ]
	end
	base = 100 * base
	
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		sum = sum + tbSHIJIN2GOLDEQUIP[i][3] * 100
		if( sum >= num ) then
			AddGoldItem( tbSHIJIN2GOLDEQUIP[i][2][1], tbSHIJIN2GOLDEQUIP[i][2][2] )
			Msg2Player("<#> 你得到 1 b?"..tbSHIJIN2GOLDEQUIP[i][1])
			WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[896][1].." in exchange for "..tbSHIJIN2GOLDEQUIP[i][1])
			break
		end
	end
end