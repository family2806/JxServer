tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "ʹ��Ұ�ŵ����ر���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2374,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2348,1,-1,0},},6,"��Ҫ%d ���촸, ����������������!"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{71,1,"Ұ�ŵ����ر���"} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2348,1,-1,0},},6} },
		{"ThisActivity:Jiluxiaohao_yesou",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "ʹ�ù���ս���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2377,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{72,1,"����ս���"} },
		{"ThisActivity:Jiluxiaohao_chengzhan",	{nil} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "ʹ�������ر�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2375,-1,-1,-1},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2348,1,-1,0},},12,"��Ҫ%d ���촸�����²�������!"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{73,1,"�����ر�"} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2348,1,-1,0},},12} },
		{"ThisActivity:Jiluxiaohao_zhizun",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "ʹ��ˮ���ĲƱ�(��)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2376,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{74,1,"ˮ���ĲƱ�"} },		
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "ʹ�÷�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2373,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{75,1,"������"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "���������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"�������"} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2375,1,0,0},},20,"100"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "BOSS ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2375,1,0,0},},10,"100"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "ˮ��ͷ������(��)",
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
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "ˮ����ͷ��������1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{337} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2743,1,0,0},},9,"100"} },
		--�i������ˮ����ͷ��boss���µĽ���- Modified By DinhHQ - 20120523
		{"ThisActivity:VnFFBigBossDrop",	{nil}}
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "ˮ����ͷ��������23",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"338,339"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2743,1,0,0},},3,"100"} },
		--�i������ˮ����ͷ��boss���µĽ��� - Modified By DinhHQ - 20120523
		{"ThisActivity:VnFFBigBossDrop",	{nil},}
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "nil",
	szName = "null",
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
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "ʹ��ˮ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2743,1,0,0},}},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2744,1,0,0},},1,"��Ҫһ�� %d ����Կ��} },
		{"ThisActivity:VnUsePirateBox",	{nil}}
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2744,1,0,0},},1} },
	--	{"ThisActivity:GiveAward",	{"shuizeibaoxiang",1,"use_shuizeibaoxiang"} },
		--{"ThisActivity:Jiluxiaohao_shuizexiangzi",	{nil} },		
	},
}
