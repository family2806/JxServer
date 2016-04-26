-- xingjiaoshang.lua 
-- �н����˽ű�
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")

-- ��[count]��[type2]��Ʒ�һ�[type1]��Ʒ�ĶԻ�
function exchange_talk(type1, type2, count)
	-- DEBUG
	print(format("exchange(%d,%d,%d)", type1, type2, count))

	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- �����Ѿ��һ�����
		Say("<#> ��� " .. item1[1] .. "<#> �Ѿ������ˣ��´�������", 1, "<#> �õ�!/cancel")
	else
		local caption = "<#> �һ� 1 " .. item1[1] .. "<#> ��Ҫ��" .. count .. "<#> " .. item2[1] .. ". ��ȷ��Ҫ����"
		local options = {
			"<#> ����! ��������!/" .. format("#exchange(%d,%d,%d)", type1, type2, count),
			"<#> ���У�����������!/cancel"
		}
		Say(caption, getn(options), options)
	end
end

-- ��[count]��[type2]��Ʒ�һ�[type1]��Ʒ
function exchange(type1, type2, count)
	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- �����Ѿ��һ�����
		Talk(1, "", "<#>�治����˼!�ҵĶ��������ˣ����������ɣ�")
	else
		local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- ���ζһ���ʱ��
		local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- �ϴζһ���ʱ��
		local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- �Ѿ��һ��Ĵ���
		if (exchtime ~= lasttime) then
			-- �һ���������
			exchcount = 0
		end
		if (exchcount >= tbl_exchange_limitcount[type1]) then
			-- �ﵽ�˶һ���������
			-- DEBUG
			print(format("exchcount:%d, limitcount:%d", exchcount, tbl_exchange_limitcount[type1]))
			Talk(1, "", "<#> �治����˼�����Ѿ��򹻶����ˣ�ֻҪ��Ҫʲô����.") 			
		elseif (CalcEquiproomItemCount(item2[2], item2[3], 1, -1) < count) then
			-- �����һ�����Ʒ��������
			Talk(1, "", "<#> ����������±��������ɲ���")
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
			Msg2Player("<#>��õ�1 <color=yellow>" .. item1[1] .. "<color>")
		end
	end
end

-- ʣ��ɶһ�����
function GetLeftCount(type)
	local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- ���ζһ���ʱ��
	local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- �ϴζһ���ʱ��
	local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- �Ѿ��һ��Ĵ���
	if (exchtime ~= lasttime) then
		-- �һ���������
		exchcount = 0
	end
	return tbl_exchange_limitcount[type] - exchcount
end

-- �һ��Ի�
function ExchangeTalk()
	local material_type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	local material_name = tbl_material[material_type][1]
	local caption = "<#> �����θ������˲������䱦�����Ҵ���������<color=red>" ..
		material_name .. 
		"<#> <color>, �������������һ�û���򵽣��������" ..
		material_name .. 
		"<#>���ǿ��Խ���<color=red>" ..
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
		options[index] = "<#> ������ " .. obj_name .. "<#> ������/" .. func
		index = index + 1
	end
	options[index] = "<#> ������������!/cancel"
	
	Say(caption, getn(options), options)		
end

function OnTimer()
	-- �رն�ʱ��
	StopGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE)
	-- ���öһ�����״̬Ϊ��ʼ
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING, 1)
	-- ���ñ��ζһ���ʱ�䣬�����ж���ҵĶһ���������
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME, GetCurrentTime())
	-- ����
	local city = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	local type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	-- DEBUG
	print(format("material type:%d", type))
	local itemname = tbl_material[type][1]
	local news = "<#> �н�����" ..
		tbl_cities[city] ..
		"<#> �и��н����˴��źܶ��Ϻõ���Ʒ" ..
		itemname ..
		"<#>, ������������!"
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
		-- ��û��ʼ�һ��±�����
		Talk(1, "", "<#> ��!��������̫�����ˣ���֪Ϊ���ҵĺ����������Ҳ��û�н���!")
	else
		ExchangeTalk()
	end
end
