tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "��ͷ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:Init",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "����Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���˴�����",3} },
		{"AddDialogOpt",	{"���ϴ����˺�",4} },
		{"AddDialogOpt",	{"�콱",5} },
		{"SetDialogTitle",	{"<npc>�������"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "���˴�����",
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
	szName = "���ϴ����˺�",
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
	szName = "�콱",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:GetAward_dlg",	{nil} },
	},
}
