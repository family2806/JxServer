Include("\\script\\activitysys\\config\\1002\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = --�ν�2000��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�2000��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_ѩ����\t�ν�2000"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "����17��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_ѩ����\t����17��"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "����28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_ѩ����\t����28"} },
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "��ɷ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_ѩ����\t��ɷ����"} },
	},
}
tbConfig[6] = --ɱ��boss
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "90��ɱ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},3,"Event_ѩ����\t����ɱ��BOSS"} },
	},
}
tbConfig[7] = --�ν�1000��
{
	nId = 7,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�1000��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		--{"PlayerFunLib:CheckTaskDaily",	{nTSK_DAILY_TK_��_��_ʯ,4,"","<"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{nTSK_DAILY_TK_��_��_ʯ,4} },
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},4,"Event_ѩ����\t�ν���ȡ��ʯ"} },
	},
}
tbConfig[8] = --ʹ��ѩ��ʯ���
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "ʹ��ѩ��ʯ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30120,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_DAILY_SU_DUNG_BANG_THACH_LE_HOP,15,"������ʹ��15��ѩ��ʯ��У��������ʹ��Ŷ.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_DAILY_SU_DUNG_BANG_THACH_LE_HOP,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime},10,"Event_NgoiSaoTuyet\tSuDungTuyetBangThachLeHop"} },
		{"ThisActivity:UseFreezingStoneBoxLog", {nil}},
	},
}
----add�Ի�npc
tbConfig[9] = --����ʦ�Ի�
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "����쾫����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�쾫����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"���ã�����Ҫ������ѩ������?"} },
		{"AddDialogOpt",	{"����ѩ����1��", 11} },
		{"AddDialogOpt",	{"����ѩ����2��", 12} },
		{"AddDialogOpt",	{"����ѩ����3��", 13} },
		{"AddDialogOpt",	{"����ѩ����4��", 14} },
		{"AddDialogOpt",	{"����ѩ����5��", 15} },
		{"AddDialogOpt",	{"����ѩ����6��", 16} },
		{"AddDialogOpt",	{"����ѩ����7��", 17} },
		{"AddDialogOpt",	{"����ѩ����8��", 18} },
		{"AddDialogOpt",	{"����ѩ����9��", 19} },
		{"AddDialogOpt",	{"����ѩ����10��", 20} },
		{"AddDialogOpt",	{"����ѩ����11��", 21} },
		{"AddDialogOpt",	{"����ѩ����12��", 22} },	
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "����ѩ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ѡ��ȼ�"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
--		{"AddDialogOpt",	{"ѩ����1��", 11} },
--		{"AddDialogOpt",	{"ѩ����2��", 12} },
--		{"AddDialogOpt",	{"ѩ����3��", 13} },
--		{"AddDialogOpt",	{"ѩ����4��", 14} },
--		{"AddDialogOpt",	{"ѩ����5��", 15} },
--		{"AddDialogOpt",	{"ѩ����6��", 16} },
--		{"AddDialogOpt",	{"ѩ����7��", 17} },
--		{"AddDialogOpt",	{"ѩ����8��", 18} },
--		{"AddDialogOpt",	{"ѩ����9��", 19} },
--		{"AddDialogOpt",	{"ѩ����10��", 20} },
--		{"AddDialogOpt",	{"ѩ����11��", 21} },
--		{"AddDialogOpt",	{"ѩ����12��", 22} },
	},
}
----�ϳ�ԭ��
tbConfig[11] = --�ϳ�1������
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "�ϳ�1������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[1��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[0]��",{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{1} },
	},
}
tbConfig[12] = --�ϳ�2������
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "�ϳ�2������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[2��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[1]��",{tbProp={6,1,30118,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{2} },
	},
}
tbConfig[13] = --�ϳ�3������
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "�ϳ�3������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[3]��",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[2]��",{tbProp={6,1,30118,2,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{3} },
	},
}
tbConfig[14] = --�ϳ�4������
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "�ϳ�4������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[4��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[3]��",{tbProp={6,1,30118,3,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{4} },
	},
}
tbConfig[15] = --�ϳ�5������
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "�ϳ�5������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[5��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[4]��",{tbProp={6,1,30118,4,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{5} },
	},
}
tbConfig[16] = --�ϳ�6������
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "�ϳ�6������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[6��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[5]��",{tbProp={6,1,30118,5,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{6} },
	},
}
tbConfig[17] = --�ϳ�7������
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "�ϳ�7������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[7��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[6]��",{tbProp={6,1,30118,6,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{7} },
	},
}
tbConfig[18] = --�ϳ�8������
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "�ϳ�8������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[8��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[7]��",{tbProp={6,1,30118,7,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{8} },
	},
}
tbConfig[19] = --�ϳ�9������
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "�ϳ�9������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[9��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[8]��",{tbProp={6,1,30118,8,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{9} },
	},
}
tbConfig[20] = --�ϳ�10������
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "�ϳ�10������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[10��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[9]��",{tbProp={6,1,30118,9,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{10} },
	},
}
tbConfig[21] = --�ϳ�11������
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "�ϳ�11������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[11��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[10]��",{tbProp={6,1,30118,10,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{11} },
	},
}
tbConfig[22] = --�ϳ�12������
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "�ϳ�12������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[12��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[11]��",{tbProp={6,1,30118,11,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"ѩ��ʯ",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{12} },
	},
}

