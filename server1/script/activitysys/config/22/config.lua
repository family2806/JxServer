Include("\\script\\activitysys\\config\\22\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "点击武师",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"武师"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"报答恩师活动",2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "与武师对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"又一年风霜雨雪，又一年桃李锁香，不知我的弟子行走江湖如何了?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍报答恩师活动",3} },
		{"AddDialogOpt",	{"请武师用杜康酒",4} },
		{"AddDialogOpt",	{"献上五色香包",23} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "介绍报答恩师活动",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"时间从18/11/2010 到 13/12/2010 为报答恩师活动时间，阁下可以看看在首页的参加方法"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "请武师用杜康酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2572,-1,-1,-1},},nDukangjiuCount,"装备没有杜康酒"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddDukangjiuAward",	{TSK_DuKangJiu,TSK_Date_DuKangJiu,nDukangjiuCount} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
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
		{"AddDialogOpt",	{"报答恩师活动",6} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "点击掌灯宫女",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"最近我需要一点西湖龙井茶，丝绸，有色线，中药，我很急需这些物品，如果你送给我这些物品，我将送给你奖励。"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍报答恩师活动",3} },
		{"AddDialogOpt",	{"换取蚕丝香包",7} },
		{"AddDialogOpt",	{"换取五色香包",8} },
		{"AddDialogOpt",	{"换取中药香包",9} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "换取蚕丝香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"蚕丝香包",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"西湖龙井茶",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"蚕丝",{tbProp={6,1,2574,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2577,1,0,0},nExpiredTime=20101220,},1,"玩获得蚕丝香包"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "换取五色香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"五色香包",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"西湖龙井茶",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"有色线",{tbProp={6,1,2575,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2578,1,0,0},nExpiredTime=20101220,},1,"玩家获得五色香包"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "换取中药香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"中药香包",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"西湖龙井茶",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"中药",{tbProp={6,1,2576,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2579,1,0,0},nExpiredTime=20101220,},1,"玩家获得中药香包"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "宋金500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",500,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"教师节活动_宋金"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "宋金3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"教师活动_宋金"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},15,"100"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "闯关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"教师活动_闯关"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "与试炼堂长老对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang,"今天不能多收了","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足地方，最少需要一个1*1空位"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},1,"教师节活动_试炼堂"} },
		{"ThisActivity:AddTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"教师节活动_90级杀手"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "点击摊贩",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"摊贩"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买丝绸",17} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "买丝绸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"蚕丝",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"银两",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2574,1,0,0},nExpiredTime=20101213,},1,"教师节活动_摊贩"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "使用杜康酒礼包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2580,-1,-1,-1},nExpiredTime=20101213,}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"装备不足地方，最少需要一个1*1空位"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"教师节活动_使用杜康酒礼包"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用蚕丝香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2577,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_SiChouXiangBao,nSCXiangBaoUpExp,"使用蚕丝香包达到最高上限，不能再使用了.","<"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"大侠已达使用该物品上限","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddSichouxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用五色香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2578,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,3,1,"装备不足地方，最少需要2*3个空位"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"大侠已达到使用该物品上限","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddWucaixiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用中药香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2579,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,5,1,"装备不足地方，最少需要2*5个空位"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"大侠已达到使用该物品上限","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddZhongyaoxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ClickNpc",
	szName = "点击试炼堂长老",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"试炼堂长老"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"收取杜康酒",14} },
	},
}

tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "nil",
	szName = "献上五色香包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2578,-1,-1,-1},},1,"装备没有五色香包"} },
	},
	tbActition = 
	{
		{"ThisActivity:Give5SHB",	{nEXP_Give_NSHB, TSK_Date_Give_NSHB} },
	},
}