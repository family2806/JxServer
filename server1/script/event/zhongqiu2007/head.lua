--2007中秋节活动
--by 小浪多多
--2007-09-06

DA_ZHONGQIU2007_START = 0709220000	--开始时间
DA_ZHONGQIU2007_END 	= 0710142400	--结束时间
NZHONGQIU2007_LIHE_MAX = 400000000	--礼盒经验上限
NZHONGQIU2007_MAX = 400000000				--月饼经验上限
TSK_ZHONGQIU2007_LIHE = 1844				--礼盒经验上限变量
TSK_ZHONGQIU2007 = 1843							--月饼经验上限变量
ZHONGQIU_LEVEL = 50		--等级限制
SZYUEBING = ""				--存取类别名
TSK_TEMP = 51					--类别临时变量

tb_content =
{
	sztalk1 = "做饼师：真舒服，我正休息几天.",
	sztalk2 = "做饼师：又到中秋了，我做饼的手艺谁都知道，每年有不少人士来找我帮忙做饼，客官需要什么呢?",
	szgetlvdou = "我想做一个绿豆饼/#makeyuebing(1)",
	szgetlianzi = "我想做一个莲藕饼/#makeyuebing(2)",
	szgetkaoji = "我想做一个烤鸡中秋月饼/#makeyuebing(3)",
	szkaozhu = "我想做一个烧猪中秋月饼/#makeyuebing(4)",
	szlihe = "我想做一个中秋月饼盒/#makeyuebing(5)",
	szno = "顺便路过而已/NoChoice",
	szmakeItemUI = "对了，我想做中秋月饼/makeItemUI",
	szlevel = "真是遗憾，等级不足50级，不能参加该活动.",
	szmoney = "真是遗憾，银两不够.",
	szpay = "真是遗憾，玩家未充值，不能用中秋饼.",
	szremake = "返回/main",
	
}

--礼盒获得材料和几率
tb_Mareial_LIHE = 	
{
	100000,
	{
		{G=6,D=1,P=1207,nrate=0.0125	,szname="云游图碎片"},
		{G=6,D=1,P=1208,nrate=0.0125	,szname="云游图碎片"},
		{G=6,D=1,P=1209,nrate=0.0125	,szname="云游图碎片"},
		{G=6,D=1,P=1210,nrate=0.0125	,szname="云游图碎片"},
		{G=6,D=1,P=1211,nrate=0.0125	,szname="云游图碎片"},
		{G=6,D=1,P=1212,nrate=0.0125	,szname="云游图碎片"},
		{G=6,D=1,P=1213,nrate=0.0125	,szname="仙羽图碎片"},
		{G=6,D=1,P=1214,nrate=0.0125	,szname="仙羽图碎片"},
		{G=6,D=1,P=1215,nrate=0.0125	,szname="仙羽图碎片"},
		{G=6,D=1,P=1216,nrate=0.0125	,szname="仙羽图碎片"},
		{G=6,D=1,P=1217,nrate=0.0125	,szname="仙羽图碎片"},
		{G=6,D=1,P=1218,nrate=0.0125	,szname="仙羽图碎片"}
	}
}

--月饼制作需要材料
tb_Mareial =
{
	szlvdou = {
		{G=6,D=1,P=1510,szname="绿豆饼",num=1,nMoney=50000},
		{G=6,D=1,P=1503,szname="粉袋",num=2},
		{G=6,D=1,P=1504,szname="糖包",num=2},
		{G=6,D=1,P=1505,szname="蛋袋",num=2},
		{G=6,D=1,P=1506,szname="绿豆包",num=1},
		},
	szlianzi = {
		{G=6,D=1,P=1511,szname="莲藕饼",num=1,nMoney=100000},
		{G=6,D=1,P=1503,szname="面粉",num=2},
		{G=6,D=1,P=1504,szname="糖",num=2},
		{G=6,D=1,P=1505,szname="蛋",num=2},
		{G=6,D=1,P=1507,szname="莲藕",num=1},
		},
	szkaoji = {
		{G=6,D=1,P=1512,szname="烤鸡中秋饼",num=1,nMoney=150000},
		{G=6,D=1,P=1503,szname="面粉",num=3},
		{G=6,D=1,P=1504,szname="糖",num=3},
		{G=6,D=1,P=1505,szname="鸡蛋",num=3},
		{G=6,D=1,P=1508,szname="鸡肉",num=1},
		},
	szkaozhu = {
		{G=6,D=1,P=1513,szname="烤猪月饼",num=1,nMoney=200000},
		{G=6,D=1,P=1503,szname="面粉",num=4},
		{G=6,D=1,P=1504,szname="糖",num=4},
		{G=6,D=1,P=1505,szname="蛋",num=4},
		{G=6,D=1,P=1509,szname="猪肉",num=1},
		},
	szlihe = {
		{G=6,D=1,P=1514,szname="中秋饼盒",num=1,nMoney=300000},
		{G=6,D=1,P=1510,szname="绿豆饼",num=1},
		{G=6,D=1,P=1511,szname="莲藕饼",num=1},
		{G=6,D=1,P=1512,szname="烤鸡月饼",num=1},
		{G=6,D=1,P=1513,szname="烤猪月饼",num=1},
		},		
}

function funmsg()
		SZYUEBING = getTaskItemName()
		szmsg = format("恭喜您获得%d <color=yellow>%s<color>.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"])
		return szmsg
end

function funtalkmake()
		SZYUEBING = getTaskItemName()
		sztalkmake = format("做饼师：想做%d 个<color=red>%s<color> 需要 %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> 和%d 两，你同意吗?",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmake
end

function funtalkmlimit()
		SZYUEBING = getTaskItemName()
		sztalkmlimit= format("：做饼师：原料不够，做%d <color=red>%s<color> 需要 %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> 和%d 两.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmlimit
end

function fungiveitemui()
		SZYUEBING = getTaskItemName()
		szgiveitemui= format("做饼师：想做%d %s 需要 %d %s, %d %s, %d %s, %d %s 和%d 两.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return szgiveitemui
end

function check_zhongqiu2007_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > DA_ZHONGQIU2007_START ) and ( ndate < DA_ZHONGQIU2007_END ) ) then
		return 1
	end
	return 0
end

function check_item(szItemKey)	--判断物品是否存在
	SZYUEBING = getTaskItemName()
	for nkey, tb_item in tb_Mareial[SZYUEBING] do
			local szkey = tb_item["G"]..","..tb_item["D"]..","..tb_item["P"]
			if nkey ~= 1 then
					if szkey == szItemKey then
						return 1
					end
			end
	end
	return 0
end
function check_level()		--判断等级
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--判断钱
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--判断充值用户
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--获得tb类别名
	if GetTaskTemp(TSK_TEMP) == 1 then
		return "szlvdou"
	end
	if GetTaskTemp(TSK_TEMP) == 2 then
		return "szlianzi"
	end
	if GetTaskTemp(TSK_TEMP) == 3 then
		return "szkaoji"
	end
	if GetTaskTemp(TSK_TEMP) == 4 then
		return "szkaozhu"
	end
	if GetTaskTemp(TSK_TEMP) == 5 then
		return "szlihe"
	end
	return "szlvdou"
end

