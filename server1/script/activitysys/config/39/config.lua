Include("\\script\\activitysys\\config\\39\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click yuexialaoren",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
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
	szName = "click zhangdenggongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"使用秀月凝露奖励"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"千里姻缘红线",4} },
		{"AddDialogOpt",	{"使用秀月凝露奖励",13} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "yuelao_yinyuan",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"百年修得同船渡，千年修来共枕眠，我使用此红线来捆绑世间的姻缘",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍情人节活动",5} },
		{"AddDialogOpt",	{"领取红线",6} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "gongnv_yinyuan",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"玫瑰种子以及红豆每次只能领取其中一种",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍情人节活动",5} },
		{"AddDialogOpt",	{"领取玫瑰种子",7} },
		{"AddDialogOpt",	{"领取红豆",9} },
--By: NgaVN - 在掌灯宫女NPC选换乾坤寂寞丹
		--{"AddDialogOpt",	{"上交移花和梦",12} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "yinyuan introduction",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"在活动时间内，各位120级以上的大侠每日都可以到月下老人那领取一条红线，也可以到掌灯宫女处领取红豆或者美国种子，领取和种红豆需要满足活动条件，领取和种玫瑰种子需要满足以下其中任何一个条件<enter> 1. 2个异性玩家一起组队，2人红线上的姻缘号和成偶号一起组队<enter> 2. 夫妻双方一起组队<enter>当一起种玫瑰种子的时候，同一队伍中大侠的异性朋友需要培养对方的玫瑰种子，当玫瑰成长，你可以收集自己树上的异香玫瑰，培养红豆无需组队，只需要培养自己的种子就行，培养玫瑰种子/红豆需要及时除虫，拔草等，这样才能获得更多奖励。 <enter> 在活动期间，在奇珍阁有移花和梦，大侠可以拿移花和梦交给掌灯宫女，掌灯宫女将给你乾坤积历丹，大侠可以使用乾坤积历丹到饿狼谷消灭饿狼左使，打败饿狼左使将获得很多奖励。",0},
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
	szName = "get redline from yuelao",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
--By: NgaVN	
		--{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,0,"今天你已领取红线了","=="} },
		{"ThisActivity:CheckRedline",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		--{"ThisActivity:AddTaskDaily",	{TSK_GET_REDLINE,1} },
		{"ThisActivity:GiveRedline",	{nil} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "get rose see from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {format("红豆和玫瑰种子每天只能领取其中一种，如果在当日不领取，将叠加到第二日领取，最多只能叠加3个. <enter> 侠士想领取玫瑰种子，需要答应以下任何条件<enter> 1. 2异性玩家一起组队<enter> 2. 红线","精炼石商店"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想领取玫瑰种子",8} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "surely get rose see from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckTeamConfig",	{nil} },
		{"ThisActivity:CheckSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:SubSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3109,1,0,0},nBindState = -2,nExpiredTime=20120301,},1,"EVENT_LOG_TITLE","get rose seed"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "CreateDialog",
	szName = "get redbean from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {format("红豆和玫瑰种子每天只能领取其中一种，如果在当日不领取，将叠加到第二日领取，最多只能叠加3个. <enter>%s 有秀月凝露，秀月凝露可以增加一次领取一玫瑰种子或者1颗红豆 <enter>大侠，你没有找到自己的姻缘吗，你可以领取红豆带去种，有一点是红豆的奖励没有玫瑰的丰富哦，要不大侠快点去找自己的姻缘吧，和他（她）去种树更有趣些","精炼石商店"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想领红豆",10} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "nil",
	szName = "surely get redbean from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:SubSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3110,1,0,0},nBindState = -2,nExpiredTime=20120301,},1,EVENT_LOG_TITLE,"get redbean"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "use xiuyueninglv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {{tbProp={6,1,3115,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckDateEx",	{nil} },
--By: NgaVN
		{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,2,"今天你已使用2次秀月凝露了，明天请继续使用","<"} },		
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSK_SEEDTIME_EX,1} },
		{"ThisActivity:AddTaskDaily",	{TSK_GET_REDLINE,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","你多获得一次机会领取玫瑰种子或者红豆"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "handin yihuahemeng",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"乾坤霹雳丹",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"移花和梦",{tbProp={6,1,3112,1,0,0},},1} },
	},
	tbActition = 
	{
--By: NgaVN - 在掌灯宫女NPC选换乾坤寂寞丹
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,3116,1,0,0},nExpiredTime=20120301,},1,EVENT_LOG_TITLE,"handin yihuahemeng get pilidan"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "使用秀月凝露奖励",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDLINE_NUM,0,"大侠已领取了，明天继续领","=="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,2,"今天没有使用2个秀月凝露","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSK_REDLINE_NUM,1} },
		{"PlayerFunLib:AddExp",	{60000000,1,EVENT_LOG_TITLE,"使用秀月凝露奖励"} },
	},
}
