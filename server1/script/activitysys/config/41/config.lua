Include("\\script\\activitysys\\config\\41\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
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
	szMessageType = "ClickNpc",
	szName = "click npc named dazhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"大主帅"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"上交徽号",3} },
		{"AddDialogOpt",	{"领取第一主帅称号",4} },
		{"AddDialogOpt",	{"领取第一主帅奖励",5} },
		{"AddDialogOpt",	{"激活第一主帅性能",6} },
		{"AddDialogOpt",	{"检查名号积分",7} },
		{"AddDialogOpt",	{"升级徽号",16} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "handin medal total",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"您好",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_MEDAL,MAX_DAILY_HANDIN_MEDAL,"今天你已上交的太多了，明天再来吧","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"上交1级徽号",24} },
		{"AddDialogOpt",	{"上交2级徽号",25} },
		{"AddDialogOpt",	{"上交3级徽号",26} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "get title named diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_GET_TITLE,1,"您已领取该称号了","<"} },
		{"lib:CheckTimeAndWeekDay",	{1000,2400,"4","从每周星期五10:00到24:00h才能领取"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetTitle_1",	{nil} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "get diyizhushuai award",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_EXP_AWARD,1,"今天您已领取该奖励了，明天再来吧","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetZhuShuaiAward_1",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "active diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin ch祇",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"今天阁下的激活次数已经用完，等明天再来吧","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"激活闯关领取效果2倍经验",8} },
		{"AddDialogOpt",	{"激活炎帝领取效果2倍经验",9} },
		{"AddDialogOpt",	{"激活宋金领取效果2倍经验",10} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "query mark",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:QueryMark_1",	{nil} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "active chuangguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"今天阁下的激活次数已经用完，等明天再来吧","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_CHUANGGUAN} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "active YDBZ",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"今天阁下的激活次数已经用完，等明天再来吧","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_YDBZ} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "nil",
	szName = "active songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"今天阁下的激活次数已经用完，等明天再来吧","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_SONGJIN} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"宋金3000领徽号"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "songjin mark < 3000 and >= 1000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"宋金1000领徽号"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "chuangguan 17",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"闯关17领徽号"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "chuangguan 28",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"闯关28领徽号"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ 6",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"炎帝闯关6领徽号"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "level up medal",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"您好",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"升级到2级徽号",17} },
		{"AddDialogOpt",	{"升级到3级徽号",18} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "nil",
	szName = "compse medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{1} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "nil",
	szName = "compse medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{2} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"商贩"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买石金",20} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"裁缝",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"银两",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SHIJIN,1,EVENT_LOG_TITLE,"buy_shijin"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "click npc named caifengshi",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"裁缝"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"在线领奖",22} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LOGIN_MEDAL,MAX_DAILY_LOGIN_MEDAL,"今天您不能领取了，明天再来吧.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "nil",
	szName = "hand in medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{1} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "nil",
	szName = "hand in medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{2} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "SignUpSongJin",
	szName = "sign up songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {3},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_SONGJIN} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "SignUpYDBZ",
	szName = "sign up ydbz",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_YDBZ} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "SignUpChuangguan",
	szName = "sign up chuanggguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {2},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_CHUANGGUAN} },
	},
}
