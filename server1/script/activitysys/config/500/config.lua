Include("\\script\\activitysys\\config\\500\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
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
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "CaiShenDialogue",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"��ͭԿ��",6} },
--		{"AddDialogOpt",	{"���˴�����",3} },
--		{"AddDialogOpt",	{"���ϴ����˺�",4} },
--		{"AddDialogOpt",	{"�콱",5} },
--		{"SetDialogTitle",	{"<npc>�������"} },
	},
}
tbConfig[3] = --һ��ϸ��
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
tbConfig[4] = --һ��ϸ��
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
tbConfig[5] = --һ��ϸ��
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
--tbConfig[6] = --һ��ϸ��
--{
--	nId = 6,
--	szMessageType = "CreateCompose",
--	szName = "Buy_TongYaoShi",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {"ͭԿ��",1,1,1,1},
--	tbCondition = 
--	{
--		{"AddOneMaterial",	{"����",{nJxb=1,},100000} },
--	},
--	tbActition = 
--	{
--		{"PlayerFunLib:GetItem",	{tbTongyaoshi,1,"CaiShen_Buy_TongYaoShi"} },
--	},
--}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ItemScript",
	szName = "ʹ�����˴�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30111,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"tbAwardTemplet:Give",	{tbLuckyBagAward,1,{"�������","ʹ�����˴�"}} },
	},
}
