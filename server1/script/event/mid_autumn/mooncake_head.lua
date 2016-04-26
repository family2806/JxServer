-- mooncake_head.lua
-- 月饼活动头文件
-- 2005-09-07 by steve

IncludeLib("TIMER")

-- 全局变量
GBL_VAR_MOONCAKE_EXCHANGING		 = 801	-- 是否正在兑换材料
GBL_VAR_MOONCAKE_MARTERIAL_TYPE	 = 802	-- 兑换材料的类别
GBL_VAR_MOONCAKE_MARTERIAL_COUNT = 803	-- 兑换材料的数目
GBL_VAR_MOONCAKE_CITY 			 = 804	-- 兑换材料的城市
GBL_VAR_MOONCAKE_EXCHANGETIME	 = 805	-- 本次兑换的开始时间

TIMER_MOONCAKE_EXCHANGE			= 47	-- 兑换材料定时器
TIMER_MOONCAKE					= 48	-- 制作月饼定时器
TIMER_MOONCAKE_HINT				= 49	-- 提醒领取月饼的定时器
MISSION_MOONCAKE_EXCHANGE		= 8		-- 兑换材料任务

VARV_MOONCAKE_EXCHANGETIME		= 1566	-- 玩家上次兑换材料的时间
VARV_MOONCAKE_EXCHANGECOUNT		= 1567	-- 玩家兑换材料的次数
VARV_MOONCAKE 					= 1569	-- 月饼使用的任务变量，用来保存月饼的类别和状态 == 月饼类别 * 1000 + 月饼状态


STAT_MIN				= 1		-- 最小状态
STAT_PARCHED			= 1		-- 烘烤过时的考焦的月饼
STAT_HUOMIAN_PARCHED	= 2		--和面、包馅 过时的烤焦的月饼
STAT_HUOMIAN_MAKING 	= 3		-- 正在和面
STAT_HUOMIAN_FINISH 	= 4		-- 和面完成
STAT_BAOXIAN_MAKING 	= 5		-- 正在包馅
STAT_BAOXIAN_FINISH 	= 6		-- 包馅完成
STAT_HONGKAO_MAKING 	= 7		-- 正在烘烤
STAT_HONGKAO_FINISH 	= 8		-- 烘烤完成
STAT_MAX				= 8		-- 最大状态

TYPE_MIN				= 1		-- 最小类别
TYPE_SHIJIN				= 1		-- 什锦月饼
TYPE_GUOREN				= 2		-- 果仁月饼
TYPE_DANHUANGLIANRONG	= 3		-- 蛋黄莲蓉月饼
TYPE_DANHUANGDOUSHA		= 4		-- 蛋黄豆沙月饼
TYPE_LIANRONG			= 5		-- 莲蓉月饼
TYPE_DOUSHA				= 6 	-- 豆沙月饼
TYPE_MAX				= 6		-- 最大类别

-- 七大城市
tbl_cities = {
    [1] = "凤翔",
    [11] = "成都",
    [37] = "汴京",
    [78] = "襄阳",
    [80] = "扬州",
    [162] = "大理",
    [176] = "临安", 
};

-- 材料名字
tbl_material = {
    {"蛋 ",		4,	522},
    {"杏仁 ",	4,	525},
    {"花生 ",	4,	526},
    {"椰丝",	4,	527},
    {"面粉",	4,	520},
    {"砂糖",	4,	521},
    {"莲蓉",	4,	523},
    {"豆沙",	4,	524},
};

-- 兑换次数限制
tbl_exchange_limitcount = {
	10,		-- 蛋
	4,		-- 杏仁
	2,		-- 花生
	1,		-- 椰丝
};

-- 兑换表
tbl_exchange = {
   	--蛋	杏仁	花生	椰丝
	{0,		1,		2,		24},	-- 蛋兑换其他物品
	{0,		0,		2,		16},	-- 杏仁兑换其他物品
	{0,		0,		0, 		8},		-- 花生兑换其他物品
	{0,		0,		0,		0},		-- 椰丝兑换其他物品
	{50,	75,		150,	1500},	-- 面粉兑换其他物品
	{50,	75,		150,	1500},	-- 砂糖兑换其他物品
	{6,		8,		16,		160},	-- 莲蓉兑换其他物品
	{6,		8,		16,		160},	-- 豆沙兑换其他物品
};

-- 通知
tbl_notice = {
	[STAT_HUOMIAN_FINISH] = "<#> 你的月饼已经<color=yellow>和面完成<color>, 赶快拿!",		-- 和面完成
	[STAT_BAOXIAN_FINISH] = "<#> 你的月饼已经 <color=yellow>包馅完成<color>,赶快拿!",		-- 包馅完成
	[STAT_HONGKAO_FINISH] = "<#> 你的月饼已经 <color=yellow>包馅完成<color>, 赶快拿!",	-- 烘烤完成
};

-- 获取可兑换某种材料的材料数量列表
function GetExchangeList(typeid)
	-- DEBUG
	print(format("GetExchangeList(%d)", typeid))
	local index = 1
	local result = {}
	for i = 1, getn(tbl_exchange) do
		local count = tbl_exchange[i][typeid]
		if (count ~= 0) then
			result[index] = {i, count}	-- {类型, 数量}
			index = index + 1
		end
	end
	if (getn(result) == 0) then
		return nil
	else
		return result
	end
end

function cancel()
	-- do nothing
end

-- 启动提醒领取月饼的定时器
function start_hint()
	TM_SetTimer(18 * 10, TIMER_MOONCAKE_HINT, 30, 0)
end

-- 关闭提醒领取月饼的定时器
function close_hint()
	TM_StopTimer(TIMER_MOONCAKE_HINT)
end
