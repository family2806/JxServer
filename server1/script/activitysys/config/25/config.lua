Include("\\script\\activitysys\\config\\25\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
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
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Click ����Ԫ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ԫ��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���ܿ����ҵ��",3} },
		{"AddDialogOpt",	{"��Ԫ�����ҵ�",21} },
		{"AddDialogOpt",	{"��Ԫ�������ҵ�",22} },
		{"AddDialogOpt",	{"��Ԫ��ͭ���ҵ�g",23} },
		{"AddDialogOpt",	{"ʹ��Ԫ�������ͽ𴸻�ý��������ﵽ200��",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ ʹ]] or [[������ֹͣ]/>"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "���ܿ����ҵ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��2010��12��21��0h��2011��1��10��24h�� ������������Ԫ��ͭ����Ԫ��������Ԫ���𴸵�'Ԫ��'���ҵ����㽫������⾪ϲ�������������Ԫ��������Ԫ��ͭ���ҵ���������Ҫ����Ҫ�Ĵ��⣬����Ҫ����������������<enter>1����Ҫ��3����ӣ�3�������Ҫ�����꾩�����������ٰ���ٴ���ȡ���������<enter>2��3�������Ҫ����ɫ��ͬ�����β�ͬ���������<enter> ��Ԫ��������Ҫ�κ����������У�Ԫ��ͭ����������ٴ���ȡ��Ԫ�����������ڲμ�ϵͳ��Ϸ����ȡ��Ԫ���𴸿������������ȡ��"},
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
	szName = "��Ԫ�����ҵ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"�˴λʹ�õ�Ԫ�������ͽ����Ϊ200��","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("û��color=yellow>%s<color> �����ҵ�","Ԫ����")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("ʹ�ý��� %s �ҵ�","Ԫ����")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("ʹ�ý��� %s �ҵ�","Ԫ����"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "��Ԫ�������ҵ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"�˴λʹ�õ�Ԫ�������ͽ����Ϊ200��","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("û��color=yellow>%s<color> �����ҵ�","Ԫ������")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("ʹ�ý��� %s �ҵ�","Ԫ������")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("ʹ�ý��� %s �ҵ�","Ԫ������")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "��Ԫ��ͭ���ҵ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"Ԫ��ͭ��ÿ�����ֻ����5��","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("û��color=yellow>%s<color> �����ҵ�","Ԫ��ͭ��")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("ʹ�ý���%s �ҵ�","Ԫ��ͭ��")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("ʹ�ý���%s �ҵ�","Ԫ��ͭ��")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "ʹ��Ԫ�������ͽ𴸻�ȡ�����Ѵ�200��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"����û��ʹ�ù�200��Ԫ�������ͽ𴸣���������Ŷ",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"�����콱��","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"ʹ��Ԫ�������ͽ𴸻�ȡ�����Ѵ�200�� "} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("���ؽ����ﵽ%d ��",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("���ؽ����ﵽ%d ��",17)} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("�߼��ν���ֽ����ﵽ%d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("�߼��ν���ֽ����ﵽ%d",3000)} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
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
		{"AddDialogOpt",	{"�����ҵ��",25} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
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
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},10,"100"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "ɱ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s ����","ɱ������")} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "��ȡ�Ի͹�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s ����","�Ի͹�")} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "����Boss����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},15,"100"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "��ȡԪ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("�������Ѿ���������ȡ %s��","Ԫ������"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"����������ȡ"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("���ؽ����ﵽ%d��",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("���ؽ����ﵽ%d��",28)} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����ҵ��",24} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "nil",
	szName = "��ȡ�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("����������������ȡ%s��","Ԫ���������"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"����ٴ���ȡ"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "nil",
	szName = "��ȡԪ��ͭ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("����������������ȡ%s ��","Ԫ��ͭ��"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"����ٴ���ȡ"} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "���� sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddYuanDanDialogNpc",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "�Ƿ�ʹ�ý�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("��ȷ������<color=yellow>%s<color> ��","Ԫ����")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ȷ��",4} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "�Ƿ�ʹ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("��ȷ��ʹ��<color=yellow>%s<color> ��","Ԫ������")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ȷ��",5} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "�Ƿ�ʹ��ͭ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("��ȷ����ʹ�� <color=yellow>%s<color> ��?","Ԫ��ͭ��")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ȷ��",6} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "��ٶԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ӭ�μӿ����ҵ��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ȡ�������",18} },
		{"AddDialogOpt",	{"��ȡԪ��ͭ��",19} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "�����ó��϶Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ӭ�μӿ����ҵ��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ȡԪ������",15} },
	},
}
