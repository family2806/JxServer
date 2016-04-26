Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--���Ѱ��ԭ�ϵķ���
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "TongKim1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�ν�1000", "20 ��ʯ", 1}},
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},40,"Event_PNVN", "�ν�3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 ��ʯ", 1}},
	},
}

tbConfig[3] =		--����17
{
	nId = 3,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},15,"Event_PNVN", "����17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����17", "15��ʯ", 1}},
	},
}

tbConfig[4] =  				--����28
{
	nId = 4,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "����28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����28", "30��ʯ", 1}},
	},
}

tbConfig[5] = --ˮ��ͷ��
{
	nId = 5,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "����ˮ��ͷ��"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ˮ��ͷ��", "20 ��ʯ", 1}},
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "����ˮ����ͷ��"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ˮ����ͷ��", "30 ��ʯ", 1}},
	},
}

tbConfig[7] = --�׵�- ����10
{
	nId = 7,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "�׵۴���10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "�׵۴���10", "30 ��ʯ", 1}},
	},
}
tbConfig[8] = --�ƽ�boss
{
	nId = 8,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "����ƽ�boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ƽ�boss", "30 ��ʯ", 1}},
	},
}
tbConfig[9] = --ɱ��boss
{
	nId = 9,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_PNVN", "����ɱ��boss"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "����ɱ��boss", "5 ��ʯ", 1}},
	},
}

---��Npc�Ի�
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "���С��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�Ͻ���ʯ",12} },
		{"AddDialogOpt",	{"�ϳɱ���ʯ",11} },
	},
}

tbConfig[11] = --�ϳɱ���ʯ
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "�ϳɱ���ʯ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>����ʯ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����150�������ܲμӸû",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"��ʯ",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"�쾫ʯ",{tbProp={6,1,30154,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30155,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_PNVN", "�ͱ���ʯ"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "��ͬ����ʯ", "1 ����ʯ", 1}},
	},
}

tbConfig[12] = --�Ͻ���ʯ��Ʒ
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "�Ͻ���ʯ��Ʒ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>�Ͻ���ʯ��Ʒ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����150�������ܲμӸû",">="} },
		{"ThisActivity:HandInHoangThachLimit", {nil}},
		{"AddOneMaterial",	{"��ʯ",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:HandInHoangThach", {nil}},
	},
}

tbConfig[13] = --ʹ�ñ���ʯ
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "ʹ�ñ���ʯ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30155,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ĵȼ�����������ʹ����Ʒ",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"ThisActivity:UseBTT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_BTT", {nil}},		
	},
}
