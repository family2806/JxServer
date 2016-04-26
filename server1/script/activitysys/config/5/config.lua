

-------局部变量定义 开始---------
local fn		= function(nItemIndex) local szMsg=format("恭喜高手%s已获得%s",GetName(),GetItemName(nItemIndex)) AddGlobalNews(szMsg) Msg2SubWorld(szMsg) end
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "CreateDialog",
	szName = "换取完美鸿影",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>阁下想换取哪种装备呢?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"换 [完美]鸿影红袖招",2} },
		{"AddDialogOpt",	{"换 [完美]鸿影剑挂西方",3} },
		{"AddDialogOpt",	{"换 [完美]鸿影沈园晚",4} },
		{"AddDialogOpt",	{"我想换 [完美]鸿影苜蓿",5} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "换 [完美]鸿影红袖招",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[完美]鸿影红袖招",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,437},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "换 [完美]鸿影剑挂西方",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[[完美]鸿影剑挂西方",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,435},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "换 [完美]鸿影沈园晚",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[完美]鸿影沈园晚醉",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,434},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "我想换 [完美]鸿影苜蓿",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[完美]鸿影苜蓿相忘",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,436},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "换金牌成黄金装备",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin",	{nil} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "换鸿影极品",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>阁下想换哪种装备?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想换[极品]鸿影红袖招",8} },
		{"AddDialogOpt",	{"我想换[极品]鸿影剑挂西方",9} },
		{"AddDialogOpt",	{"我想换[极品]鸿影沈园晚醉",10} },
		{"AddDialogOpt",	{"我想换[极品]鸿影苜蓿相忘",11} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "我想换[极品]鸿影红袖招",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[极品]鸿影红袖招",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,535},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "我想换[极品]鸿影剑挂西方",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[极品]鸿影剑挂西方",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,533},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "我想换[极品]鸿影沈园晚醉",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[极品]鸿影沈园晚醉",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,532},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "我想换[极品]鸿影苜蓿相忘",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[极品]鸿影苜蓿相忘",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"完美金牌",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,534},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "点击礼官",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"礼官"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
--Change request 04/06/2011, 制作白金装备- Modified by DinhHQ - 20110605
--		{"AddDialogOpt",	{"换金牌成黄金装备",6} },
--		{"AddDialogOpt",	{"换鸿影极品",7} },
--		{"AddDialogOpt",	{"换完美鸿影",1} },
--		{"AddDialogOpt",	{"换金牌装备黄金(继续)",13} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "nil",
	szName = "换金牌装备黄金(继续)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin_2",	{nil} },
	},
}
