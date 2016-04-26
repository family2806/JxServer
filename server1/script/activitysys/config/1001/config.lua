Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --本周宋金2000点场数
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "高级宋金2000点",
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
	szName = "本周完成闯关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"回天再造锦囊", "闯关28"} },
	},
}
tbConfig[3] = --炎帝
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "闯过炎帝第5关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"回天再造锦囊", "闯过炎帝第5关"} },
	},
}
tbConfig[4] =		--闯关17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "闯关17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"回天再造锦囊", "闯关17"} },
	},
}
tbConfig[5] = --炎帝- 闯关10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "闯过炎帝第10关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"回天再造锦囊", "闯过炎帝第10关"} },
	},
}

