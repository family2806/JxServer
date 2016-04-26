Include("\\script\\activitysys\\config\\10\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "LingFanNPC_Click",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"商店"},
	tbCondition = 
	{
	},
	tbActition = 
	{
--		{"AddDialogOpt",	{"换行侠令奖品",2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "ChangXingXiaLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow> 行侠令<color> 从游戏活动中获得，可以在我这里换取奖品。"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"青驹令",3} },
		{"AddDialogOpt",	{"云禄令",4} },
		{"AddDialogOpt",	{"苍狼令",5} },
		{"AddDialogOpt",	{"玄猿令",6} },
		{"AddDialogOpt",	{"修服神游",7} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_QingJuLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"青驹令",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"行侠令",{tbProp={6,1,2566,1,0,0},},10} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2369,1,0,0},nBindState=-2,},1,"XingXiaLing_QingJuLing"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_YunLuLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"云禄令",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"行侠令",{tbProp={6,1,2566,1,0,0},},26} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2353,1,0,0},nBindState=-2,},1,"XingXiaLing_YunLuLing"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_CangLangLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"苍狼令",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"行侠令",{tbProp={6,1,2566,1,0,0},},170} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2352,1,0,0},nBindState=-2,},1,"XingXiaLing_CangLangLing"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_XuanYuanLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"玄猿令",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"行侠令",{tbProp={6,1,2566,1,0,0},},600} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2351,1,0,0},nBindState = -2,},1,"XingXiaLing_XuanYuanLing"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_XiuFuShenYou",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"修服神游",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"行侠令",{tbProp={6,1,2566,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2565,1,0,0},nBindState = -2,},1,"XingXiaLing_XiuFuShenYou"} },
	},
}
