Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi kh�i ��ng server",
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
	szName = "B�n �� ��nh qu�i nh�n B�t M�",
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
tbConfig[3] = --TongKim1000��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 1000 �i�m",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"TongKim1000"} },		
	},
}
tbConfig[4] = --TongKim3000��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,30,EVENT_LOG_TITLE,"TongKim3000"} },		
	},
}
tbConfig[5] =		--���� 17
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"V��t qua �i 17"} },		
	},
}
tbConfig[6] =		--���� 17
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"V��t qua �i 28"} },		
	},
}
tbConfig[7] = --ˮ��ͷ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Gi�t ch�t 1 th�y t�c ��u l�nh",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },				
	},
}
tbConfig[8] = --ˮ����ͷ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t thu� t�c ��i ��u l�nh",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,20,EVENT_LOG_TITLE,"Ti�u di�t thu� t�c ��i ��u l�nh"} },				
	},
}
tbConfig[9] = --�׵ۮ� - ����10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,15,EVENT_LOG_TITLE,"V��t qua �i Vi�m �� th� 6"} },				
	},
}
tbConfig[10] = --�ƽ�boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t boss Ho�ng Kim",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,30,EVENT_LOG_TITLE,"Ti�u di�t boss Ho�ng Kim"} },				
	},
}
tbConfig[11] = --ɱ��boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� s�t th� c�p 90",
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
		{"PlayerFunLib:GetItem",	{ITEM_MILK,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },				
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
	tbMessageParam = {"H�ng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua nguy�n li�u gh�p b�nh sinh nh�t",21} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"Nguy�n Li�u B�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1},10000} }, --��ԭ������1����
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"������1��������Nguy�n Li�u B��ϳ����ִ������յ���"} },		
		{"PlayerFunLib:GetItem",	{ITEM_BUTTER,1,EVENT_LOG_TITLE,"Nguy�n Li�u B�"} },
	},
}
tbConfig[14] = --Th� L�m B�nh�Ի�
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Th� l�m b�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th� L�m B�nh"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>��n th�t ��ng l�c, ta �ang c� m�t s� ho�t ��ng cho ng��i "} },		
		{"AddDialogOpt",	{"Ho�t ��ng l�m B�nh Kem",15} },
		{"AddDialogOpt",	{"Ho�t ��ng Nh�n th��ng ",20} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "��Th� L�m B�nh�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>������������<color=red>Ho�t ��ng l�m B�nh Kem<color>, ����μ����ֻ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n ��i B�t M�",26} },		
		{"AddDialogOpt",	{"Ta mu�n l�m B�nh Kem Th��ng",16} },		
		{"AddDialogOpt",	{"Ta mu�n l�m B�nh Kem Chocolate",17} },		
		{"AddDialogOpt",	{"Ta mu�n L�m B�nh Kem Tr�i C�y",18} },		
		{"AddDialogOpt",	{"Ta mu�n L�m B�nh Sinh Nh�t V� L�m Truy�n K�",19} },		
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n l�m B�nh Kem Th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem Th��ng",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"Nguy�n li�u B�t M�",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"Nguy�n li�u ���ng",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"Nguy�n li�u S�a",ITEM_MILK,1} },
		{"AddOneMaterial",	{"Nguy�n li�u B�",ITEM_BUTTER,2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_OFTEN_CAKES,1,EVENT_LOG_TITLE,"�ϳ�B�nh Kem Th��ng"} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n l�m B�nh Kem Chocolate",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem Chocolate",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"Nguy�n li�u B�t M�",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"Nguy�n li�u ���ng",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"Nguy�n li�u S�a",ITEM_MILK,1} },
		{"AddOneMaterial",	{"Nguy�n li�u B�",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"Nguy�n li�u Chocolate",ITEM_CHOCOLATE,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CHOCOLATE_CAKES,1,EVENT_LOG_TITLE,"�ϳ�B�nh Kem Chocolate"} },
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n L�m B�nh Kem Tr�i C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Kem Tr�i C�y",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"Nguy�n li�u B�t M�",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"Nguy�n li�u ���ng",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"Nguy�n li�u S�a",ITEM_MILK,1} },
		{"AddOneMaterial",	{"Nguy�n li�u B�",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"Nguy�n li�u Tr�i C�y",ITEM_FRUIT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_FRUIT_CAKES,1,EVENT_LOG_TITLE,"�ϳ�B�nh Kem Tr�i C�y"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Ta mu�n L�m B�nh Sinh Nh�t V� L�m Truy�n K�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�nh Sinh Nh�t V� L�m Truy�n K�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"Nguy�n li�u B�t M�",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"Nguy�n li�u ���ng",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"Nguy�n li�u S�a",ITEM_MILK,1} },
		{"AddOneMaterial",	{"Nguy�n li�u B�",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"Nguy�n li�u Tr�i C�y",ITEM_FRUIT,1} },
		{"AddOneMaterial",	{"Nguy�n li�u Chocolate",ITEM_CHOCOLATE,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BIRTHDAY_CAKE,1,EVENT_LOG_TITLE,"�ϳ�B�nh Sinh Nh�t V� L�m Truy�n K�"} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "nil",
	szName = "Nh�n th��ng ho�t ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!?",">="} },
		{"ThisActivity:CheckAwardExp", {"Nh�n th��ng trong th�i gian t� 0h00 ng�y 11/06/2012 ��n 24h00 ng�y 11/06/2012 "},},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_GET_EXP,0,"���Ѿ�Nh�n th��ng ho�t ��ng�ˣ���������ȡ��!","=="} },
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
	tbMessageParam = {"Nguy�n Li�u B�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng�n l��ng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BUTTER,1,EVENT_LOG_TITLE,"��NPCH�ng rong����Nguy�n li�u B�"} },
	},
}
--S?d�ng Item
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "ʹ��B�nh Kem Th��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30210,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		--{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1000, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"ʹ��B�nh Kem Th��ng"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "ʹ��B�nh Kem Chocolate",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30211,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CAKE, 1500, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"ʹ��B�nh Kem Chocolate"} },
		{"ThisActivity:UseCake",{tbBITTSK_LIMIT_USE_CAKE,1500,2}},
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "ʹ��B�nh Kem Tr�i C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30212,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CAKE, 1500, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"ʹ��B�nh Kem Tr�i C�y"} },
		{"ThisActivity:UseCake",{tbBITTSK_LIMIT_USE_CAKE,1500,1}},
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�nh Sinh Nh�t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30213,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "Ch� c� th� s� d�ng t�i c�c th�nh th� v� c�c t�n th� th�n"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 200, "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"S� d�ng B�nh Sinh Nh�t"} },
		{"ThisActivity:UseCakeBirthday",{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,200}},
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "�����Nguy�n li�u B�t M׻���Nguy�n li�u ���ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguy�n li�u B�t M�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"Nguy�n li�u B�t M�",ITEM_FLOUR,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROAD,1,EVENT_LOG_TITLE,"��Nguy�n li�u B�t M�"} },
	},
}