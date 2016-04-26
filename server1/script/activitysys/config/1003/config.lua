Include("\\script\\activitysys\\config\\1003\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪掉原料",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,30131,1,0,0},nExpiredTime=nItemExpiredTime,},1,"5"} },
	},
}
tbConfig[3] = --宋金1000点
{
	nId = 3,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"武蓝报孝活动\t宋金1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "宋金1000", "20 朵红玫瑰", 1}},
	},
}
tbConfig[4] = --宋金3000点
{
	nId = 4,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},40,"武蓝报孝活动\t宋金3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "宋金3000", "40 朵红玫瑰", 1}},
	},
}
tbConfig[5] =
{
	nId = 5,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},15,"武蓝报孝活动\t闯关17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "闯关17", "15 朵红玫瑰", 1}},
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "闯关28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},25,"武蓝报孝活动\t闯关28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "闯关28", "25 朵红玫瑰", 1}},
	},
}
tbConfig[7] = --水贼头领
{
	nId = 7,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},10,"武蓝报孝活动\t消灭水贼头领"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭水贼头领", "10朵红玫瑰", 1}},
	},
}
tbConfig[8] = --水贼大头领
{
	nId = 8,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"武蓝报孝活动\t消灭水贼大头领"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭水贼大头领", "20 朵红玫瑰", 1}},
	},
}
tbConfig[9] = --炎帝
{
	nId = 9,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},30,"武蓝报孝活动\t炎帝闯关10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "炎帝闯关10", "30朵红玫瑰", 1}},
	},
}
tbConfig[10] = --世界boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "消灭世界boss",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},50,"武蓝报孝活动\t消灭世界boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭世界boss", "50朵红玫瑰", 1}},
	},
}
tbConfig[11] = --杀手boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手任务",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},5,"武蓝报孝活动\t消灭杀手boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭杀手boss", "5 朵红玫瑰", 1}},
	},
}
----add 对话npc
tbConfig[12] = --掌灯宫女对话
{
	nId = 12,
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
		{"AddDialogOpt",	{"我想换九仙御宴",13} },		
	},
}
----合成原料
tbConfig[13] = --换九仙御宴
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "换九仙御宴",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>九仙御宴",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"等级不够，下次再来哦",">="} },
		{"AddOneMaterial",	{"红玫瑰",{tbProp={6,1,30132,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRoseBud", {nil}},		
	},
}
tbConfig[14] = --对话穆乔连
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "点击穆乔连",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"穆乔连"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成翠就狐仙",15} },
		{"AddDialogOpt",	{"送红玫瑰",16} },
		{"AddDialogOpt",	{"送九仙御宴",18} },
	},
}
tbConfig[15] = --换翠就狐仙
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "换翠就狐仙",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>翠就狐仙",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"等级不够，下次再来吧",">="} },
		{"AddOneMaterial",	{"红玫瑰",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},5} },
		{"AddOneMaterial",	{"九仙御宴",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"蓬莱海味",{tbProp={6,1,30129,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30130,1,0,0},nExpiredTime=nItemExpiredTime,},1,"武蓝报孝活动\\t合成翠就狐仙"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "合成翠就狐仙", "1 翠就狐仙", 1}},
	},
}
tbConfig[16] = --送玫瑰
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "送红玫瑰",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>送红玫瑰",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"等级不足，下次再来哦",">="} },
		{"AddOneMaterial",	{"红玫瑰",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"ThisActivity:CheckGiveRedRoseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRose", {nil}},
	},
}
tbConfig[17] = --使用翠就狐仙
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "使用翠就狐仙",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30130,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"等级不够，不能使用物品",">="} },
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:TTHT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_TTHT", {nil}},		
	},
}
tbConfig[18] = --送九仙御宴
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "送九仙御宴",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>送九仙御宴",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"等级不够，下次再来哦",">="} },
		{"ThisActivity:GiveCuuTienLimit", {nil}},
		{"AddOneMaterial",	{"九仙御宴",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:GiveCuuTien", {nil}},
	},
}