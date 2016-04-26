Include("\\script\\activitysys\\config\\33\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "服务器启动加载npc",
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
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "宋金得分大于1000小于3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_越南国庆","宋金1000领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "宋金1000", "10 绳子", 1}},
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "宋金得分大于3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_越南国庆","宋金3000领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "宋金3000", "30 绳子", 1}},
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "闯关过第17关",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_越南国庆","闯关17领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "闯关17", "10 绳子", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "闯关过第28关",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_越南国庆","闯关28领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "闯关28", "15 绳子", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡杀死水贼头领",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_越南国庆","消灭水贼头领领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "消灭水贼头领", "10 绳子", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡杀死水贼大头领",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_越南国庆","消灭水贼大头领领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "消灭水贼大头领", "20 绳子", 1}},
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯过第十关",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_越南国庆","炎帝闯关10领绳子"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "炎帝闯关10", "20 绳子", 1}},
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "杀手任务",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},2,"Event_越南国庆","消灭杀手BOSS"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "消灭杀手BOSS", "2 绳子", 1}},
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "杀死黄金BOSS",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_越南国庆","消灭世界BOSS"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "消灭世界BOSS", "30 绳子", 1}},
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "第二阶段宋金大于1000小于3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_越南国庆","宋金1000领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_越南国庆","宋金1000领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "宋金1000", "10绳子和4白蜡烛", 1}},
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "第二阶段宋金得分大于3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_越南国庆","宋金3000领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},8,"Event_越南国庆","宋金3000领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "宋金3000", "30 绳子和8白蜡烛", 1}},
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "第二阶段闯关过第17关",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_越南国庆","闯关17领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_越南国庆","闯关17领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "闯关17", "10绳子和2 白蜡烛", 1}},
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "第二阶段闯关过第28关",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_越南国庆","闯关28领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_越南国庆","闯关28领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "闯关28", "15 绳子和4 白蜡烛", 1}},
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "第二阶段风陵渡杀死水贼头领",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_越南国庆","消灭水贼头领领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_越南国庆","消灭水贼头领领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "消灭水贼头领", "10 绳子和2白蜡烛", 1}},
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "第二阶段风陵渡杀死水贼大头领",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_越南国庆","消灭水贼大头领领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_越南国庆","消灭水贼大头领领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "消灭水贼大头领", "20 绳子和4白蜡烛", 1}},
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "YDBZguoguan",
	szName = "第二阶段炎帝闯过第十关",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_越南国庆","炎帝闯关10领绳子"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},5,"Event_越南国庆","炎帝闯关10领白蜡烛"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "炎帝闯关10", "20 绳子和5 白蜡烛", 1}},
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ClickNpc",
	szName = "国旗台对话",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"国旗台"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"交绳子",19} },
		{"AddDialogOpt",	{"换取国庆烟花",20} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "交绳子",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"交绳子",1,0,0,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"绳子",{tbProp={6,1,2976,1,0,0},},1} },
		{"ThisActivity:CheckTask",	{TKSG_HandinStringCount,"1000-<ComposeCount>","每个人物最多只交1000个物品[绳子] 在整个活动期间","<="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandinString",	{nil} },
		{"ThisActivity:AddTask",	{TKSG_HandinStringCount,1} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "换取国庆烟花",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"国庆烟花",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"绳子",{tbProp={6,1,2976,1,0,0},},1} },
		{"AddOneMaterial",	{"红色绸带",{tbProp={6,1,2977,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_ConvertFireworksCount,1} },
		{"ThisActivity:ConvertFireworks",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2979,1,0,0},nExpiredTime=20111001,},1,"Event_越南国庆","合成国庆烟花"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "合成国庆烟花", "国庆烟花", 1}},
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "与嫦娥对话",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"嫦娥"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"换寒月中秋饼",22} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "换寒月中秋饼",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"寒月中秋饼",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"白色蜡烛",{tbProp={6,1,2981,1,0,0},},1} },
		{"AddOneMaterial",	{"月光灯笼",{tbProp={6,1,2978,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_ConvertMooncakeCount,1} },
		{"ThisActivity:ConvertMooncake",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2980,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","DoiBanhTrungThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "换中秋月饼", "寒月中秋月饼", 1}},
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "使用国庆烟花",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2979,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧！",">="} },
		{"ThisActivity:CheckTask",	{TKSG_UseFireworksCount,1500,"每个人物最多只使用1500件物品 [国庆烟花] 在整个活动期间","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"装备最少要剩3个空位"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_UseFireworksCount,1} },
		{"ThisActivity:UseFirworks",	{nil} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "使用寒月中秋月饼",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2980,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_UseMooncakeCount,15,"每个人物最多只使用15件物品 [寒月中秋月饼] 在整个活动期间","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"装备最少要剩3个空位"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_UseMooncakeCount,1} },
		{"ThisActivity:UseMooncake",	{nil} },
	},
}
