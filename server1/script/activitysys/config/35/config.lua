Include("\\script\\activitysys\\config\\35\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 3000",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,40,EVENT_LOG_TITLE,"宋金达3000点领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "宋金达3000点领取种子", "40颗种子", 1}},
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"闯关17领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "闯关17领取种子", "10 颗种子", 1}},
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"闯关28领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "闯关28领取种子", "10颗种子", 1}},
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "fengling_leader",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"消灭水贼头领领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "消灭水贼头领领取种子", "10颗种子", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "fengling_bigleader",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"消灭水贼大头领领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "消灭水贼大头领领取种子", "20 颗种子", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"炎帝过10关领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "炎帝过10关领取种子", "20颗种子", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "worldboss",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,50,EVENT_LOG_TITLE,"消灭黄金BOSS领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "消灭黄金BOSS领取种子", "50颗种子", 1}},
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "FinishKillerBoss",
	szName = "killer",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,3,EVENT_LOG_TITLE,"消灭杀手BOSS领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "消灭杀手BOSS领取种子", "3 颗种子", 1}},
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "killer monster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{szName="银盘",tbProp={6,1,3103,1,0,0},nExpiredTime=20120201,},1,"5"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 1000 and mark < 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"宋金达1000点领取种子"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "宋金达1000点领取种子", "20颗种子", 1}},
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click npc named plutus",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"大财神"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"在这个温暖的春天，各位大侠可以到我这里拿各种水果合成<color=yellow> 五果银盘和五果金盘<color>. 按鼠标使用<color=yellow> 五果银盘和五果金盘<color> 将有丰厚奖励，如果幸运可以获得<color=yellow> 新年红包，如果大侠给新年红包（小） <color> 以及10万送给老衲交给我，我将送给你丰富的奖励。在整个活动期间，我将在这随时恭候各位的大驾光临!"} },
		{"AddDialogOpt",	{"合成五果银盘",12} },
		{"AddDialogOpt",	{"合成五果金盘",15} },
		{"AddDialogOpt",	{"上交新年红包 (小)",18} },
		{"AddDialogOpt",	{"换红包",22} },
		{"AddDialogOpt",	{"免费领经验",28} },
		{"AddDialogOpt",	{"上交龙状面具",30} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "wuguobaiyinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"合成五果银盘有两种方法，第一种: 1 个香蕉+ 1柑子+ 1柚子+ 1柿子+ 1 梨子+ 1 银盘; 第二种方法是：1 椰子+ 1 木瓜+1 番荔枝+ 1 无花果+ 1 芒果+ 1金盘. 大侠想使用哪种. ",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"第一种",13} },
		{"AddDialogOpt",	{"第二种",14} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"五果银盘",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"香蕉",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"柑子",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"柚子",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"柿子",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"梨子",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"银盘",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="五果银盘",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"合成五果银盘"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"五果银盘",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"芒果",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"椰子",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"木瓜",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"番荔枝",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"无花果",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"银盘",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="五果银盘",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"合成五果银盘"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "wuguohuangjinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"合成五果金盘有两种放在，第一种: 1香蕉+ 1 柑子+ 1 柚子+ 1 柿子+ 1梨子+ 1 金盘；第二种方法: 1 椰子 + 1木瓜+ 1番荔枝+ 1 无花果+ 1芒果+金盘. 大侠想用哪种.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"第一种",16} },
		{"AddDialogOpt",	{"第二种",17} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"金盘五果",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"香蕉",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"柑子",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"柚子",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"柿子",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"梨子",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"金盘",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"合成五果金盘"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"五果金盘",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"芒果",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"椰子",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"木瓜",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"番荔枝",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"无花果",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"金盘",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"合成五果金盘"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "handin redbag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",0,0,0,0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"新娘红包(小)",{tbProp={6,1,3108,1,0,0},},1} },
		{"AddOneMaterial",	{"银两",{nJxb=1},100000} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDBAG_DAILY,MAX_REDBAG_DAILY,"今天大侠已交够了，等明天再继续哦","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,1,EVENT_LOG_TITLE,"NopBaoLiXiNamMoiTaiNPCDaiThanTai"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "NopBaoLiXiNamMoiTaiNPCDaiThanTai", "1000000 经验值", 1}},
		{"ThisActivity:AddTaskDaily",	{TSK_REDBAG_DAILY,1} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "use wuguodebaiyinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3105,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新生村使用."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOBAIYINPAN,MAX_USED_WUGUOBAIYINPAN,"大侠已领取太多奖励了，要不试试其他的怎么样!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguobaiyinpan",	{nil} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use wuguodehuangjinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3106,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新生村使用."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOHUANGJINPAN,MAX_USED_WUGUOHUANGJINPAN,"大侠已领取太多奖励了，要不试试其他的怎么样!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguohuangjinpan",	{nil} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use zhongzi",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3107,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:IsFightState",	{1, "只能在战斗区域使用."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"ThisActivity:CheckUseZhongzi",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhongzi",	{nil} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "bao li xi do select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"换红包可以使用以下宝石中的一种:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{2918,2,"今天大侠已经换够了，等明天再来哦","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"用晶红宝石",23} },
		{"AddDialogOpt",	{"用蓝水晶",24} },
		{"AddDialogOpt",	{"用紫水晶",25} },
		{"AddDialogOpt",	{"用绿水晶",26} },
	},
}
tbConfig[23] = --用晶红换红包
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"红包",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"晶红宝石",{tbProp={4,353,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{		
		{"ThisActivity:ComposeRedEvelop",	{"用晶红宝石换红包"} },
	},
}
tbConfig[24] = --用蓝水晶换红包
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"红包",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"蓝水晶",{tbProp={4,238,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:ComposeRedEvelop",	{"用蓝水晶换红包"} },
	},
}
tbConfig[25] = --用紫水晶换红包
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"红包",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"紫水晶",{tbProp={4,239,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"用紫水晶换红包"} },		
	},
}
tbConfig[26] = --用绿水晶换红包
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"红包",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"绿水晶",{tbProp={4,240,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"用绿水晶换红包"} },		
	},
}
tbConfig[27] = --使用红包
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "use red evelop",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30169,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2500000,1,EVENT_LOG_TITLE,"使用红包"} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "领取奖励对话free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从0:00-16-1-2012 到 24:00-17-1-2012, 150级及150级以上的大侠(重生不限制) 可以来见我领取礼物为不叠加的一亿经验值, 每个人只能领取唯一的一次.",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想领奖",29} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "领奖free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 0, "每个人只能领取一次", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"MienPhiNhanThuongDiemKinhNghiem"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "免费领取经验奖励", "100000000 经验值", 1}},
	},
}
tbConfig[30] = --交龙面具
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "give dragon mask",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>换经验值",1,1,1,0.02},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"面具-龙珠",{tbProp={0,11,75,1,0,0},},1} },
		{"AddOneMaterial",	{"面具- 龙头",{tbProp={0,11,76,1,0,0},},1} },
		{"AddOneMaterial",	{"面具- 龙身",{tbProp={0,11,77,1,0,0},},1} },
		{"AddOneMaterial",	{"面具- 龙尾",{tbProp={0,11,78,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeDragonMask",	{nil} },		
	},
	tbActition = 
	{
		{"ThisActivity:ComposeDragonMask",	{nil} },		
	},
}