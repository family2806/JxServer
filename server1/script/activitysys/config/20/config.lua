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
		{"NpcFunLib:AddDialogNpc",	{"Thu V﹏",1907,{{11,3182,4951}}} },
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
		{"SetDialogTitle",	{"T� ng祔 3 th竛g 6 n ng祔 30 th竛g 6 n╩ 2012, c竎 hi謕 kh竎h c� th� n ch� c馻 ta tham gia ho箃 ng thu nh苩 l骯 nc, sau khi thu nh苩 l骯 nc c� th� n g苝 ta  i ph莕 thng, m鏸 ng祔 m鏸 ngi ch� 頲 tham gia nhi襲 nh蕋 2 v遪g, th阨 gian t� 16h n 17h v� 20h n 21h"} },
		{"AddDialogOpt",	{"Tham gia ho箃 ng thu nh苩 l骯 nc",3} },		
		{"AddDialogOpt",	{"Nh薾 thng x誴 h筺g",5} },
		{"AddDialogOpt",	{"N閜 v藅 ph萴 L骯 Xanh",4} },
		{"AddDialogOpt",	{"N閜 v藅 ph萴 L骯 V祅g",8} },
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
	tbMessageParam = {"<npc>N閜 v藅 ph萴",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L骯 Xanh",{tbProp={6,1,3199}},1} },
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
	tbMessageParam = {"H祅g rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"mua Li Li襪 S総",7} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Li Li襪 S総",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng﹏ lng",{nJxb=1},100000} },
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
	tbMessageParam = {"<npc>N閜 v藅 ph萴",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L骯 V祅g",{tbProp={6,1,3200}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{3000000,0,"Event_Thang6","缴L骯 V祅g物品"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "S� d鬾g T骾 hng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3201,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{VN_TSK_USE_BAG_DAILY,2,"H玬 nay ngi kh玭g th� s� d鬾g v藅 ph萴 n祔 n鱝, ng祔 mai h穣 s� d鬾g ti誴.","<"} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddTaskDaily",	{VN_TSK_USE_BAG_DAILY,1} },
		{"Msg2Player",	{"Nh薾 頲 th猰 1 l莕 tham gia ho箃 ng Tr� T礽 Nh� N玭g."} },
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
