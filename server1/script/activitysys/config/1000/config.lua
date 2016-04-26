Include("\\script\\activitysys\\config\\1000\\variables.lua")
tbConfig = {}
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_MungPBM\t宋金1000"} },
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_MungPBM\t宋金3000"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "闯过17关 第一阶段",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t闯关17"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "闯关28第1阶段",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t闯关28"} },
	},
}
tbConfig[5] = --水贼头领
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "杀死1水贼头领",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t消灭水贼头领"} },
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_MungPBM\t消灭水贼大头领"} },
	},
}
tbConfig[7] = --Vi猰 
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "闯关炎帝第10关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_MungPBM\t闯关炎帝第10关"} },
	},
}
tbConfig[8] = --世界boss
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "消灭世界BOSS",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},50,"Event_MungPBM\t消灭世界BOSS"} },
	},
}
tbConfig[9] = --杀手BOSS
{
	nId = 9,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},2,"Event_MungPBM\t消灭杀手boss"} },
	},
}
--Giai 畂筺 2
tbConfig[10] = --宋金1000点
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "高级宋金1000点",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_MungPBM\t宋金1000"} },
	},
}
tbConfig[11] = --宋金3000 点
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "高级宋金3000点",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t宋金3000"} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "闯关17第2阶段",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_MungPBM\t闯关17"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "闯关28第二2阶段",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_MungPBM\t闯关28"} },
	},
}
tbConfig[14] = --水贼头领
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "杀死1水贼头领",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},3,"Event_MungPBM\t消灭水贼头领"} },
	},
}
tbConfig[15] = --水贼大头领
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "消灭水贼大头领",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t消灭水贼大头领"} },
	},
}
tbConfig[16] = --炎帝
{
	nId = 16,
	szMessageType = "YDBZguoguan",
	szName = "闯关炎帝第10关",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t闯关炎帝第10关"} },
	},
}
--add 对话npc
tbConfig[17] = --掌灯宫女对话
{
	nId = 17,
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
		{"AddDialogOpt",	{"欢迎新版的活动",18} },		
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "与掌灯的对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>看起来将会有又一番波动了"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成原料", 23} },
		{"AddDialogOpt",	{"送花给掌灯宫女", 26} },
		{"AddDialogOpt",	{"领取参加周性能奖励", 19} },
	},
}
tbConfig[19] =
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "与掌灯对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>在本周，请经常参加宋金、闯关、炎帝性能，然后来见我领取奖励"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"看参加本周性能的次数",29} },
		{"AddDialogOpt",	{"领取参加15场宋金的奖励",20} },
		{"AddDialogOpt",	{"领取参加15次闯关的奖励",21} },
		{"AddDialogOpt",	{"领取参加十次炎帝的奖励",22} },
	},
}
--每周性能奖励
tbConfig[20] = --宋金周
{
	nId = 20,
	szMessageType = "nil",
	szName = "领取完成15次宋金2000点奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, 15, ">=", "你还未参加够15场宋金，需要更加努力"}},
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_TONGKIM_WEEKLY_AWARD, 0, "<=", "本周已领奖了，要积极参加各项性能，下周再来领奖哦."}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTaskCount", {nTSK_TONGKIM_WEEKLY_AWARD, 1},},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},10,"Event_MungPBM\t本周宋金奖励"} },
	},
}
tbConfig[21] = --周闯关
{
	nId = 21,
	szMessageType = "nil",
	szName = "领取完成15次闯关奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 15, ">=", "你还未完成15次闯关，不用想来领奖哦"}},
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VUOTAI_WEEKLY_AWARD, 0, "<=", "你已领取本周奖励了，下周再来哦"}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTaskCount", {nTSK_VUOTAI_WEEKLY_AWARD, 1},},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},10,"Event_MungPBM\t本周闯关奖励"} },
	},
}
tbConfig[22] = --炎帝
{
	nId = 22,
	szMessageType = "nil",
	szName = "领取完成10次炎帝闯关奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 10, ">=", "你的领奖条件不够，需要更加努力哦"}},
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VIEMDE_WEEKLY_AWARD, 0, "<=", "每周只能活动一次该奖励，努力领取下周的奖励哦"}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTaskCount", {nTSK_VIEMDE_WEEKLY_AWARD, 1},},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},10,"Event_MungPBM\t本周炎帝闯关奖励"} },
	},
}
--合成原料
tbConfig[23] =
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "与掌灯对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>合成原料"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成葫芦瓶",24} },
		{"AddDialogOpt",	{"合成铁心酒",25} },
	},
}
tbConfig[24] = --换葫芦瓶
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "换葫芦瓶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>葫芦瓶",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },
		{"AddOneMaterial",	{"黄菊花",{tbProp={6,1,30112,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"紫菊花",{tbProp={6,1,30114,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_MungPBM\t合成葫芦瓶"} },
	},
}
tbConfig[25] = --换铁心酒
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "换铁心酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>铁心酒",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },
		{"AddOneMaterial",	{"黄菊花",{tbProp={6,1,30112,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"白菊花",{tbProp={6,1,30113,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"紫菊花",{tbProp={6,1,30114,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30116,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_MungPBM\t合成铁心酒"} },
	},
}
tbConfig[26] = --送黄菊花
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "交黄菊花",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>送黄菊花",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },
		{"ThisActivity:VngGiveDaisyLimit", {nil}},
		{"AddOneMaterial",	{"黄菊花",{tbProp={6,1,30112,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:VngGiveDaisy", {nil}},
	},
}
tbConfig[27] = --使用葫芦瓶
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "使用葫芦瓶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30115,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，不能使用物品",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngGourdUseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:VngUseGourd", {nil}},
	},
}
tbConfig[28] = --使用铁心酒
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "使用铁心酒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30116,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，不能使用物品",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_GOURD_USE_DAYLIMIT,10,"今天已使用10瓶铁心酒，明天继续使用.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_GOURD_USE_DAYLIMIT,1} },
		{"ThisActivity:VngUseSteelHeartWine", {nil}},
	},
}
tbConfig[29] = --看参加性能次数
{
	nId = 29,
	szMessageType = "nil",
	szName = "检查参加本周性能次数",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来哦",">="} },		
	},
	tbActition = 
	{
		{"ThisActivity:VngCheckWeeklyFeatureMatchCount", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, nTSK_VUOTAI_WEEKLY_MATCH_COUNT, nTSK_VIEMDE_WEEKLY_MATCH_COUNT},},		
	},
}