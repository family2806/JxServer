Include("\\script\\activitysys\\config\\20\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
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
		{"NpcFunLib:AddDialogNpc",	{"����",1907,{{11,3182,4951}}} },
		{"ThisActivity:InitRule",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"��6��3�յ�2012��6��30�գ���λ���Ϳ��Ե�����μ�ˮ���ո����ո�ˮ���󣬿��������һ���Ʒ��ÿ��ÿ�����ֻ�ܲμ�2�֣�ʱ���16h��17h�Լ�20h��21h"} },
		{"AddDialogOpt",	{"�μ��ո�ˮ���",3} },		
		{"AddDialogOpt",	{"��ȡ������",5} },
		{"AddDialogOpt",	{"����ɫˮ����Ʒ",4} },
		{"AddDialogOpt",	{"�ɻƽ�ˮ����Ʒ",8} },
	},
}
tbConfig[3] = --һ��ϸ��
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
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>����Ʒ",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��ɫ����",{tbProp={6,1,3199}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{300000,0,"Event_Thang6","NopVatPhamLuaXanh"} },
	},
}
tbConfig[5] = --һ��ϸ��
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
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����˿��",7} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��˿��",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3197,1,0,0},nExpiredTime = 20120701},1,"Event_Thang6","buy tool"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>����Ʒ",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"�ƽ𵾹�",{tbProp={6,1,3200}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{3000000,0,"Event_Thang6","�ɻƽ𵾹���Ʒ"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "ʹ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3201,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{VN_TSK_USE_BAG_DAILY,2,"�����㲻��ʹ�ø���Ʒ�ˣ����������ʹ��.","<"} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddTaskDaily",	{VN_TSK_USE_BAG_DAILY,1} },
		{"Msg2Player",	{"������һ�βμ�ũ�����ܻ."} },
		{"ThisActivity:UseBagLog",	{nil} }		
	},
}
tbConfig[10] = --һ��ϸ��
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
tbConfig[11] = --һ��ϸ��
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
tbConfig[12] = --һ��ϸ��
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
tbConfig[13] = --һ��ϸ��
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
tbConfig[14] = --һ��ϸ��
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
tbConfig[15] = --һ��ϸ��
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
tbConfig[16] = --һ��ϸ��
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
tbConfig[17] = --һ��ϸ��
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
tbConfig[18] = --һ��ϸ��
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
