Include("\\script\\activitysys\\config\\28\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "玩家点击勤劳老农",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"勤劳老农"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>春天到了，我想在我们村外多种一些花"} },
		{"AddDialogOpt",	{"介绍植树节活动﹜",2} },
		{"AddDialogOpt",	{"领取木桶",3} },
		{"AddDialogOpt",	{"给老农一桶水",4} },
		{"AddDialogOpt",	{"给老农龙音圣水",5} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "介绍植树节活动﹜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>春天到了，我想多种花，从2011年03月28日0时到2011年04月04日24时，小侠可以到我这领取木桶，然后到朱仙镇(206,189), 龙泉镇 (223,189)或者石鼓镇 (217,184)的水潭帮我提水，每天每人最多只能拿5次，小侠要把水提满给我，我将给你丰厚的奖励；如果你可以把龙音圣水带给我，我将送你丰富奖品，当我获得龙音圣水数量达到500次，如果在15分钟内你不能打败他，那木客将离开那里，龙音圣水可以在奇珍阁找到。.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "领木桶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"你的等级不够，不能领木桶",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足"} },
		{"ThisActivity:CheckMuTong",	{nil} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"今天您已很辛苦了，明天再来哦","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGetMuTong",	{nil} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "给老农一桶水",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"您的等级不够，不能参加活动",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2737,1,0,0},},1,"快点去拿够水给我"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足 "} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"今天你已经很辛苦了，要不休息等明天再来吧","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveMuTong",	{nil} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "给老农龙音圣水",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"您的等级不够，不能参加活动",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2738,1,0,0},},1,"我没有龙音圣水"} },
		{"AddOneMaterial",	{"龙音圣水",{tbProp={6,1,2738,1,0,0},},1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveLongYinShengShui",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "服务器打开将加载NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
