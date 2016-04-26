Include("\\script\\activitysys\\config\\19\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click 月老",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"月下老人"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"千里姻缘红线",3} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "点击掌灯宫女",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"掌灯宫女"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"千里姻缘红线",4} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "月老的千里姻缘红线",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"百年修得同船渡，千年修得共枕眠，我使用此红线捆绑世间因缘"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，不能参加活动",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍'千里姻缘活动'",5} },
		{"AddDialogOpt",	{"领'红线'",6} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "掌灯宫女的千里姻缘红线",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"你的玫瑰树种子和相思豆只能领其中一种"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，不能参加活动",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍'千里姻缘红线'",5} },
		{"AddDialogOpt",	{"领玫瑰种子",7} },
		{"AddDialogOpt",	{"领相思豆",8} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "介绍千里姻缘红线活动",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从 0h/13/02/2011 到 24h/23/02/2011, 那里领一条红线，在每条红线上都有一个姻缘号，当你领完红线后，就可以到掌灯宫女那里领取相思豆或者是玫瑰种子，每天侠士有两次机会领取玫瑰种子或者相思豆，每次机会你可以选择领取一颗玫瑰种子或者相思豆，如果在当日领取玫瑰种子或者相思豆的机会未用完，就能累积领取机会到下一日继续领取，每位侠士领取玫瑰种子或者相思豆的机会最多只能累积6次，超过6次就不能继续累积了，精炼石商店琼相玉易物品可以帮你增加一次领取玫瑰种子或者相思豆的机会领取和种相思豆无限制，领取和种玫瑰种子要求满足下面其中一个条件\n1.两个异性玩家组队，两人红线上的姻缘号要成对（整数号）。\n2.夫妻两人组队\侠士可以与异性朋友一起到七大城区或者八大新手村外种玫瑰种子，异性两人一起组队照顾别人种下的玫瑰树芽，在玫瑰树芽长成玫瑰树开满花的过程中，侠士需要及时进行浇水，施肥，除虫，拔草，除虫浇水，拔草施肥越及时快速，则最后在被照顾的玫瑰树上的玫瑰礼盒就越多，当玫瑰树长大成开满玫瑰花的玫瑰树，你可以采摘你种的玫瑰树上的玫瑰礼盒，种相思豆不需要组队，种相思树也需要浇水，除虫，拔草，施肥，所以，这些工作做的越及时，最后收到的奖品就越丰富，相思树成长后，侠士可以采摘相应数量的相思礼盒。"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "在月老处领取红线",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{GetHongXian,0,"今日你已领取红线了","=="} },
		{"ThisActivity:CheckHongXian",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足，不能领道具"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHongXian",	{nil} },
		{"ThisActivity:SetValentineRandNumber",	{ValentineNumber} },
		{"ThisActivity:AddTaskDaily",	{GetHongXian,1} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "在掌灯宫女处领取玫瑰种子",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小侠只能领取相思豆和玫瑰树种子的其中一种，小侠如果想领取玫瑰树种子，需要满足下面其中一个条件<enter>1. 两异性玩家组队，两人红线上的姻缘号要成对（整数号）<enter>2. 夫妻2人组队"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想领取玫瑰种子",9} },
		{"AddDialogOpt",	{"让我好好想想",4} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "在掌灯宫女处领取相思豆",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小侠只能领取相思豆和玫瑰树种子的其中一种，你没有找到自己的姻缘啊，你可以在我这领取一颗相思豆去种，只有一条就是种相思豆的奖励没有种玫瑰树的丰富，小侠要不快点去找自己的姻缘."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想领取相思豆",10} },
		{"AddDialogOpt",	{"让我细想一下",4} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "领取玫瑰种子",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckGetMeiGuiHuaZiCondition",	{nil} },
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"领取次数已用完",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足，不能领取道具"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2697,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"2011年情人节，收到玫瑰种子"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "nil",
	szName = "领取相思豆",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"领取次数已用完",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足，不能领取道具"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2698,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"2011年情人节，收到相思豆"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "使用琼相玉蝶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2703,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckQJYYTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{QJYY_ExGetSeedTime,1} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "nil",
	szName = "nil",
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
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "nil",
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
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "nil",
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
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "nil",
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
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "nil",
	szName = "nil",
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
