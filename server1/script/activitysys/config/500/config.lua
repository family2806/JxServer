Include("\\script\\activitysys\\config\\500\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		--{"tbBetInfo:Init",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "CaiShenDialogue",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"财神"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"买铜钥匙",6} },
--		{"AddDialogOpt",	{"看此次赛程",3} },
--		{"AddDialogOpt",	{"看上次幸运号",4} },
--		{"AddDialogOpt",	{"领奖",5} },
--		{"SetDialogTitle",	{"<npc>富贵锦盒"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "CurBetInfo_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:CurBetInfo_dlg",	{nil} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "LastBetInfo_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:LastBetInfo_dlg",	{nil} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "GetAward_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		--{"tbBetInfo:GetAward_dlg",	{nil} },
	},
}
--tbConfig[6] = --一个细节
--{
--	nId = 6,
--	szMessageType = "CreateCompose",
--	szName = "Buy_TongYaoShi",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {"铜钥匙",1,1,1,1},
--	tbCondition = 
--	{
--		{"AddOneMaterial",	{"银两",{nJxb=1,},100000} },
--	},
--	tbActition = 
--	{
--		{"PlayerFunLib:GetItem",	{tbTongyaoshi,1,"CaiShen_Buy_TongYaoShi"} },
--	},
--}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ItemScript",
	szName = "使用幸运袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30111,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"tbAwardTemplet:Give",	{tbLuckyBagAward,1,{"富贵锦盒","使用幸运袋"}} },
	},
}
