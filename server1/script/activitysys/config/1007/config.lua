Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--活动中寻找原料的方法
tbConfig[1] = --宋金1000点
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "高级宋金1000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "TongKim1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "宋金1000", "20 黄石", 1}},
	},
}

tbConfig[2] = --宋金3000点
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "高级宋金3000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},40,"Event_PNVN", "宋金3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 黄石", 1}},
	},
}

tbConfig[3] =		--闯关17
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "闯关17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},15,"Event_PNVN", "闯关17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "闯关17", "15黄石", 1}},
	},
}

tbConfig[4] =  				--闯关28
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "闯关 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "闯关28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "闯关28", "30黄石", 1}},
	},
}

tbConfig[5] = --水贼头领
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "消灭水贼头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "消灭水贼头领"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭水贼头领", "20 黄石", 1}},
	},
}

tbConfig[6] = --水贼大头领
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "消灭水贼大头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "消灭水贼大头领"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭水贼大头领", "30 黄石", 1}},
	},
}

tbConfig[7] = --炎帝- 闯关10
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "炎帝闯关10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "炎帝闯关10", "30 黄石", 1}},
	},
}
tbConfig[8] = --黄金boss
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "消灭黄金boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "消灭黄金boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭黄金boss", "30 黄石", 1}},
	},
}
tbConfig[9] = --杀手boss
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手boss任务",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_PNVN", "消灭杀手boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭杀手boss", "5 黄石", 1}},
	},
}

---与Npc对话
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "点击小芳",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小芳"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"上交黄石",12} },
		{"AddDialogOpt",	{"合成冰晶石",11} },
	},
}

tbConfig[11] = --合成冰晶石
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "合成冰晶石",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>冰晶石",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够150级，不能参加该活动",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"黄石",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"天精石",{tbProp={6,1,30154,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30155,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_PNVN", "和冰晶石"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "合同冰晶石", "1 冰晶石", 1}},
	},
}

tbConfig[12] = --上交黄石物品
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "上交黄石物品",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>上交黄石物品",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够150级，不能参加该活动",">="} },
		{"ThisActivity:HandInHoangThachLimit", {nil}},
		{"AddOneMaterial",	{"黄石",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:HandInHoangThach", {nil}},
	},
}

tbConfig[13] = --使用冰晶石
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "使用冰晶石",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30155,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，不能使用物品",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"ThisActivity:UseBTT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_BTT", {nil}},		
	},
}
