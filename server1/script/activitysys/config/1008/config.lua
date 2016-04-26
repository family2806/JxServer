Include("\\script\\activitysys\\config\\1008\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "�����������������¶�",
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
	szName = "��ֻ����ƿ��ͼ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_HONEY_BOTTLE,1,"7"} },
	},
}
--�ڻ�ڻ�ȡԭ�ϵķ���
tbConfig[3] = --�ν�1000 ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν�1000 ��",
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ν�1000", "10 ��˫�ӹ�", 1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,30,EVENT_LOG_TITLE,"�ν�3000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ν�000", "30��˫�ӹ�", 1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"����17"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����17", "10 ��˫�ӹ�", 1}},
	},
}
tbConfig[6] =  --����28
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "���� 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"����28"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����28", "10 ��˫�ӹ�",1}},
	},
}
tbConfig[7] = --ˮ��ͷ��
{
	nId = 7,
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"ɱ��ˮ��ͷ��"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "ɱ��ˮ��ͷ��", "10 ��˫�ӹ�",1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"����ˮ����ͷ��"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ˮ����ͷ��", "20 ��˫�ӹ�",1}},
	},
}
tbConfig[9] = --�׵�- ����10
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"�׵۴���10"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�׵۴���10", "20 ��˫�ӹ�",1}},		
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,40,EVENT_LOG_TITLE,"����ƽ�boss"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ƽ�boss", "40 ��˫�ӹ�",1}},			
	},
}
tbConfig[11] = --ɱ��boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "90��ɱ��boss",
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,3,EVENT_LOG_TITLE,"����ɱ��boss"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ɱ��boss", "3 ��˫�ӹ�",1}},				
	},
}

-----��Npc�Ի�
tbConfig[12] =
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "����¶�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�¶�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳ���Ʒ",13} },
		{"AddDialogOpt",	{"Online �콱",17} },
		{"AddDialogOpt",	{"õ��",22} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "�ϳ���Ʒ�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>������Ҫʲô������",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳɽ��Ȳ�",14} },
		{"AddDialogOpt",	{"�ϳ���ɫ���",15} },	
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "�ϳɽ��Ȳ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>���Ȳ�",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����150��, ���ܲμӸû",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"��ƿ",ITEM_HONEY_BOTTLE,1} },
		{"AddOneMaterial",	{"���ѩѿ",ITEM_THANH_THANH_TUYET_NHA,1} },
		{"AddOneMaterial",	{"˫�ӹ�",ITEM_TWIN_PEANUT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COOL_TEA,1,EVENT_LOG_TITLE, "�ϳɽ��Ȳ�"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ϳɽ��Ȳ�", "1 ���Ȳ�", 1}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "�ϳ���ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ɫ���",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����150��, ���ܲμӸû",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"˫�ӹ�",ITEM_TWIN_PEANUT,1} },
		{"AddOneMaterial",	{"��ƿ",ITEM_HONEY_BOTTLE,2} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BLUE_ROSE,1,EVENT_LOG_TITLE, "�ϳ���ɫ���"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ϳɽ��Ȳ�", "1 ���Ȳ�", 1}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "OnLogin",
	szName = "�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "��ȡ������Ի�",
	nStartDate = 201202130000,
	nEndDate  = 201202232400,
	tbMessageParam = {"�ڻ���е�ʱ���ڣ�150�����ϵĴ��� (����������) ���Բμ����߻�콱��ÿ����һ��Сʱ�����һֻ������ÿ�����ֻ����ȡ3�Ρ�",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online��ȡ����",18} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "������������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TSK_ONLINE_AWARD_DAILY_LIMIT,3,"���첻�������ˣ�����������.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedCandle",	{nil} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "ʹ�ý��Ȳ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30174,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_TEA_USING, 1500, "ÿ��ֻ��ʹ�ø���Ʒ1500��.", "<"}},	
	},
	tbActition = 
	{		
		{"ThisActivity:UseCoolTea",	{nil} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "ʹ�ð�ɫ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30175,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��."} },		
		{"PlayerFunLib:CheckTaskDaily",	{TSK_USE_WHITE_GIFT_DAILY_LIMIT,3,"�����㲻��ʹ�ø���Ʒ�ˣ������ټ���ʹ��.","<"} },
	},
	tbActition = 
	{			
		{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,"ʹ�ð�ɫ���"} },
		{"ThisActivity:WhiteGiftAddTask", {nil}},
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "ʹ����ɫ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30179,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ�����к����ִ�ʹ��."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_BLUE_GIFT_USING, 1000, "ÿ��ֻ��ʹ�ø���Ʒ1000��.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"ʹ����ɫ����"} },
		{"ThisActivity:CastSkillOnUsingBlueGift",	{nil} },
		{"ThisActivity:BlueGiftAddTask", {nil}},
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "������öԻ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���������õ����Խ����Ҳμ�õ�������������:<enter>- �Ͻ�ʱ��: <color=red>2012��2��2��0ʱ��2012��2��28��24ʱ<color><enter>- ����ܼ�ʱ��g: <color=red>0h20 ��29-2-12<color><enter>- �콱ʱ��: <color=red>9h  29-2-12��24h 29-2-2012<color>",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����27���ѽ�õ������27",29} },
		{"AddDialogOpt",	{"�Ͻ�õ��",23} },
		{"AddDialogOpt",	{"��������",24} },	
		{"AddDialogOpt",	{"��ȡ��������",25} },
	},
}
tbConfig[23] = --����ɫ����
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "�Ͻ�õ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�Ͻ���Ʒ",1,1,1,0.02},
	tbCondition = 
	{			
		{"AddOneMaterial",	{"õ��",{tbProp={6,1,30172,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },	
		{"ThisActivity:GiveRoseCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRose",	{nil} },		
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "nil",
	szName = "�����а�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "õ���콱�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ѡ����:",0},
	tbCondition = 
	{
		{"ThisActivity:TopListAwardCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"1�Ƚ���",26} },
		{"AddDialogOpt",	{"2�Ƚ���",27} },	
		{"AddDialogOpt",	{"3�Ƚ���",28} },
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "1�Ƚ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{1} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "2�Ƚ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{2} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "nil",
	szName = "3�Ƚ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{3} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "nil",
	szName = "���½�����Ϣ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
	},
	tbActition = 
	{
		{"ThisActivity:UpdateRoseNumber",	{nil} },
	},
}