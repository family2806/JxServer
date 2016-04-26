Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

local tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "�̵����ƽ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�̵�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ƽ����",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "�̵����ƽ��_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ƽ����",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2358,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]�ϳɻƽ����"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�����ԭ�ϴ�_ʤ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]�ν�ų�ԭ�ϴ�"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�ų�ԭ�ϴ�_��ƽ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[�ν�ų�ԭ�ϴ�"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�ų�ԭ�ϴ�_��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]�ν�ų�ԭ�ϴ�"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "�߼��ν�ų�ԭ�ϴ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]���طų�ԭ�ϴ�"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "����ɷų�ԭ�ϴ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},200,"[WC 2010]����ɷų�ԭ�ϴ�"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "ɱ������ų���ԭ�ϴ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},200,"[WC 2010]ɱ������ų���ԭ�ϴ�"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "ʹ��ԭ�ϴ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2360,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{63,1,"[WC 2010]ʹ��ԭ�ϴ�"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "����ٺϳ�Ƥ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>������ϳ�������?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳ�Ƥ��",11} },
		{"AddDialogOpt",	{"�ϳɻƽ���",12} },
		{"AddDialogOpt",	{"�ϳɰ׽���",13} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "�ϳ�Ƥ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ƥ��",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��о",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"ճ�ϼ�",{tbProp={6,1,2362,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2363,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]�ϳ�Ƥ��"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "�ϳɻƽ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ƽ���",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��о",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"ճ�ϼ�",{tbProp={6,1,2362,1,0,0},},1} },
		{"AddOneMaterial",	{"�ƽ����",{tbProp={6,1,2358,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2364,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]�ϳɻƽ���"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "�ϳɰ׽���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�׽���",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��о",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"ճ�ϼ�",{tbProp={6,1,2362,1,0,0},},1} },
		{"AddOneMaterial",	{"�׽����",{tbProp={6,1,2359,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2365,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]�ϳɰ׽���"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "ʹ��Ƥ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2363,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�����ϲ���ʹ��",">="} },
		{"ThisActivity:CheckTask",	{1,500,"ʹ��Ƥ�����ֻ��500000000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,0,"[WC 2010]ʹ��Ƥ���þ���"} },
		{"ThisActivity:AddTask",	{1,1} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "ʹ�ûƽ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2364,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�����ϲ���ʹ��",">="} },
		{"ThisActivity:CheckTask",	{2,4000,"ʹ�ûƽ���Ͱ׽�������ܹ�ֻ�� 4000000000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2000000,0,"[WC 2010]ʹ�ûƽ����þ���"} },
		{"ThisActivity:AddTask",	{2,2} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "ʹ�ð׽���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2365,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�����ϲ���ʹ��",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"װ����Ҫ10���ղ����ϲ���ʹ�ð׽���"} },
		{"ThisActivity:CheckTask",	{2,4000,"ʹ�ûƽ���Ͱ׽�������ܹ�ֻ��4000000000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{64,1,"[WC 2010]ʹ�ð׽����ý�Ʒ"} },
		{"ThisActivity:ExecActivityDetail",	{17} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "nil",
	szName = "ʹ�ð׽���_����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{2,4000,"ʹ�ûƽ���Ͱ׽�������ܹ�ֻ��4000000000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{65,1,"[WC 2010]ʹ�ð׽����þ��齱��"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "ʹ�ò�Ѫ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2366,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{3,1000,"ʹ�ò�Ѫ�����ֻ��1000000000����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[WC 2010]ʹ�ò�Ѫ�����Ӿ���"} },
		{"ThisActivity:AddTask",	{3,10} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "��ٺϳ�װ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>������ϳ�����װ��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳ���ҫ֮��",20} },
		{"AddDialogOpt",	{"�ϳɾ�׼֮ѥ",21} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "�ϳ���ҫ֮��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ҫ֮��",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"С��֮��",{tbProp={6,1,2367,1,0,0},},99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,214},nQuality=1,nExpiredTime=86400,},1,"[WC 2010]�ϳ���ҫ֮��"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "�ϳɾ�׼֮ѥ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��׼֮ѥ",0,2,2,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��׼֮ѥ",{tbProp={6,1,2368,1,0,0},},99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,215},nQuality=1,nExpiredTime=86400,},1,"[WC 2010]�ϳɾ�׼֮ѥ"} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ClickNpc",
	szName = "��ٽ��ܻ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ף��WORLDCUP",23} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "��ٽ��ܻ_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ף�ص���������������,��11/06/2010 �� 28/06/2010, ��λͬ�п��ԲμӺܶ����������Ļ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����ϳ�Ƥ��",10} },
		{"AddDialogOpt",	{"�����ϳ�װ��",19} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(15, tbConfig)
