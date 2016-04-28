Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --±¾ÖÜËÎ½ð2000µã³¡Êý
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 2000 ®iÓm",
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
	szName = "Hoµn thµnh v­ît ¶i trong tuÇn",
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
tbConfig[3] = --Ñ×µÛ®Õ
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "V­ît qua ¶i Viªm §Õ thø 5"} },
	},
}
tbConfig[4] =		--V­ît qua ¶i 17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "V­ît qua ¶i 17"} },
	},
}
tbConfig[5] = --Ñ×µÛ- ´³¹Ø10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"KyNang150", "V­ît qua ¶i Viªm §Õ thø 10"} },
	},
}

