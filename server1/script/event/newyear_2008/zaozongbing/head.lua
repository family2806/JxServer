--制作物品lib
--by 小浪多多
--2007-09-06
newyear2008_makezongzi = {}
tbclassname = newyear2008_makezongzi
tbclassname.TITLE = "做粽子"
tbclassname.DA_START = 0802020000	--开始时间
tbclassname.DA_END 	= 0803022400	--结束时间
tbclassname.LIMIT_LEVEL = 50		--等级限制

--月饼制作需要材料
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1662,szname="上等粽子",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="粽叶",num=4},
		{G=6,D=1,P=1654,szname="糯米",num=3},
		{G=6,D=1,P=1655,szname="绿豆",num=2},
		{G=6,D=1,P=1656,szname="猪肉",num=1},
		{G=6,D=1,P=1660,szname="制作上等粽子秘诀",num=1},
		},
	select2 = {
		{G=6,D=1,P=1663,szname="上等粽子",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="粽叶",num=4},
		{G=6,D=1,P=1654,szname="糯米",num=3},
		{G=6,D=1,P=1655,szname="绿豆",num=2},
		{G=6,D=1,P=1656,szname="猪肉",num=1},
		{G=6,D=1,P=1661,szname="制作上等粽子秘诀",num=1}
		},
	select3 = {
		{G=6,D=1,P=1664,szname="上等粽子",num=1,nMoney=20000},
		{G=6,D=1,P=1653,szname="粽叶",num=4},
		{G=6,D=1,P=1654,szname="糯米",num=3},
		{G=6,D=1,P=1655,szname="绿豆",num=2},
		{G=6,D=1,P=1656,szname="猪肉",num=1},
		},
--	select4 = {
--		{G=6,D=1,P=1513,szname="烤猪月饼",num=1,nMoney=200000},
--		{G=6,D=1,P=1503,szname="粉包",num=4},
--		{G=6,D=1,P=1504,szname="糖包",num=4},
--		{G=6,D=1,P=1505,szname="鸡蛋包",num=4},
--		{G=6,D=1,P=1509,szname="猪肉包",num=1},
--		},
--	select5 = {
--		{G=6,D=1,P=1514,szname="月饼礼盒",num=1,nMoney=300000},
--		{G=6,D=1,P=1510,szname="绿豆月饼",num=1},
--		{G=6,D=1,P=1511,szname="莲子月饼",num=1},
--		{G=6,D=1,P=1512,szname="烤鸡月饼",num=1},
--		{G=6,D=1,P=1513,szname="烤猪月饼",num=1},
--		},		
}

tbclassname.tb_content =
{
	sztalk1 = "月饼师傅: 正闲着呢，最近我没有什么事情可做！",
	sztalk2 = "月饼师傅: 时间过得真快，转眼就过节了，到现在我做粽子的手艺依旧有名. 每年都有不少人来找我帮忙，不知客官想做哪种?",
	nselectsum = 3,
	szselect1 = format("我想做一个 %s/#tbclassname:getmakeitemsign(1)",tbclassname.tb_Mareial.select1[1].szname),
	szselect2 = format("我想做一个 %s/#tbclassname:getmakeitemsign(2)",tbclassname.tb_Mareial.select2[1].szname),
	szselect3 = format("我想做一个 %s/#tbclassname:getmakeitemsign(3)",tbclassname.tb_Mareial.select3[1].szname),
	szno = "我只是路过/NoChoice",
	szmakeItemUI = "是的！请前辈赐教!/#tbclassname:makeItemUI(%d)",
	szlevel = "真可惜，等级不够50级无法参加活动.",
	szmoney = "真可惜，银两不够.",
	szpay = "不好意思，你的账户还未充值，不能欣赏盒子做美味的粽子.",
	szremake = "返回/main",
	szitemfree="空间不够，请整理背包."
	
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("恭喜你得到%d <color=yellow>%s<color>.",
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
		sztalkmake = format("缺少%s 无法做。做粽子的原料好像不够呢.",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("月饼师傅:想做%d需要<color=red>%s<color>, 个",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d需要<color=red>%s<color>, ",
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
