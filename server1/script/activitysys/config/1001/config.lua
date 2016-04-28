Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --本周宋金2000点场数
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 2000 甶觤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, 1}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "Ho祅 th祅h vt 秈 trong tu莕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi28"} },
	},
}
tbConfig[3] = --炎帝
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "VuotAiViemDe5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe5"} },
	},
}
tbConfig[4] =		--VuotAi17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "VuotAi17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi17"} },
	},
}
tbConfig[5] = --炎帝- 闯关10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "VuotAiViemDe10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe10"} },
	},
}

