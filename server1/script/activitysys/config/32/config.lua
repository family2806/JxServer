Include("\\script\\activitysys\\config\\32\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "���������Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����- ������"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������������",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "ÿ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"'��֮���ߣ�Ϊ��Ϊ��'.����ҷ�ʦ��֮��������Ѱ�Ҹ�λӢ�ۺ��ܡ���ʦ��˵��ֻ��Ҫ����ͬ��Э����һ�����д��˴��ӵ�һ�졣���ǲ�����Ҫ�ҵ�����?",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������������������",3} },
		{"AddDialogOpt",	{"������ȡ������",4} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "������ÿ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"120�����ϻ����������Ĵ���ÿ����Ե��������������������ÿ������ÿ��������һ�Σ���ɺ��ҽ�������Ӧ�Ľ���!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ɱ������",5} },
		{"AddDialogOpt",	{"�ӶԻ�����",6} },
		{"AddDialogOpt",	{"���ռ�����",7} },
		{"AddDialogOpt",	{"�Ҳ�С��Ū���������",11} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "������ȡ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"120�����ϻ����������Ĵ���ÿ����Ե��������������������ÿ������ÿ��������һ�Σ���ɺ��ҽ�������Ӧ�Ľ���!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ȡɱ��������",8} },
		{"AddDialogOpt",	{"��ȡ�Ի�������",9} },
		{"AddDialogOpt",	{"��ȡ�ռ�������",10} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "��ɱ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptKillTask",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "�ӶԻ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptTalkTask",	{nil} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "���ռ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptGatherTask",	{nil} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "��ȡɱ��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletKillTask",	{nil} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "��ȡ�Ի�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletTalkTask",	{nil} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "��ȡ�ռ�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletGatherTask",	{nil} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "nil",
	szName = "�Ҳ�С��Ū�����������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_ID,0,"��λ<lua GetSex() == 1 and \"���\" or \"���\"/> �һ�����Ҫ���������",">"} },
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_STATE,0,"��λ<lua GetSex() == 1 and \"���\" or \"���\"/> ���Ѿ��������ŵ����ˣ����Ǹ�л","=="} },
		{"PlayerFunLib:CheckItemInPlayer",	{{tbProp={6,1,2571,1,-1,0},},1,"��λ<lua GetSex() == 1 and \"���\" or \"���\"/> �������ϻ�������Ĵ��������Ѿ����ҵ����ˣ�������ϸ����." } },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2571,1,0,0},},1,"�ٴ���ȡ��������",""} },
		{"Talk",	{1,"","�����ˣ��Ǿ�������д���㣬Ҳ�������ֶ�����"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "�ν�С����Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С���"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������Ÿ���",15} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "��ﴳ�ضԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������Ÿ���",15} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "�����С�жԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������Ÿ���",15} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "�������Ÿ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:TalkToNpc",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ServerStart",
	szName = "���� sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Init",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "�챣������Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������Ÿ���",15} },
	},
}
