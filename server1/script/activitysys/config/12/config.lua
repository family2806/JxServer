Include("\\script\\activitysys\\config\\12\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click npc1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Ng­êi VËn ChuyÓn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn hé tèng ",2} },
		{"SetDialogTitle",	{"Giao nép 1 Hçn Nguyªn Linh Lé cho ta th× cã thÓ tiÕp nhËn nhiÖm vô hé tèng, hé tèng hµng ®Õn chç th­¬ng bu«n th× cã thÓ nhËn ®­îc phÇn th­ëng phong phó, mçi ®¹i hiÖp mçi ngµy cã thÓ tiÕp nhËn nhiÖm vô 3 lÇn, trong hµnh tr×nh hé tèng, ®¹i hiÖp cÇn ph¶I b¶o vÖ sù an toµn cña Xe Ngùa, nÕu Xe Ngùa bÞ chÕt, th× sÏ r¬i ra 1 Hçn Nguyªn Linh Lé vµ nhiÖm vô sÏ thÊt b¹i"} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "nil",
	szName = "give task",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"ThisActivity:CheckCamp",	{0, szCAMP_TIP} },
		{"ThisActivity:CheckTaskDaily",	{TSKI_DAILY_COUNT,MAX_DAILY_COUNT,"H«m nay ®¹i hiÖp ®· hé tèng 3 lÇn råi, ®îi ngµy mai tiÕp tôc nhÐ.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveTask",	{nil} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "give award",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsWinner",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,szLEVEL_TIP,">="} },
		{"ThisActivity:CheckCamp",	{0, szCAMP_TIP} },
	},
	tbActition = 
	{
		{"ThisActivity:DelWinner",	{nil} },
		{"ThisActivity:AddTaskDaily",	{TSKI_DAILY_COUNT,1} },
		{"ThisActivity:GiveAward",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:ServerStart",	{nil} },
		{"NpcFunLib:AddDialogNpc",	{"Th­¬ng Bu«n",1905,{{1,1865,2755}}} },
		{"NpcFunLib:AddDialogNpc",	{"Ng­êi VËn ChuyÓn",1904,{{1,1564,2759}}} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "click npc2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Th­¬ng Bu«n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn phÇn th­ëng nhiÖm vô hé tèng",3} },
		{"SetDialogTitle",	{"´ÓNg­êi VËn ChuyÓnÄÇÀïÄÃ»õ¸øÎÒ£¬ÎÒ¾ÍÖØÉÍÄã"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "Click lingfan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckCamp",	{0} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua Gia HuyÕt Phï",7} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "buy healing bag",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Gia HuyÕt Phï",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=50000},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckCamp",	{0, szCAMP_TIP} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="Gia HuyÕt Phï",tbProp={6,1,3146,1,0,0},nExpiredTime=10080},1,EVENT_LOG_TITLE,"Mua Gia HuyÕt Phï"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "¿ÕÏ¸½Ú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
