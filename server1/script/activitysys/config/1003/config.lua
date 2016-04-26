Include("\\script\\activitysys\\config\\1003\\variables.lua")
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
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "��ֵ�ԭ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,30131,1,0,0},nExpiredTime=nItemExpiredTime,},1,"5"} },
	},
}
tbConfig[3] = --�ν�1000��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�1000��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"������Т�\t�ν�1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ν�1000", "20 ���õ��", 1}},
	},
}
tbConfig[4] = --�ν�3000��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�3000��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},40,"������Т�\t�ν�3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ν�3000", "40 ���õ��", 1}},
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "����17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},15,"������Т�\t����17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����17", "15 ���õ��", 1}},
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "����28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},25,"������Т�\t����28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����28", "25 ���õ��", 1}},
	},
}
tbConfig[7] = --ˮ��ͷ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "����ˮ��ͷ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},10,"������Т�\t����ˮ��ͷ��"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ˮ��ͷ��", "10���õ��", 1}},
	},
}
tbConfig[8] = --ˮ����ͷ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "����ˮ����ͷ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"������Т�\t����ˮ����ͷ��"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ˮ����ͷ��", "20 ���õ��", 1}},
	},
}
tbConfig[9] = --�׵ۮ�
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴���10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},30,"������Т�\t�׵۴���10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�׵۴���10", "30���õ��", 1}},
	},
}
tbConfig[10] = --����boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "��������boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},50,"������Т�\t��������boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "��������boss", "50���õ��", 1}},
	},
}
tbConfig[11] = --ɱ��boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "90��ɱ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},5,"������Т�\t����ɱ��boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ɱ��boss", "5 ���õ��", 1}},
	},
}
----add �Ի�npc
tbConfig[12] = --�Ƶƹ�Ů�Ի�
{
	nId = 12,
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
		{"AddDialogOpt",	{"���뻻��������",13} },		
	},
}
----�ϳ�ԭ��
tbConfig[13] = --����������
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "����������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��������",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"�ȼ��������´�����Ŷ",">="} },
		{"AddOneMaterial",	{"��õ��",{tbProp={6,1,30132,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRoseBud", {nil}},		
	},
}
tbConfig[14] = --�Ի�������
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "���������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳɴ�ͺ���",15} },
		{"AddDialogOpt",	{"�ͺ�õ��",16} },
		{"AddDialogOpt",	{"�;�������",18} },
	},
}
tbConfig[15] = --����ͺ���
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "����ͺ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ͺ���",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"�ȼ��������´�������",">="} },
		{"AddOneMaterial",	{"��õ��",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},5} },
		{"AddOneMaterial",	{"��������",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"������ζ",{tbProp={6,1,30129,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30130,1,0,0},nExpiredTime=nItemExpiredTime,},1,"������Т�\\t�ϳɴ�ͺ���"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ϳɴ�ͺ���", "1 ��ͺ���", 1}},
	},
}
tbConfig[16] = --��õ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "�ͺ�õ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�ͺ�õ��",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"�ȼ����㣬�´�����Ŷ",">="} },
		{"AddOneMaterial",	{"��õ��",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"ThisActivity:CheckGiveRedRoseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRose", {nil}},
	},
}
tbConfig[17] = --ʹ�ô�ͺ���
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "ʹ�ô�ͺ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30130,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"�ȼ�����������ʹ����Ʒ",">="} },
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:TTHT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_TTHT", {nil}},		
	},
}
tbConfig[18] = --�;�������
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "�;�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�;�������",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"�ȼ��������´�����Ŷ",">="} },
		{"ThisActivity:GiveCuuTienLimit", {nil}},
		{"AddOneMaterial",	{"��������",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:GiveCuuTien", {nil}},
	},
}