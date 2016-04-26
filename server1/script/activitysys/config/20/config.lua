Include("\\script\\activitysys\\config\\20\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
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
		{"NpcFunLib:AddDialogNpc",	{"秋云",1907,{{11,3182,4951}}} },
		{"ThisActivity:InitRule",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V﹏"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"从6月3日到2012年6月30日，各位侠客可以到我这参加水稻收割活动，收割水稻后，可以来见我换奖品，每天每人最多只能参加2轮，时间从16h到17h以及20h到21h"} },
		{"AddDialogOpt",	{"参加收割水稻活动",3} },		
		{"AddDialogOpt",	{"领取排名奖",5} },
		{"AddDialogOpt",	{"缴绿色水稻物品",4} },
		{"AddDialogOpt",	{"缴黄金水稻物品",8} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "sign up",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:SignUp",	{nil} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>缴物品",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"绿色稻谷",{tbProp={6,1,3199}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{300000,0,"Event_Thang6","NopVatPhamLuaXanh"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "get rank award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetRankAward",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小贩"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买铁丝网",7} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"铁丝网",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"银两",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3197,1,0,0},nExpiredTime = 20120701},1,"Event_Thang6","buy tool"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>缴物品",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"黄金稻谷",{tbProp={6,1,3200}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{3000000,0,"Event_Thang6","缴黄金稻谷物品"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "使用香袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3201,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{VN_TSK_USE_BAG_DAILY,2,"今天你不能使用该物品了，请明天继续使用.","<"} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddTaskDaily",	{VN_TSK_USE_BAG_DAILY,1} },
		{"Msg2Player",	{"多增加一次参加农户逞能活动."} },
		{"ThisActivity:UseBagLog",	{nil} }		
	},
}
tbConfig[10] = --一个细节
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
tbConfig[11] = --一个细节
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
tbConfig[12] = --一个细节
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
tbConfig[13] = --一个细节
{
	nId = 13,
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
tbConfig[14] = --一个细节
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
tbConfig[15] = --一个细节
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
tbConfig[16] = --一个细节
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
tbConfig[17] = --一个细节
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
tbConfig[18] = --一个细节
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
