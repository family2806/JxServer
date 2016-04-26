Include("\\script\\activitysys\\config\\33\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "��������������npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "�ν�÷ִ���1000С��3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_Խ�Ϲ���","�ν�1000������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�ν�1000", "10 ����", 1}},
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�ν�÷ִ���3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_Խ�Ϲ���","�ν�3000������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�ν�3000", "30 ����", 1}},
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "���ع���17��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_Խ�Ϲ���","����17������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����17", "10 ����", 1}},
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "���ع���28��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_Խ�Ϲ���","����28������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����28", "15 ����", 1}},
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "�����ɱ��ˮ��ͷ��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_Խ�Ϲ���","����ˮ��ͷ��������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����ˮ��ͷ��", "10 ����", 1}},
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "�����ɱ��ˮ����ͷ��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_Խ�Ϲ���","����ˮ����ͷ��������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����ˮ����ͷ��", "20 ����", 1}},
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴�����ʮ��",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_Խ�Ϲ���","�׵۴���10������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�׵۴���10", "20 ����", 1}},
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "ɱ������",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},2,"Event_Խ�Ϲ���","����ɱ��BOSS"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����ɱ��BOSS", "2 ����", 1}},
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "ɱ���ƽ�BOSS",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_Խ�Ϲ���","��������BOSS"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "��������BOSS", "30 ����", 1}},
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "�ڶ��׶��ν����1000С��3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_Խ�Ϲ���","�ν�1000������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_Խ�Ϲ���","�ν�1000�������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�ν�1000", "10���Ӻ�4������", 1}},
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "�ڶ��׶��ν�÷ִ���3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_Խ�Ϲ���","�ν�3000������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},8,"Event_Խ�Ϲ���","�ν�3000�������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�ν�3000", "30 ���Ӻ�8������", 1}},
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "�ڶ��׶δ��ع���17��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_Խ�Ϲ���","����17������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_Խ�Ϲ���","����17�������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����17", "10���Ӻ�2 ������", 1}},
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "�ڶ��׶δ��ع���28��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_Խ�Ϲ���","����28������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_Խ�Ϲ���","����28�������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����28", "15 ���Ӻ�4 ������", 1}},
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "�ڶ��׶η����ɱ��ˮ��ͷ��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_Խ�Ϲ���","����ˮ��ͷ��������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_Խ�Ϲ���","����ˮ��ͷ���������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����ˮ��ͷ��", "10 ���Ӻ�2������", 1}},
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "�ڶ��׶η����ɱ��ˮ����ͷ��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_Խ�Ϲ���","����ˮ����ͷ��������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_Խ�Ϲ���","����ˮ����ͷ���������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "����ˮ����ͷ��", "20 ���Ӻ�4������", 1}},
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "YDBZguoguan",
	szName = "�ڶ��׶��׵۴�����ʮ��",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_Խ�Ϲ���","�׵۴���10������"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},5,"Event_Խ�Ϲ���","�׵۴���10�������"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�׵۴���10", "20 ���Ӻ�5 ������", 1}},
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ClickNpc",
	szName = "����̨�Ի�",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"����̨"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������",19} },
		{"AddDialogOpt",	{"��ȡ�����̻�",20} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "������",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"������",1,0,0,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,2976,1,0,0},},1} },
		{"ThisActivity:CheckTask",	{TKSG_HandinStringCount,"1000-<ComposeCount>","ÿ���������ֻ��1000����Ʒ[����] ��������ڼ�","<="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandinString",	{nil} },
		{"ThisActivity:AddTask",	{TKSG_HandinStringCount,1} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "��ȡ�����̻�",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"�����̻�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,2976,1,0,0},},1} },
		{"AddOneMaterial",	{"��ɫ���",{tbProp={6,1,2977,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_ConvertFireworksCount,1} },
		{"ThisActivity:ConvertFireworks",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2979,1,0,0},nExpiredTime=20111001,},1,"Event_Խ�Ϲ���","�ϳɹ����̻�"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�ϳɹ����̻�", "�����̻�", 1}},
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "���϶�Ի�",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"�϶�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����������",22} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "�����������",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"���������",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"��ɫ����",{tbProp={6,1,2981,1,0,0},},1} },
		{"AddOneMaterial",	{"�¹����",{tbProp={6,1,2978,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_ConvertMooncakeCount,1} },
		{"ThisActivity:ConvertMooncake",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2980,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","DoiBanhTrungThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "�������±�", "���������±�", 1}},
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "ʹ�ù����̻�",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2979,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´������ɣ�",">="} },
		{"ThisActivity:CheckTask",	{TKSG_UseFireworksCount,1500,"ÿ���������ֻʹ��1500����Ʒ [�����̻�] ��������ڼ�","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"װ������Ҫʣ3����λ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_UseFireworksCount,1} },
		{"ThisActivity:UseFirworks",	{nil} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "ʹ�ú��������±�",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2980,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�������",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_UseMooncakeCount,15,"ÿ���������ֻʹ��15����Ʒ [���������±�] ��������ڼ�","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"װ������Ҫʣ3����λ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_UseMooncakeCount,1} },
		{"ThisActivity:UseMooncake",	{nil} },
	},
}
