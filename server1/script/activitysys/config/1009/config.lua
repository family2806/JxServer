Include("\\script\\activitysys\\config\\1009\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "���ս�����ͼ",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{ITEM_COMMAND_PIECE_2,1,"20"} },
		{"ThisActivity:DropItemRandom",	{nil} },
	},
}

tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����ս����",3} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"ս����1",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"����",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COMMAND_PIECE_1,1,EVENT_LOG_TITLE,"����ս����1"} },
	},
}
tbConfig[4] = --���Ƶƹ�Ů�ĶԻ�
{
	nId = 4,
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
		{"AddDialogOpt",	{"���뻻��ƽñ",5} },		
		{"AddDialogOpt",	{"���뻻����ñ",6} },		
		{"AddDialogOpt",	{"����һ�����ñ",7} },		
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "�һ���ƽñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ƽñ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"AddOneMaterial",	{"ս����1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"ս����2",ITEM_COMMAND_PIECE_2,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_PEACE,1,EVENT_LOG_TITLE,"����ƽñ"} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "�һ�����ñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����ñ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�����Ŷ",">="} },
		{"AddOneMaterial",	{"ս���� 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"ս����2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"ף��սʤ�Ĵ���",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EAR_HAT_DIRT,1,EVENT_LOG_TITLE,"��ȡ����ñ"} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "��ȡ����ñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����ñ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ����㣬�´�����Ŷ",">="} },
		{"AddOneMaterial",	{"ս����1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"ս����2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"ף��սʤ�Ĵ���",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_FREEDOM,1,EVENT_LOG_TITLE,"������ñ"} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "ʹ�÷���ñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30197,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڳ��к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "ÿ��ֻ��ʹ��2000�θ���Ʒ.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"ʹ�÷���ñ"} },
		{"ThisActivity:UseHatDirt",	{nil} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "ʹ������ñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30199,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڳ��к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "ÿ��ֻ��ʹ��2000�θ���Ʒ.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"ʹ������ñ"} },
		{"ThisActivity:UseHatFreedom",	{nil} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "ʹ�ú�ƽñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30198,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڳ��к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1000, "ÿ��ֻ��ʹ��1000�θ���Ʒ.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"ʹ�ú�ƽñ"} },
		--{"ThisActivity:UseHatPeace",	{nil} },
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1}},
	},
}
