Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "������������",
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
tbConfig[2] =
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "�������۵�ͼ",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:DropItemRandom",	{nil} },
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
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"�ν�1000"} },		
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
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,30,EVENT_LOG_TITLE,"�ν�3000"} },		
	},
}
tbConfig[5] =		--���� 17
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"����17"} },		
	},
}
tbConfig[6] =		--���� 17
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"����28"} },		
	},
}
tbConfig[7] = --ˮ��ͷ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "����1ˮ��ͷ��",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"����ˮ��ͷ��"} },				
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,20,EVENT_LOG_TITLE,"����ˮ����ͷ��"} },				
	},
}
tbConfig[9] = --�׵ۮ� - ����10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴���6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,15,EVENT_LOG_TITLE,"�׵۴���6"} },				
	},
}
tbConfig[10] = --�ƽ�boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "����ƽ�boss",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,30,EVENT_LOG_TITLE,"����ƽ�boss"} },				
	},
}
tbConfig[11] = --ɱ��boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "90��ɱ��boss����",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,3,EVENT_LOG_TITLE,"����ɱ��boss"} },				
	},
}
--�Ի�Npc
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"�̷�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ԭ�Ϻϳ����յ���",21} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"����ԭ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"����",{nJxb=1},10000} }, --��ԭ������1����
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"������1������������ԭ�Ϻϳ����ִ������յ���"} },		
		{"PlayerFunLib:GetItem",	{ITEM_BUTTER,1,EVENT_LOG_TITLE,"����ԭ��"} },
	},
}
tbConfig[14] = --���ʦ�Ի�
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "������ʦ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���ʦ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>��������ʱ��������һЩ�����"} },		
		{"AddDialogOpt",	{"������ܱ��",15} },
		{"AddDialogOpt",	{"��ȡ�����",20} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "�����ʦ�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>������������<color=red>������ܱ��<color>, ����μ����ֻ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���뻻���",26} },		
		{"AddDialogOpt",	{"������һ��ı���ܱ�",16} },		
		{"AddDialogOpt",	{"�������ɿ�������ܱ�",17} },		
		{"AddDialogOpt",	{"������ˮ������ܱ�",18} },		
		{"AddDialogOpt",	{"���������ִ������ܱ�",19} },		
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "������һ�����ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"һ�����ܱ�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�������",">="} },
		{"AddOneMaterial",	{"���",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"��",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"ţ��",ITEM_MILK,1} },
		{"AddOneMaterial",	{"����",ITEM_BUTTER,2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_OFTEN_CAKES,1,EVENT_LOG_TITLE,"�ϳ�һ�����ܱ�"} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "�������ɿ�������ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ɿ�������ܱ�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�������",">="} },
		{"AddOneMaterial",	{"���",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"��",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"ţ��",ITEM_MILK,1} },
		{"AddOneMaterial",	{"����",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"�ɿ���",ITEM_CHOCOLATE,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CHOCOLATE_CAKES,1,EVENT_LOG_TITLE,"�ϳ��ɿ�������ܱ�"} },
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "������ˮ������ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ˮ������ܱ�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�������",">="} },
		{"AddOneMaterial",	{"���",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"��",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"ţ��",ITEM_MILK,1} },
		{"AddOneMaterial",	{"����",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"ˮ��",ITEM_FRUIT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_FRUIT_CAKES,1,EVENT_LOG_TITLE,"�ϳ�ˮ������ܱ�"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "���������ִ������ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���ִ������ܱ�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�������",">="} },
		{"AddOneMaterial",	{"���",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"��",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"ţ��",ITEM_MILK,1} },
		{"AddOneMaterial",	{"����",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"ˮ��",ITEM_FRUIT,1} },
		{"AddOneMaterial",	{"�ɿ���",ITEM_CHOCOLATE,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BIRTHDAY_CAKE,1,EVENT_LOG_TITLE,"�ϳ����ִ������ܱ�"} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "nil",
	szName = "��ȡ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ��������´�������?",">="} },
		{"ThisActivity:CheckAwardExp", {"�콱ʱ���0h00 11/06/2012��24h00 11/06/2012 "},},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_GET_EXP,0,"���Ѿ���ȡ������ˣ���������ȡ��!","=="} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_GET_EXP, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"Nhan100trExpTaiNpcThoLamBanh"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"����ԭ��",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"����",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BUTTER,1,EVENT_LOG_TITLE,"��NPC�̷���������"} },
	},
}
--S?d�ng Item
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "ʹ��һ�����ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30210,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		--{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1000, "ʹ����Ʒ�������ޣ����ܼ���ʹ����", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"ʹ��һ�����ܱ�"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "ʹ���ɿ�������ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30211,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CAKE, 1500, "ʹ����Ʒ�������ޣ����ܼ���ʹ����", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"ʹ���ɿ�������ܱ�"} },
		{"ThisActivity:UseCake",{tbBITTSK_LIMIT_USE_CAKE,1500,2}},
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "ʹ��ˮ������ܱ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30212,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CAKE, 1500, "ʹ����Ʒ�������ޣ����ܼ���ʹ����", "<"}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"ʹ��ˮ������ܱ�"} },
		{"ThisActivity:UseCake",{tbBITTSK_LIMIT_USE_CAKE,1500,1}},
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "ʹ�����յ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30213,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 200, "ʹ����Ʒ�������ޣ����ܼ���ʹ����", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"ʹ�����յ���"} },
		{"ThisActivity:UseCakeBirthday",{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,200}},
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "�������ۻ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"�ȼ��������´�������",">="} },
		{"AddOneMaterial",	{"���",ITEM_FLOUR,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROAD,1,EVENT_LOG_TITLE,"�����"} },
	},
}