Include("\\script\\activitysys\\config\\1000\\variables.lua")
tbConfig = {}
tbConfig[1] = --�ν�1000��
{
	nId = 1,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_MungPBM\t�ν�1000"} },
	},
}
tbConfig[2] = --�ν�3000��
{
	nId = 2,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_MungPBM\t�ν�3000"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "����17�� ��һ�׶�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t����17"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "����28��1�׶�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t����28"} },
	},
}
tbConfig[5] = --ˮ��ͷ��
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "ɱ��1ˮ��ͷ��",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t����ˮ��ͷ��"} },
	},
}
tbConfig[6] = --ˮ����ͷ��
{
	nId = 6,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_MungPBM\t����ˮ����ͷ��"} },
	},
}
tbConfig[7] = --Vi�m ��
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "�����׵۵�10��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_MungPBM\t�����׵۵�10��"} },
	},
}
tbConfig[8] = --����boss
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "��������BOSS",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},50,"Event_MungPBM\t��������BOSS"} },
	},
}
tbConfig[9] = --ɱ��BOSS
{
	nId = 9,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30112,1,0,0},nExpiredTime=nItemExpiredTime,},2,"Event_MungPBM\t����ɱ��boss"} },
	},
}
--Giai �o�n 2
tbConfig[10] = --�ν�1000��
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�1000��",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_MungPBM\t�ν�1000"} },
	},
}
tbConfig[11] = --�ν�3000 ��
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�3000��",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t�ν�3000"} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "����17��2�׶�",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_MungPBM\t����17"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "����28�ڶ�2�׶�",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_MungPBM\t����28"} },
	},
}
tbConfig[14] = --ˮ��ͷ��
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "ɱ��1ˮ��ͷ��",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},3,"Event_MungPBM\t����ˮ��ͷ��"} },
	},
}
tbConfig[15] = --ˮ����ͷ��
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "����ˮ����ͷ��",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t����ˮ����ͷ��"} },
	},
}
tbConfig[16] = --�׵ۮ�
{
	nId = 16,
	szMessageType = "YDBZguoguan",
	szName = "�����׵۵�10��",
	nStartDate = nPhase2StartDate,
	nEndDate  = nPhase2EndDate,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30113,1,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_MungPBM\t�����׵۵�10��"} },
	},
}
--add �Ի�npc
tbConfig[17] = --�Ƶƹ�Ů�Ի�
{
	nId = 17,
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
		{"AddDialogOpt",	{"��ӭ�°�Ļ",18} },		
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "���ƵƵĶԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��������������һ��������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳ�ԭ��", 23} },
		{"AddDialogOpt",	{"�ͻ����Ƶƹ�Ů", 26} },
		{"AddDialogOpt",	{"��ȡ�μ������ܽ���", 19} },
	},
}
tbConfig[19] =
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "���ƵƶԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�ڱ��ܣ��뾭���μ��ν𡢴��ء��׵����ܣ�Ȼ����������ȡ����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���μӱ������ܵĴ���",29} },
		{"AddDialogOpt",	{"��ȡ�μ�15���ν�Ľ���",20} },
		{"AddDialogOpt",	{"��ȡ�μ�15�δ��صĽ���",21} },
		{"AddDialogOpt",	{"��ȡ�μ�ʮ���׵۵Ľ���",22} },
	},
}
--ÿ�����ܽ���
tbConfig[20] = --�ν���
{
	nId = 20,
	szMessageType = "nil",
	szName = "��ȡ���15���ν�2000�㽱��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, 15, ">=", "�㻹δ�μӹ�15���ν���Ҫ����Ŭ��"}},
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_TONGKIM_WEEKLY_AWARD, 0, "<=", "�������콱�ˣ�Ҫ�����μӸ������ܣ����������콱Ŷ."}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTaskCount", {nTSK_TONGKIM_WEEKLY_AWARD, 1},},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},10,"Event_MungPBM\t�����ν���"} },
	},
}
tbConfig[21] = --�ܴ���
{
	nId = 21,
	szMessageType = "nil",
	szName = "��ȡ���15�δ��ؽ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 15, ">=", "�㻹δ���15�δ��أ����������콱Ŷ"}},
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VUOTAI_WEEKLY_AWARD, 0, "<=", "������ȡ���ܽ����ˣ���������Ŷ"}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTaskCount", {nTSK_VUOTAI_WEEKLY_AWARD, 1},},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},10,"Event_MungPBM\t���ܴ��ؽ���"} },
	},
}
tbConfig[22] = --�׵�
{
	nId = 22,
	szMessageType = "nil",
	szName = "��ȡ���10���׵۴��ؽ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 10, ">=", "����콱������������Ҫ����Ŭ��Ŷ"}},
		{"ThisActivity:VngCheckWeeklyTaskCount", {nTSK_VIEMDE_WEEKLY_AWARD, 0, "<=", "ÿ��ֻ�ܻһ�θý�����Ŭ����ȡ���ܵĽ���Ŷ"}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTaskCount", {nTSK_VIEMDE_WEEKLY_AWARD, 1},},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},10,"Event_MungPBM\t�����׵۴��ؽ���"} },
	},
}
--�ϳ�ԭ��
tbConfig[23] =
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "���ƵƶԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�ϳ�ԭ��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳɺ�«ƿ",24} },
		{"AddDialogOpt",	{"�ϳ����ľ�",25} },
	},
}
tbConfig[24] = --����«ƿ
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "����«ƿ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��«ƿ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"AddOneMaterial",	{"�ƾջ�",{tbProp={6,1,30112,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"�Ͼջ�",{tbProp={6,1,30114,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30115,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_MungPBM\t�ϳɺ�«ƿ"} },
	},
}
tbConfig[25] = --�����ľ�
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "�����ľ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>���ľ�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"AddOneMaterial",	{"�ƾջ�",{tbProp={6,1,30112,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"�׾ջ�",{tbProp={6,1,30113,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"�Ͼջ�",{tbProp={6,1,30114,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30116,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_MungPBM\t�ϳ����ľ�"} },
	},
}
tbConfig[26] = --�ͻƾջ�
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "���ƾջ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�ͻƾջ�",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"ThisActivity:VngGiveDaisyLimit", {nil}},
		{"AddOneMaterial",	{"�ƾջ�",{tbProp={6,1,30112,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:VngGiveDaisy", {nil}},
	},
}
tbConfig[27] = --ʹ�ú�«ƿ
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "ʹ�ú�«ƿ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30115,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����������ʹ����Ʒ",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngGourdUseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:VngUseGourd", {nil}},
	},
}
tbConfig[28] = --ʹ�����ľ�
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "ʹ�����ľ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30116,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����������ʹ����Ʒ",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_GOURD_USE_DAYLIMIT,10,"������ʹ��10ƿ���ľƣ��������ʹ��.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_GOURD_USE_DAYLIMIT,1} },
		{"ThisActivity:VngUseSteelHeartWine", {nil}},
	},
}
tbConfig[29] = --���μ����ܴ���
{
	nId = 29,
	szMessageType = "nil",
	szName = "���μӱ������ܴ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },		
	},
	tbActition = 
	{
		{"ThisActivity:VngCheckWeeklyFeatureMatchCount", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, nTSK_VUOTAI_WEEKLY_MATCH_COUNT, nTSK_VIEMDE_WEEKLY_MATCH_COUNT},},		
	},
}