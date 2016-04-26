
function store_sel_extend()
	local tbOpp = { 
			"交易/yes",
			"活动商店/HuoDongyes",
			"不交易/no"		};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070202 and nDate <= 20070225) then
		tinsert(tbOpp, 1, "买节日贺卡/BuySpringFestival07Card");
	end;
	
	if (nDate >= 20070314 and nDate <= 20070321) then
		tinsert(tbOpp, 1, "买金石/buy_collect_juanzhou")
	end;
	return tbOpp;
end;

function store_sel_village_extend()
	local tbOpp = {
			"交易/yes",
			"活动商店/HuoDongyes",			
		"我是来做教育任务的/zboss",
		"不交易/no",
			};
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070314 and nDate <= 20070321) then
		tinsert(tbOpp, 1, "买金石/buy_collect_juanzhou")
	end;
	return tbOpp;
end;

function HuoDongyes()
	Sale(179);
end;

function BuySpringFestival07Card()
	Sale(148);
end;

function buy_collect_juanzhou()
	Sale(165);
end;