tbConfig[23] = --Сͯ�ӶԻ�
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "���Сͯ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Сͯ��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"���ã�������Ҫʲô?"} },
		{"AddDialogOpt",	{"��ѩ����[1��]",24} },	
		{"AddDialogOpt",	{"��ѩ����[2��]",25} },	
		{"AddDialogOpt",	{"��ѩ����[3��]",26} },	
		{"AddDialogOpt",	{"��ѩ����[4��]",27} },	
		{"AddDialogOpt",	{"��ѩ����[5��]",28} },	
		{"AddDialogOpt",	{"��ѩ����[6��]",29} },	
		{"AddDialogOpt",	{"��ѩ����[7��]",30} },	
		{"AddDialogOpt",	{"��ѩ����[8��]",31} },	
		{"AddDialogOpt",	{"��ѩ����[9��]",32} },	
		{"AddDialogOpt",	{"��ѩ����[10��]",33} },	
		{"AddDialogOpt",	{"��ѩ����[11��]",34} },	
		{"AddDialogOpt",	{"��ѩ����[12��]",35} },	
	},
}
tbConfig[24] = --��ѩ����1��
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "������ 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[1��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[1]��",{tbProp={6,1,30118,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{1} },
	},
}
tbConfig[25] = --��ѩ����2��
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "������ 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[2��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[2]��",{tbProp={6,1,30118,2,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{2} },
	},
}
tbConfig[26] = --��ѩ����3��
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "������3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[3��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[3]��",{tbProp={6,1,30118,3,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{3} },
	},
}
tbConfig[27] = --��ѩ����4��
{
	nId = 27,
	szMessageType = "CreateCompose",
	szName = "������4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[4��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[4]��",{tbProp={6,1,30118,4,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{4} },
	},
}
tbConfig[28] = --��ѩ����5��
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "������5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[5��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[5]��",{tbProp={6,1,30118,5,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{5} },
	},
}
tbConfig[29] = --��ѩ����6��
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "������6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[6��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[6]��",{tbProp={6,1,30118,6,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{6} },
	},
}
tbConfig[30] = --��ѩ����7��
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "������7",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[7��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[7]��",{tbProp={6,1,30118,7,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{7} },
	},
}
tbConfig[31] = --��ѩ����8��
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "������8",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[8��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[8]��",{tbProp={6,1,30118,8,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{8} },
	},
}
tbConfig[32] = --��ѩ����9��
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "������9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[ 9��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[9]��",{tbProp={6,1,30118,9,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{9} },
	},
}
tbConfig[33] = --��ѩ����10��
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "������10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[10��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[10]��",{tbProp={6,1,30118,10,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{10} },
	},
}
tbConfig[34] = --��ѩ����11��
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "������ 11",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[ 11��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[11]��",{tbProp={6,1,30118,11,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{11} },
	},
}
tbConfig[35] = --��ѩ����12��
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "������12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ѩ����[12��]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ѩ����[12]��",{tbProp={6,1,30118,12,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{12} },
	},
}
tbConfig[36] = --ʹ��ľ��
{
	nId = 36,
	szMessageType = "ItemScript",
	szName = "ʹ��ľ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30121,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWoodenChest", {nil}},
	},
}