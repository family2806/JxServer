Include("\\script\\activitysys\\config\\22\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "�����ʦ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ʦ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����ʦ�",2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "����ʦ�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��һ���˪��ѩ����һ���������㣬��֪�ҵĵ������߽��������?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���ܱ����ʦ�",3} },
		{"AddDialogOpt",	{"����ʦ�öſ���",4} },
		{"AddDialogOpt",	{"������ɫ���",23} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "���ܱ����ʦ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʱ���18/11/2010 �� 13/12/2010 Ϊ�����ʦ�ʱ�䣬���¿��Կ�������ҳ�Ĳμӷ���"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "����ʦ�öſ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2572,-1,-1,-1},},nDukangjiuCount,"װ��û�жſ���"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddDukangjiuAward",	{TSK_DuKangJiu,TSK_Date_DuKangJiu,nDukangjiuCount} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
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
		{"AddDialogOpt",	{"�����ʦ�",6} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "����Ƶƹ�Ů",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������Ҫһ�����������裬˿����ɫ�ߣ���ҩ���Һܼ�����Щ��Ʒ��������͸�����Щ��Ʒ���ҽ��͸��㽱����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���ܱ����ʦ�",3} },
		{"AddDialogOpt",	{"��ȡ��˿���",7} },
		{"AddDialogOpt",	{"��ȡ��ɫ���",8} },
		{"AddDialogOpt",	{"��ȡ��ҩ���",9} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "��ȡ��˿���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��˿���",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����������",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"��˿",{tbProp={6,1,2574,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2577,1,0,0},nExpiredTime=20101220,},1,"���ò�˿���"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "��ȡ��ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ɫ���",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����������",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"��ɫ��",{tbProp={6,1,2575,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2578,1,0,0},nExpiredTime=20101220,},1,"��һ����ɫ���"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "��ȡ��ҩ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ҩ���",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����������",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"��ҩ",{tbProp={6,1,2576,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2579,1,0,0},nExpiredTime=20101220,},1,"��һ����ҩ���"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "�ν�500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",500,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"��ʦ�ڻ_�ν�"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "�ν�3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"��ʦ�_�ν�"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},15,"100"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"��ʦ�_����"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "�������ó��϶Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang,"���첻�ܶ�����","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ������ط���������Ҫһ��1*1��λ"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},1,"��ʦ�ڻ_������"} },
		{"ThisActivity:AddTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "90��ɱ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"��ʦ�ڻ_90��ɱ��"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "���̯��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"̯��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��˿��",17} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "��˿��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��˿",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2574,1,0,0},nExpiredTime=20101213,},1,"��ʦ�ڻ_̯��"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "ʹ�öſ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2580,-1,-1,-1},nExpiredTime=20101213,}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ������ط���������Ҫһ��1*1��λ"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"��ʦ�ڻ_ʹ�öſ������"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "ʹ�ò�˿���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2577,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_SiChouXiangBao,nSCXiangBaoUpExp,"ʹ�ò�˿����ﵽ������ޣ�������ʹ����.","<"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"�����Ѵ�ʹ�ø���Ʒ����","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddSichouxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "ʹ����ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2578,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,3,1,"װ������ط���������Ҫ2*3����λ"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"�����Ѵﵽʹ�ø���Ʒ����","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddWucaixiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "ʹ����ҩ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2579,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,5,1,"װ������ط���������Ҫ2*5����λ"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"�����Ѵﵽʹ�ø���Ʒ����","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddZhongyaoxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ClickNpc",
	szName = "��������ó���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����ó���"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ȡ�ſ���",14} },
	},
}

tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "nil",
	szName = "������ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2578,-1,-1,-1},},1,"װ��û����ɫ���"} },
	},
	tbActition = 
	{
		{"ThisActivity:Give5SHB",	{nEXP_Give_NSHB, TSK_Date_Give_NSHB} },
	},
}