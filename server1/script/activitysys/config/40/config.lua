Include("\\script\\activitysys\\config\\40\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"321,322,227,340"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonsterAward",	{nil} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,30,EVENT_LOG_TITLE,"宋金3000"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 1000 and < 3000",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"宋金1000"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"闯关17"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"闯关28"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_boatboss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"消灭水贼头领"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_bigboatboss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,20,EVENT_LOG_TITLE,"消灭水贼大头领"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,15,EVENT_LOG_TITLE,"炎帝闯关10"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "kill_gold_boss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,30,EVENT_LOG_TITLE,"消灭世界BOSS"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "kill_killer_boss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,3,EVENT_LOG_TITLE,"消灭杀手BOSS"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc named master hechenghua",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"合成花的人"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成三色玫瑰",13} },
		{"AddDialogOpt",	{"合成四色玫瑰",14} },
		{"AddDialogOpt",	{"合成永久玫瑰蓝",15} },
		{"AddDialogOpt",	{"换绿草",20} },
		{"AddDialogOpt",	{"在线领奖",21} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "compose 3 color rose total",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"您好",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"方法1",16} },
		{"AddDialogOpt",	{"方法2",17} },
		{"AddDialogOpt",	{"方法3",18} },
		{"AddDialogOpt",	{"方法4",19} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "compose 4 color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"四色玫瑰",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"白玫瑰",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"黄玫瑰",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"蓝玫瑰",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"红玫瑰",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"绿草",ITEM_GRASS,1} },
		{"AddOneMaterial",	{"花篮",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4COLOR_ROSE,1,EVENT_LOG_TITLE,"GhepBoHongTuSac"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "compose corbeil",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"永久玫瑰蓝",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"白玫瑰",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"黄玫瑰",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"蓝玫瑰",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"红玫瑰",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"绿草",ITEM_GRASS,2} },
		{"AddOneMaterial",	{"花篮",ITEM_BASKET,1} },
		{"AddOneMaterial",	{"花束",ITEM_RIBAND,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CORBEIL,1,EVENT_LOG_TITLE,"合成永久玫瑰蓝"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 1",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"三色玫瑰",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"白玫瑰",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"黄玫瑰",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"蓝玫瑰",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"花篮",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 2",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"三色玫瑰",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"白玫瑰",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"黄玫瑰",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"红玫瑰",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"花篮",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 3",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"三色玫瑰",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"白玫瑰",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"红玫瑰",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"蓝玫瑰",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"花篮",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 4",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"三色玫瑰",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"黄玫瑰",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"红玫瑰",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"蓝玫瑰",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"花篮",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "nil",
	szName = "compose grass total",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeGrass",	{nil} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckLevel",	{120,"default",">"} },
		{"PlayerFunLib:CheckIsTransLife",	{"重生一次以上才能领奖"} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LUCK_BELT,MAX_DAILY_LUCK_BELT,"今天你不能再领了，明天再来吧.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "use item named 3color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_3COLOR_ROSE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:CheckTask",	{TSK_3COLOR_ROSE,MAX_3COLOR_ROSE,"已达到上限，不能继续使用了","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:Use3ColorRose",	{nil} },
		{"ThisActivity:AddTask",	{TSK_3COLOR_ROSE,1} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "use item named 4color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_4COLOR_ROSE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:CheckTask",	{TSK_4COLOR_ROSE,MAX_4COLOR_ROSE,"已达上限，不能继续使用了","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:Use4ColorRose",	{nil} },
		{"ThisActivity:AddTask",	{TSK_4COLOR_ROSE,1} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "use item named corbeil",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_CORBEIL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{TSK_CORBEIL,MAX_CORBEIL,"已达上限，不能继续使用了","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseCorbeil",	{nil} },
		{"ThisActivity:AddTask",	{TSK_CORBEIL,1} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "use item named luck belt",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_LUCY_BELT},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseLucyBelt",	{nil} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "use item named meiguixiangdai",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_MEIGUIXIANGDAI},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseMeiGuiXiangDai",	{nil} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"商贩"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买花篮",29} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "buy basket",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"花篮",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"银两",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BASKET,1,EVENT_LOG_TITLE,"buy_basket"} },
	},
}
