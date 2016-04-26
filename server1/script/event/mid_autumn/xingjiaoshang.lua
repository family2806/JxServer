-- xingjiaoshang.lua 
-- 行脚商人脚本
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")

-- 用[count]个[type2]物品兑换[type1]物品的对话
function exchange_talk(type1, type2, count)
	-- DEBUG
	print(format("exchange(%d,%d,%d)", type1, type2, count))

	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- 材料已经兑换完了
		Say("<#> 这次 " .. item1[1] .. "<#> 已经换完了！下次再来吧", 1, "<#> 好的!/cancel")
	else
		local caption = "<#> 兑换 1 " .. item1[1] .. "<#> 需要有" .. count .. "<#> " .. item2[1] .. ". 你确定要换吗？"
		local options = {
			"<#> 可以! 就这样吧!/" .. format("#exchange(%d,%d,%d)", type1, type2, count),
			"<#> 不行！等我先想想!/cancel"
		}
		Say(caption, getn(options), options)
	end
end

-- 用[count]个[type2]物品兑换[type1]物品
function exchange(type1, type2, count)
	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- 材料已经兑换完了
		Talk(1, "", "<#>真不好意思!我的东西买完了！待会再来吧！")
	else
		local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- 本次兑换的时间
		local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- 上次兑换的时间
		local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- 已经兑换的次数
		if (exchtime ~= lasttime) then
			-- 兑换次数清零
			exchcount = 0
		end
		if (exchcount >= tbl_exchange_limitcount[type1]) then
			-- 达到了兑换次数限制
			-- DEBUG
			print(format("exchcount:%d, limitcount:%d", exchcount, tbl_exchange_limitcount[type1]))
			Talk(1, "", "<#> 真不好意思！我已经买够东西了，只要需要什么再来.") 			
		elseif (CalcEquiproomItemCount(item2[2], item2[3], 1, -1) < count) then
			-- 用来兑换的物品数量不够
			Talk(1, "", "<#> 你带的制作月饼材料依旧不够")
		else
			SetTask(VARV_MOONCAKE_EXCHANGETIME, exchtime)
			SetTask(VARV_MOONCAKE_EXCHANGECOUNT, exchcount + 1)
			WriteLog(format("%s %s(%s): exchange mooncake material %s(%d)==>%s(1)",
				date("%y-%m-%d %H:%M"),
				GetAccount(),
				GetName(),
				item2[1],
				count,
				item1[1]))
			ConsumeEquiproomItem(count, item2[2], item2[3], 1, -1)
			AddEventItem(item1[3])
			SetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT, itemcount - 1)
			Msg2Player("<#>你得到1 <color=yellow>" .. item1[1] .. "<color>")
		end
	end
end

-- 剩余可兑换次数
function GetLeftCount(type)
	local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- 本次兑换的时间
	local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- 上次兑换的时间
	local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- 已经兑换的次数
	if (exchtime ~= lasttime) then
		-- 兑换次数清零
		exchcount = 0
	end
	return tbl_exchange_limitcount[type] - exchcount
end

-- 兑换对话
function ExchangeTalk()
	local material_type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	local material_name = tbl_material[material_type][1]
	local caption = "<#> 我周游各地买了不少奇珍宝物，这次我带到这来了<color=red>" ..
		material_name .. 
		"<#> <color>, 但是有样东西我还没有买到，如果你有" ..
		material_name .. 
		"<#>我们可以交换<color=red>" ..
		GetLeftCount(material_type) ..
		"<color>."
	local exchanges = GetExchangeList(material_type)
	local options = {}
	local index = 1
	while (index <= getn(exchanges)) do
		local obj_type = exchanges[index][1]
		local obj_count = exchanges[index][2]
		local obj_name = tbl_material[obj_type][1]
		local func = format("#exchange_talk(%d,%d,%d)", material_type, obj_type, obj_count)
		options[index] = "<#> 我想用 " .. obj_name .. "<#> 来交换/" .. func
		index = index + 1
	end
	options[index] = "<#> 不！等我想想!/cancel"
	
	Say(caption, getn(options), options)		
end

function OnTimer()
	-- 关闭定时器
	StopGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE)
	-- 设置兑换材料状态为开始
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING, 1)
	-- 设置本次兑换的时间，用来判断玩家的兑换次数限制
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME, GetCurrentTime())
	-- 公告
	local city = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	local type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	-- DEBUG
	print(format("material type:%d", type))
	local itemname = tbl_material[type][1]
	local news = "<#> 行脚商人" ..
		tbl_cities[city] ..
		"<#> 有个行脚商人带着很多上好的物品" ..
		itemname ..
		"<#>, 卖完他就走了!"
	-- DEBUG
	print(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	Msg2SubWorld(news)

	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	WriteLog(format("%s: mooncake material quota: %s(%d)",
		date("%y-%m-%d %H:%M"),
		itemname,
		itemcount))
	-- DEBUG
	print("news: " .. news)
end

function main()
	local exchanging = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING)
	-- DEBUG
	print(format("exchanging: %d", exchanging))
	local msg = format("GetGlbValue(%d): %d", GBL_VAR_MOONCAKE_EXCHANGING, exchanging)
	print(msg)
	local mapid = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	if (mapid ~= SubWorldIdx2ID(SubWorld) or exchanging ~= 1) then
		-- 还没开始兑换月饼材料
		Talk(1, "", "<#> 诶!今年生意太难做了！不知为何我的合作伙伴现在也还没有交货!")
	else
		ExchangeTalk()
	end
end
