Include("\\script\\activitysys\\config\\40\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"321,322,227,340"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonsterAward",	{nil} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,30,EVENT_LOG_TITLE,"�ν�3000"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 1000 and < 3000",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"�ν�1000"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"����17"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"����28"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_boatboss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"����ˮ��ͷ��"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_bigboatboss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,20,EVENT_LOG_TITLE,"����ˮ����ͷ��"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,15,EVENT_LOG_TITLE,"�׵۴���10"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "kill_gold_boss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,30,EVENT_LOG_TITLE,"��������BOSS"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "kill_killer_boss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,3,EVENT_LOG_TITLE,"����ɱ��BOSS"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc named master hechenghua",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"�ϳɻ�����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳ���ɫõ��",13} },
		{"AddDialogOpt",	{"�ϳ���ɫõ��",14} },
		{"AddDialogOpt",	{"�ϳ�����õ����",15} },
		{"AddDialogOpt",	{"���̲�",20} },
		{"AddDialogOpt",	{"�����콱",21} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "compose 3 color rose total",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"����",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����1",16} },
		{"AddDialogOpt",	{"����2",17} },
		{"AddDialogOpt",	{"����3",18} },
		{"AddDialogOpt",	{"����4",19} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "compose 4 color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"��ɫõ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��õ��",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"�̲�",ITEM_GRASS,1} },
		{"AddOneMaterial",	{"����",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4COLOR_ROSE,1,EVENT_LOG_TITLE,"GhepBoHongTuSac"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "compose corbeil",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"����õ����",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��õ��",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"�̲�",ITEM_GRASS,2} },
		{"AddOneMaterial",	{"����",ITEM_BASKET,1} },
		{"AddOneMaterial",	{"����",ITEM_RIBAND,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CORBEIL,1,EVENT_LOG_TITLE,"�ϳ�����õ����"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 1",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"��ɫõ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��õ��",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"����",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 2",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"��ɫõ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��õ��",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"����",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 3",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"��ɫõ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��õ��",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"����",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 4",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"��ɫõ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��õ��",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"��õ��",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"����",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "nil",
	szName = "compose grass total",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeGrass",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckLevel",	{120,"default",">"} },
		{"PlayerFunLib:CheckIsTransLife",	{"����һ�����ϲ����콱"} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LUCK_BELT,MAX_DAILY_LUCK_BELT,"�����㲻�������ˣ�����������.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "use item named 3color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_3COLOR_ROSE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:CheckTask",	{TSK_3COLOR_ROSE,MAX_3COLOR_ROSE,"�Ѵﵽ���ޣ����ܼ���ʹ����","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:Use3ColorRose",	{nil} },
		{"ThisActivity:AddTask",	{TSK_3COLOR_ROSE,1} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "use item named 4color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_4COLOR_ROSE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:CheckTask",	{TSK_4COLOR_ROSE,MAX_4COLOR_ROSE,"�Ѵ����ޣ����ܼ���ʹ����","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:Use4ColorRose",	{nil} },
		{"ThisActivity:AddTask",	{TSK_4COLOR_ROSE,1} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "use item named corbeil",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_CORBEIL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{TSK_CORBEIL,MAX_CORBEIL,"�Ѵ����ޣ����ܼ���ʹ����","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseCorbeil",	{nil} },
		{"ThisActivity:AddTask",	{TSK_CORBEIL,1} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "use item named luck belt",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_LUCY_BELT},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseLucyBelt",	{nil} },
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "use item named meiguixiangdai",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_MEIGUIXIANGDAI},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseMeiGuiXiangDai",	{nil} },
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"�̷�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����",29} },
	},
}
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "buy basket",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"����",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"����",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BASKET,1,EVENT_LOG_TITLE,"buy_basket"} },
	},
}
