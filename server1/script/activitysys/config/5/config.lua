

-------�ֲ��������� ��ʼ---------
local fn		= function(nItemIndex) local szMsg=format("��ϲ����%s�ѻ��%s",GetName(),GetItemName(nItemIndex)) AddGlobalNews(szMsg) Msg2SubWorld(szMsg) end
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "CreateDialog",
	szName = "��ȡ������Ӱ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�����뻻ȡ����װ����?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�� [����]��Ӱ������",2} },
		{"AddDialogOpt",	{"�� [����]��Ӱ��������",3} },
		{"AddDialogOpt",	{"�� [����]��Ӱ��԰��",4} },
		{"AddDialogOpt",	{"���뻻 [����]��Ӱ��ޣ",5} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "�� [����]��Ӱ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[����]��Ӱ������",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,437},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "�� [����]��Ӱ��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[[����]��Ӱ��������",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,435},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "�� [����]��Ӱ��԰��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[����]��Ӱ��԰����",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,434},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "���뻻 [����]��Ӱ��ޣ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[����]��Ӱ��ޣ����",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,436},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "�����Ƴɻƽ�װ��",
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
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "����Ӱ��Ʒ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�����뻻����װ��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���뻻[��Ʒ]��Ӱ������",8} },
		{"AddDialogOpt",	{"���뻻[��Ʒ]��Ӱ��������",9} },
		{"AddDialogOpt",	{"���뻻[��Ʒ]��Ӱ��԰����",10} },
		{"AddDialogOpt",	{"���뻻[��Ʒ]��Ӱ��ޣ����",11} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "���뻻[��Ʒ]��Ӱ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[��Ʒ]��Ӱ������",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,535},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "���뻻[��Ʒ]��Ӱ��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[��Ʒ]��Ӱ��������",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,533},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "���뻻[��Ʒ]��Ӱ��԰����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[��Ʒ]��Ӱ��԰����",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,532},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "���뻻[��Ʒ]��Ӱ��ޣ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[��Ʒ]��Ӱ��ޣ����",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,534},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
--Change request 04/06/2011, �����׽�װ��- Modified by DinhHQ - 20110605
--		{"AddDialogOpt",	{"�����Ƴɻƽ�װ��",6} },
--		{"AddDialogOpt",	{"����Ӱ��Ʒ",7} },
--		{"AddDialogOpt",	{"��������Ӱ",1} },
--		{"AddDialogOpt",	{"������װ���ƽ�(����)",13} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "������װ���ƽ�(����)",
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
