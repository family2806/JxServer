Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --�����ν�2000�㳡��
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�2000��",
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
	szName = "������ɴ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"�����������", "����28"} },
	},
}
tbConfig[3] = --�׵ۮ�
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "�����׵۵�5��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"�����������", "�����׵۵�5��"} },
	},
}
tbConfig[4] =		--����17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "����17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"�����������", "����17"} },
	},
}
tbConfig[5] = --�׵�- ����10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "�����׵۵�10��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0}, tbParam = {60}, nExpiredTime=24*60,},1,"�����������", "�����׵۵�10��"} },
	},
}

