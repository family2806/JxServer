Include("\\script\\activitysys\\config\\4\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "KillMonster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonster",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "SongJin1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"宋金1000"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "SongJin3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"宋金3000"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"穿过隘口17"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"穿过隘口28"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_Boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"消灭水贼头领"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_BigBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,20,EVENT_LOG_TITLE,"消灭水贼头领"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,15,EVENT_LOG_TITLE,"炎帝闯关6"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "GoldenBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"消灭世界Boss"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "KillerBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,3,EVENT_LOG_TITLE,"消灭杀手Boss"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_QiuYun",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"秋云"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍活动",23} },
		{"AddDialogOpt",	{"合成红花凤",12} },
		{"AddDialogOpt",	{"合成白花凤",13} },
		{"AddDialogOpt",	{"合成紫花凤",14} },
		{"SetDialogTitle",	{"<npc>3/5/2012 到 24:00/31/52012,  各位大侠可以到我的地方使用种子，增长药袋，水瓶，有色物品来合成各种花凤来换取奖品."} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "nil",
	szName = "ComposeRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Red"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "ComposeWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"White"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "ComposePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Purple"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "UseRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3161,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CheckTask",	{TSK_RED_FLOWER_COUNT,N_MAX_RED_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedFlower",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "UseWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3163,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CanUseWhiteFlower",	{nil} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWhiteFlower",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "UsePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3162,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备最少剩一个空位"} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UsePurpleFlower",	{nil} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"秋云",1907,{{11,3182,4951}}} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_LingFan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"商店"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买增长药袋",20} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Buy_NongYao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"增长药袋",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备最少剩一个空位"} },
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=10000},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3158,1,0,0},nExpiredTime=20120601,},1,EVENT_LOG_TITLE,"BuyNongyao"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "UseSeedBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3164,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"装备空位不足，请排好最少剩两个空位"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3157,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseSeedBox"} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "UseWaterBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3165,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"装备空位不足，请排好最少剩两个空位"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3159,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseWaterBox"} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>种子可以在莫高窟、长白山南、长白山北、沙漠1、沙漠2、沙漠3、裸狼洞找到，增长药袋可以在商店里找到，水瓶可以通过参加宋金、闯关、风陵度、炎帝、黄金Boss、杀手Boss。有色物品在奇珍阁，大侠找满这四件物品，可以到我的地方合成各种有色花凤来换取丰富的奖品。",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
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
tbConfig[25] = --一个细节
{
	nId = 25,
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
tbConfig[26] = --一个细节
{
	nId = 26,
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
tbConfig[27] = --一个细节
{
	nId = 27,
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
tbConfig[28] = --一个细节
{
	nId = 28,
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
tbConfig[29] = --一个细节
{
	nId = 29,
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
tbConfig[30] = --一个细节
{
	nId = 30,
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
tbConfig[31] = --一个细节
{
	nId = 31,
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
tbConfig[32] = --一个细节
{
	nId = 32,
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
