Include("\\script\\activitysys\\config\\10\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "LingFanNPC_Click",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
--		{"AddDialogOpt",	{"§æi phÇn th­ëng Hµnh HiÖp LÖnh",2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "ChangXingXiaLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow> Hµnh HiÖp LÖnh <color> nhËn ®­îc tõ trong c¸c ho¹t ®éng cña trß ch¬i,cã thÓ ®ëi lÊy phÇn th­ëng t¹i chç cña ta ®©y."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Thanh C©u LÖnh",3} },
		{"AddDialogOpt",	{"V©n Léc LÖnh",4} },
		{"AddDialogOpt",	{"Th­¬ng Lang LÖnh",5} },
		{"AddDialogOpt",	{"HuyÒn Viªn LÖnh",6} },
		{"AddDialogOpt",	{"Tu Phôc ThÇn Du",7} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_QingJuLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thanh C©u LÖnh",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hµnh HiÖp LÖnh",{tbProp={6,1,2566,1,0,0},},10} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2369,1,0,0},nBindState=-2,},1,"XingXiaLing_QingJuLing"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_YunLuLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V©n Léc LÖnh",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hµnh HiÖp LÖnh",{tbProp={6,1,2566,1,0,0},},26} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2353,1,0,0},nBindState=-2,},1,"XingXiaLing_YunLuLing"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_CangLangLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th­¬ng Lang LÖnh",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hµnh HiÖp LÖnh",{tbProp={6,1,2566,1,0,0},},170} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2352,1,0,0},nBindState=-2,},1,"XingXiaLing_CangLangLing"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_XuanYuanLing",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"HuyÒn Viªn LÖnh",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hµnh HiÖp LÖnh",{tbProp={6,1,2566,1,0,0},},600} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2351,1,0,0},nBindState = -2,},1,"XingXiaLing_XuanYuanLing"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "XingXiaLing_XiuFuShenYou",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tu Phôc ThÇn Du",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hµnh HiÖp LÖnh",{tbProp={6,1,2566,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2565,1,0,0},nBindState = -2,},1,"XingXiaLing_XiuFuShenYou"} },
	},
}
