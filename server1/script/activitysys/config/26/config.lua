Include("\\script\\activitysys\\config\\26\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click NPC宴桌",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"宴桌"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想吃菜",2} },
		{"AddDialogOpt",	{"我想斗酒",3} },
		{"SetDialogTitle",	{"祝贺新年!"} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "我想吃菜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"只有150级及150级以上的侠士或者已经重生的侠士才能参加该活动.",">="} },
		{"ThisActivity:CheckTask",	{TSK_TotalEatExp,nTotalEatUpExp,"少侠吃菜获得的经验已达上限了，不能再多吃了","<"} },
		{"ThisActivity:CheckTaskA",	{TSK_EatExp, TSK_EatExpDate, nEatUpExp,"对不起，少侠今天吃的太饱了，明天再来哦",nNumber} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveEatAward",	{TSK_EatExp, TSK_EatExpDate, TSK_TotalEatExp, nNumber} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "我想斗酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"斗酒，斗的是智慧和幸运"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"只有150级及150级以上的侠士或者已经重生的侠士才能参加该活动.",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍斗酒规则",4} },
		{"AddDialogOpt",	{"我想开始斗酒",5} },
		{"AddDialogOpt",	{"我想检查斗酒结果",12} },
		{"AddDialogOpt",	{"我想领取斗酒奖励",23} },
		{"AddDialogOpt",	{"让我再考虑考虑",0} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "介绍斗酒规则",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" 少侠，您每天可以参加3场斗酒，每场斗酒总共有12轮，少侠如果想胜1场成功斗酒，就需要喝完12轮斗酒赛，在每轮斗酒，少侠可以选择喝小杯酒，中杯酒，大杯酒，喝不同的酒将给你加不同醉意和酒量，少侠需要确保醉意小于100的同时，增加自己的酒量，如果你不慎重，醉意达到100或者100以上，那你就喝醉了，此次斗酒赛就输了。如果你喝完了12轮酒，醉意依然小于100，那此次斗酒你就成功了，我将拿本日所有的成功斗酒获得的酒量加起来进行排行，排名前十的将获得丰富奖励。在斗酒过程中，小酒杯加3-6度醉意，3两酒量，中杯酒加2-12度醉意，7两酒量，大杯酒加3-18度醉意，11两酒量。."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "我想开始斗酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:BeginDrink",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "喝一小杯酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"small",5} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "喝一中杯酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"middle",5} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "喝一大杯酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"big",5} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "认输",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Lose",	{TSK_DrinkTimes,TSK_DrinkRound,TSK_ZuiYi,TSK_AnWei,TSK_JiuLiang} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ServerStart",
	szName = "当打开服务器就加载桌子",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"宴桌", 1658, tbDeskPos} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ServerStart",
	szName = "当打开服务器就加载沈员外",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"沈园外", 1659, tbYuanWaiPos} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "检查斗酒结果",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"检查斗酒结果",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"检查我今天获得的酒量.",13} },
		{"AddDialogOpt",	{"检查昨日酒量十大排行",15} },
		{"AddDialogOpt",	{"检查我昨日的酒量排行.",16} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "检查我今天获得的酒量.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurJiuLiang",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "检查目前酒量十大排名",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurTopTen",	{nil} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "检查昨日酒量十大排行",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYTopTen",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "nil",
	szName = "检查我昨日的酒量排行.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYPlayerPaiMing",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "点击沈员外",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"沈员外"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>各位武林豪杰，老沈我已经摆好宴席了，新年也快到了，我在这已摆上山珍海味招待各位，请各位随便用，不用客气，吃饱喝好哦!"} },
		{"AddDialogOpt",	{"介绍大宴群侠活动",18} },
		{"AddDialogOpt",	{"领红包",19} },
		{"AddDialogOpt",	{"换取解酒丸",20} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "介绍大宴群侠活动",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>从0h/23/01/2011到24h/20/02/2011, 少侠您可以在我这，这已经摆好山珍海味了，要吃好喝足哦，从02月09日到02月11日，为了给我远在他乡的儿子求福，少侠您可以到我这领取一个大红包！沈园外我这不是小气的人，我已经投入了300.000.000经验，少侠不要忘了来领取红包哦.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "nil",
	szName = "领取红包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_LiBao,1,"少侠您已经在我这领取红包了，每人只能在我这领取一次哦!","<"} },
		{"lib:CheckDay",	{nGetLiBaoStartDate, nGetLiBaoEndDate, "在2月10日，我的儿子要上路寻找新的买卖，为了给他求福，在2月9日到11日，少侠可以到我这领取一个大红包！沈园外我这不是小气的人，我已经投入了300.000.000经验，少侠不要忘了来领取红包哦."} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足空位，最少需要一个1*1装备空位"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2694,1,0,0},nBindState = -2,nExpiredTime=20110221,},1,"2011年大宴群侠,沈园外红包"} },
		{"ThisActivity:AddTask",	{TSK_LiBao,1} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "换取解酒丸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"解酒丸",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"银两",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2695,1,0,0},nExpiredTime=20110221,},1,"2011大宴群侠，获得解酒丸"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用解酒丸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2695,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckGetDrunk",	{1020,"不醉就不需要用解酒丸"} },
	},
	tbActition = 
	{
		{"ThisActivity:JieJiu",	{1020} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "使用沈员外的红包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2694,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_UseLiBao,0,"","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{nLiBaoExp,1,"2011大宴群侠，使用沈员外红包获得经验"} },
		{"ThisActivity:SetTask",	{TSK_UseLiBao,1} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "领取斗酒奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"领取斗酒奖励",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"领取斗酒排行奖励",24} },
		{"AddDialogOpt",	{"领取斗酒奖励成功",29} },
		{"AddDialogOpt",	{"领取安慰奖",30} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "nil",
	szName = "领取斗酒排行奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetPaiMingAward",	{nil} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "nil",
	szName = "领取排行第1斗酒奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "nil",
	szName = "领取排行第2斗酒奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "nil",
	szName = "领取排行第3斗酒奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "nil",
	szName = "领取排行第4-10斗酒奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "nil",
	szName = "领取斗酒奖励成功",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_WinDrink,1,"少侠没有成功斗酒奖励可以领取","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nWinDrinkExp, "少侠参加斗酒获得的经验已达上限，不能继续领取与斗酒相关的奖励了", "<", nNumber,"2011年大宴群侠，领取斗酒奖励成功."} },
		{"ThisActivity:SetTask",	{TSK_WinDrink,0} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "nil",
	szName = "领取安慰奖",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_AnWei,1,"少侠没有安慰奖要领","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nAnWeiExp, "少侠参加斗酒获得的经验已达上限，不能继续领取与斗酒相关的奖励了", "<", nNumber,"2011年大宴群侠，领取安慰奖"} },
		{"ThisActivity:SetTask",	{TSK_AnWei,0} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "ServerStart",
	szName = "当打开服务器时就加载灯笼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddMulNpc",	{tbNpcs,"灯笼",1592} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "ServerStart",
	szName = "当打开服务器时就加载大头布娃娃",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"地公头", 1660, "\\settings\\maps\\dayanqunxia\\datouwawa.txt",176} },
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "ServerStart",
	szName = "打开服务器就加载武南师",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"南师", 1661, "\\settings\\maps\\dayanqunxia\\wunanshi.txt",176} },
	},
}
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "ServerStart",
	szName = "打开服务器加载武北师",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"北师", 1662, "\\settings\\maps\\dayanqunxia\\wubeishi.txt",176} },
	},
}
