Include("\\script\\activitysys\\config\\4\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "KillMonster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonster",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "SongJin1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"�ν�1000"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "SongJin3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"�ν�3000"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"��������17"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"��������28"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_Boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"����ˮ��ͷ��"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_BigBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,20,EVENT_LOG_TITLE,"����ˮ��ͷ��"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,15,EVENT_LOG_TITLE,"�׵۴���6"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "GoldenBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"��������Boss"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "KillerBoss",
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
		{"PlayerFunLib:GetItem",	{ITEM_WATER,3,EVENT_LOG_TITLE,"����ɱ��Boss"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_QiuYun",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���ܻ",23} },
		{"AddDialogOpt",	{"�ϳɺ컨��",12} },
		{"AddDialogOpt",	{"�ϳɰ׻���",13} },
		{"AddDialogOpt",	{"�ϳ��ϻ���",14} },
		{"SetDialogTitle",	{"<npc>3/5/2012 �� 24:00/31/52012,  ��λ�������Ե��ҵĵط�ʹ�����ӣ�����ҩ����ˮƿ����ɫ��Ʒ���ϳɸ��ֻ�������ȡ��Ʒ."} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "nil",
	szName = "ComposeRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Red"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "ComposeWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"White"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "ComposePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Purple"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "UseRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3161,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CheckTask",	{TSK_RED_FLOWER_COUNT,N_MAX_RED_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedFlower",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "UseWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3163,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CanUseWhiteFlower",	{nil} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWhiteFlower",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "UsePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3162,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ������ʣһ����λ"} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UsePurpleFlower",	{nil} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"����",1907,{{11,3182,4951}}} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_LingFan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�̵�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������ҩ��",20} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Buy_NongYao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����ҩ��",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ������ʣһ����λ"} },
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=10000},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3158,1,0,0},nExpiredTime=20120601,},1,EVENT_LOG_TITLE,"BuyNongyao"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "UseSeedBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3164,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"װ����λ���㣬���ź�����ʣ������λ"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3157,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseSeedBox"} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "UseWaterBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3165,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"װ����λ���㣬���ź�����ʣ������λ"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3159,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseWaterBox"} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>���ӿ�����Ī�߿ߡ�����ɽ�ϡ�����ɽ����ɳĮ1��ɳĮ2��ɳĮ3�����Ƕ��ҵ�������ҩ���������̵����ҵ���ˮƿ����ͨ���μ��ν𡢴��ء�����ȡ��׵ۡ��ƽ�Boss��ɱ��Boss����ɫ��Ʒ������󣬴����������ļ���Ʒ�����Ե��ҵĵط��ϳɸ�����ɫ��������ȡ�ḻ�Ľ�Ʒ��",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
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
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
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
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
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
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
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
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
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
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
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
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
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
tbConfig[31] = --һ��ϸ��
{
	nId = 31,
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
tbConfig[32] = --һ��ϸ��
{
	nId = 32,
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
