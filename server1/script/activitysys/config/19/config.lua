Include("\\script\\activitysys\\config\\19\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ǧ����Ե����",3} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "����Ƶƹ�Ů",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�Ƶƹ�Ů"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ǧ����Ե����",4} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "���ϵ�ǧ����Ե����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����޵�ͬ���ɣ�ǧ���޵ù����ߣ���ʹ�ô˺�������������Ե"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ����������ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����'ǧ����Ե�'",5} },
		{"AddDialogOpt",	{"��'����'",6} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "�Ƶƹ�Ů��ǧ����Ե����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���õ�������Ӻ���˼��ֻ��������һ��"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ����������ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����'ǧ����Ե����'",5} },
		{"AddDialogOpt",	{"��õ������",7} },
		{"AddDialogOpt",	{"����˼��",8} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "����ǧ����Ե���߻",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�� 0h/13/02/2011 �� 24h/23/02/2011, ������һ�����ߣ���ÿ�������϶���һ����Ե�ţ�����������ߺ󣬾Ϳ��Ե��Ƶƹ�Ů������ȡ��˼��������õ�����ӣ�ÿ����ʿ�����λ�����ȡõ�����ӻ�����˼����ÿ�λ��������ѡ����ȡһ��õ�����ӻ�����˼��������ڵ�����ȡõ�����ӻ�����˼���Ļ���δ���꣬�����ۻ���ȡ���ᵽ��һ�ռ�����ȡ��ÿλ��ʿ��ȡõ�����ӻ�����˼���Ļ������ֻ���ۻ�6�Σ�����6�ξͲ��ܼ����ۻ��ˣ�����ʯ�̵�����������Ʒ���԰�������һ����ȡõ�����ӻ�����˼���Ļ�����ȡ������˼�������ƣ���ȡ����õ������Ҫ��������������һ������\n1.�������������ӣ����˺����ϵ���Ե��Ҫ�ɶԣ������ţ���\n2.�����������\��ʿ��������������һ���ߴ�������߰˴����ִ�����õ�����ӣ���������һ������չ˱������µ�õ����ѿ����õ����ѿ����õ�����������Ĺ����У���ʿ��Ҫ��ʱ���н�ˮ��ʩ�ʣ����棬�βݣ����潽ˮ���β�ʩ��Խ��ʱ���٣�������ڱ��չ˵�õ�����ϵ�õ����о�Խ�࣬��õ��������ɿ���õ�廨��õ����������Բ�ժ���ֵ�õ�����ϵ�õ����У�����˼������Ҫ��ӣ�����˼��Ҳ��Ҫ��ˮ�����棬�βݣ�ʩ�ʣ����ԣ���Щ��������Խ��ʱ������յ��Ľ�Ʒ��Խ�ḻ����˼���ɳ�����ʿ���Բ�ժ��Ӧ��������˼��С�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "�����ϴ���ȡ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{GetHongXian,0,"����������ȡ������","=="} },
		{"ThisActivity:CheckHongXian",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ�����㣬���������"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHongXian",	{nil} },
		{"ThisActivity:SetValentineRandNumber",	{ValentineNumber} },
		{"ThisActivity:AddTaskDaily",	{GetHongXian,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "���Ƶƹ�Ů����ȡõ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��ֻ����ȡ��˼����õ�������ӵ�����һ�֣�С���������ȡõ�������ӣ���Ҫ������������һ������<enter>1. �����������ӣ����˺����ϵ���Ե��Ҫ�ɶԣ������ţ�<enter>2. ����2�����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������ȡõ������",9} },
		{"AddDialogOpt",	{"���Һú�����",4} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "���Ƶƹ�Ů����ȡ��˼��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��ֻ����ȡ��˼����õ�������ӵ�����һ�֣���û���ҵ��Լ�����Ե�����������������ȡһ����˼��ȥ�֣�ֻ��һ����������˼���Ľ���û����õ�����ķḻ��С��Ҫ�����ȥ���Լ�����Ե."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������ȡ��˼��",10} },
		{"AddDialogOpt",	{"����ϸ��һ��",4} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "��ȡõ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckGetMeiGuiHuaZiCondition",	{nil} },
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"��ȡ����������",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ�����㣬������ȡ����"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2697,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"2011�����˽ڣ��յ�õ������"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "��ȡ��˼��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"��ȡ����������",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ�����㣬������ȡ����"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2698,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"2011�����˽ڣ��յ���˼��"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "ʹ���������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2703,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckQJYYTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{QJYY_ExGetSeedTime,1} },
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
