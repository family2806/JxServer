--制作物品lib
--by 小浪多多
--2007-09-06

tbclassname = {}
tbclassname.DA_START = 0803080000	--开始时间
tbclassname.DA_END 	= 0803162400	--结束时间
tbclassname.LIMIT_LEVEL = 50		--等级限制

tbclassname.tb_content =
{
	sztalk1 = "礼官: 国际妇女节活动结束了.",
	sztalk2 = "<dec>礼官: 08/03国际妇女日到了，祝天下所有妇女健康快乐充满幸福，此次活动包括：\n    <color=yellow>1.扎花<color>\n        <color=red>(活动时间: 从08-03-2008 到 24:00，16-03-2008)<color>\n    <color=yellow>2.送花<color>\n        <color=red>(活动时间: 从08-03-2008 到 24:00，31-03-2008)<color>\n    <color=yellow>3. 北斗老人任务.<color>\n        <color=red>(活动时间: 从08-03-2008 到 24:00，16-03-2008)<color> \我很高兴可以在这帮各位扎花.",
	nselectsum = 2,
	szselect1 = "我想扎一束玫瑰花./#tbclassname:getmakeitemsign(1)",
	szselect2 = "我想扎一束菊花./#tbclassname:getmakeitemsign(2)",
	--szselect3 = "我想做一个普通粽子/#tbclassname:getmakeitemsign(3)",
	--szselect4 = "我想做一个烤猪月饼/#tbclassname:getmakeitemsign(4)",
	--szselect5 = "我想做一个月饼礼盒/#tbclassname:getmakeitemsign(5)",
	szno = "趁着靠过去/NoChoice",
	szmakeItemUI = " 对！请师父展示!/#tbclassname:makeItemUI(%d)",
	szlevel = "真遗憾，等级不够50级，不能参加此活动.",
	szmoney = "真遗憾，你带的银两不够.",
	szpay = "不好意思，你还未充值，无法扎花.",
	szremake = "返回/main",
	szitemfree="背包空间不足，请先整理背包.",
}

--制作需要材料
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1681,szname="玫瑰花束",num=1,nMoney=100000},
		{G=6,D=1,P=1679,szname="玫瑰花枝",num=10},
		},
	select2 = {
		{G=6,D=1,P=1682,szname="菊花束",num=1,nMoney=50000},
		{G=6,D=1,P=1680,szname="菊花枝",num=10},
		},
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("祝贺你已获得 %d <color=yellow>%s<color>.",
							 tbtemp[1].num,
							 tbtemp[1].szname)
		return szmsg
end

function tbclassname:funtalkmake(nsign)
	local sztalkmake = tbclassname:funtalkmareial(nsign)
	sztalkmake = format("%s, 你想做吗?",sztalkmake)
	return sztalkmake
end

function tbclassname:funtalkmlimit(nsign)
		local sztalkmake = tbclassname:funtalkmareial(nsign)
		sztalkmake = format("%s 缺少不能做. 好像做粽子的材料不够.",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("礼官: 想扎 %d<color=red>%s<color>, 需要",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d <color=red>%s<color>,",
						  	sztalkmake,
						  	tbtemp[ni].num,
						  	tbtemp[ni].szname)
			end
		end
		if tbtemp[1].nMoney > 0 then
					sztalkmake = format("%s<color=red>%d<color>,",
							sztalkmake,
							tbtemp[1].nMoney)
		end
		return sztalkmake
end

function tbclassname:check_event_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > tbclassname.DA_START ) and ( ndate < tbclassname.DA_END ) ) then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--判断等级
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--判断钱
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--获得tb类别名
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --判断身上剩余格数
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end