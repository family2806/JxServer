Include("\\script\\activitysys\\config\\1005\\variables.lua")
tbConfig = {}
tbConfig[1] = --聚力凝神散
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "使用聚力凝神散",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30142,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_TU_LUC_NGUNG_THAN_TAN_LIMIT_USE, 0, "每人只能使用该物品1次.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_TU_LUC_NGUNG_THAN_TAN_LIMIT_USE, 1}},
		{"PlayerFunLib:AddExp",	{500e6,0,"风云令牌","使用聚力凝神散"} },
	},
}
tbConfig[2] = --聚力凝神丸
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "使用聚力凝神丸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30143,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_TU_LUC_NGUNG_THAN_HOAN_LIMIT_USE, 0, "每人只能用一次该物品.", "=="}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_TU_LUC_NGUNG_THAN_HOAN_LIMIT_USE, 1}},
		{"PlayerFunLib:AddExp",	{1000e6,0,"风云令牌","使用聚力凝神丸"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "FinishYesou",
	szName = "完成野叟任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_YESOU_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_YESOU_QUEST_COUNT, 1}},
	},
}
tbConfig[4] = --杀手boss
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_KILLER_BOSS_QUEST_COUNT}},
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_KILLER_BOSS_QUEST_COUNT, 1}},
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "FinishMail",
	szName = "完成信使",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_MAIL_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_MAIL_QUEST_COUNT, 1}},
	},
}
tbConfig[6] = --宋金1000点
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "高级宋金1000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_SONGJIN_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_SONGJIN_QUEST_COUNT, 1}},
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "Chuanguan",
	szName = "完成闯关20",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_COT_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_COT_QUEST_COUNT, 1}},		
	},
}
tbConfig[8] = --炎帝
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_YDBZ_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_YDBZ_QUEST_COUNT, 1}},
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "FinishVLMC_VNG",
	szName = "完成一个武林盟主任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_VLMC_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_VLMC_QUEST_COUNT, 1}},
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "FLD_Collect_Item_VNG",
	szName = "完成一次收集功状令任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckNewPlayer", {nil}},
		{"ThisActivity:CheckMaxBitTaskValue", {tbBITTASK_FLD_QUEST_COUNT}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTASK_FLD_QUEST_COUNT, 1}},		
	},
}