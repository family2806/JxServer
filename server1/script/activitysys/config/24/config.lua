tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���뻻����",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "���뻻����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ֻ�д��������Ժգ����ܻ�ȡ�Ҿ��������磬������ѡ������?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��������",4} },
		{"AddDialogOpt",	{"��������",5} },
		{"AddDialogOpt",	{"�ƾ�����",6} },
		{"AddDialogOpt",	{"��ѩ����",10} },
		{"AddDialogOpt",	{"��������",11} },
		{"AddDialogOpt",	{"��һҳ",3} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "���뻻����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ֻ�д��������Ժգ����ܻ�ȡ�Ҿ��������磬������ѡ������?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ɷ�����",12} },
		{"AddDialogOpt",	{"��һҳ",2} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��������",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},66} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3465},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��������",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{2} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},462} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3466},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "�ƾ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ƾ�����",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{3} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},1386} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3467},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "��ѩ���� (ת�Ƽ�ʱ)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ѩ���� (ת�Ƽ�ʱ)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3468},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "��������(ת�Ƽ�ʱ)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ɷ羪��(ת�Ƽ�ʱ)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3470},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "�������� (ת�Ƽ�ʱ )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������� (ת�Ƽ�ʱ )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3473},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "��ѩ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>��ѩ����<color> �����¼��֣�������ѡ����һ��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ѩ����(ת�Ƽ�ʱ)",7} },
		{"AddDialogOpt",	{"��ѩ����(���ʻ���ɱǹ)",13} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>��������<color>�����¼��֣�������ѡ����һ��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������� (ת�Ƽ�ʱ)",8} },
		{"AddDialogOpt",	{"�������� (���ʻ���ɱǹ)",14} },
		{"AddDialogOpt",	{"��������( �ػ�)",15} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>��������<color> �����¼��֣�������ѡ����һ��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������� (ת�Ƽ�ʱ)",9} },
		{"AddDialogOpt",	{"�������� (���ʻ���ɱǹ)",16} },
		{"AddDialogOpt",	{"�������� (�ػ�)",17} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "��ѩ���� (���ʻ���ɱǹ)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ѩ���� (���ʻ���ɱǹ)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3469},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "��������(���ʻ���ɱǹ)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��������(���ʻ���ɱǹ)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3471},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "�������� ( �ػ� )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������� ( �ػ� )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3472},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "�������� (���ʻ���ɱǹ)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������� (���ʻ���ɱǹ)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3474},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "��������(�ػ�)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��������(�ػ�)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"����ʯ",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3475},nBindState = -2,nExpiredTime=10080,},1,"������"} },
	},
}
