Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--���Ѱ��ԭ�ϵķ���
tbConfig[1] = --TongKim1000��
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 1000 �i�m",
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "20 Ho�ng Th�ch", 1}},
	},
}

tbConfig[2] = --TongKim3000��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},40,"Event_PNVN", "TongKim3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 Ho�ng Th�ch", 1}},
	},
}

tbConfig[3] =		--VuotAi17
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "VuotAi17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},15,"Event_PNVN", "VuotAi17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi17", "15 Ho�ng Th�ch", 1}},
	},
}

tbConfig[4] =  				--VuotAi28
{
	nId = 4,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "VuotAi28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi28", "30 Ho�ng Th�ch", 1}},
	},
}

tbConfig[5] = --ˮ��ͷ��
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "TieuDietThuyTacDauLinh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "TieuDietThuyTacDauLinh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDauLinh", "20 Ho�ng Th�ch", 1}},
	},
}

tbConfig[6] = --ˮ����ͷ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "TieuDietThuyTacDaiDauLinh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "TieuDietThuyTacDaiDauLinh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDaiDauLinh", "30 Ho�ng Th�ch", 1}},
	},
}

tbConfig[7] = --�׵�- ����10
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "VuotAiViemDe10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "VuotAiViemDe10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAiViemDe10", "30 Ho�ng Th�ch", 1}},
	},
}
tbConfig[8] = --�ƽ�boss
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "TieuDietBossTheGioi",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "TieuDietBossTheGioi"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossTheGioi", "30 Ho�ng Th�ch", 1}},
	},
}
tbConfig[9] = --ɱ��boss
{
	nId = 9,
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_PNVN", "TieuDietBossSatThu"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "5 Ho�ng Th�ch", 1}},
	},
}

---��Npc�Ի�
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Ti�u Ph��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti�u Ph��ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N�p Ho�ng Th�ch",12} },
		{"AddDialogOpt",	{"H�p th�nh B�ng Tinh Th�ch",11} },
	},
}

tbConfig[11] = --H�p th�nh B�ng Tinh Th�ch
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "H�p th�nh B�ng Tinh Th�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B�ng Tinh Th�ch",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"Ho�ng Th�ch",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Thi�n Tinh Th�ch",{tbProp={6,1,30154,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30155,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_PNVN", "GhepBangTinhThach"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "H�p th�nh B�ng Tinh Th�ch", "1 B�ng Tinh Th�ch", 1}},
	},
}

tbConfig[12] = --N�p v�t ph�m Ho�ng Th�ch
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "N�p v�t ph�m Ho�ng Th�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>N�p v�t ph�m Ho�ng Th�ch",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a �� 150, kh�ng th� tham gia ho�t ��ng n�y",">="} },
		{"ThisActivity:HandInHoangThachLimit", {nil}},
		{"AddOneMaterial",	{"Ho�ng Th�ch",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:HandInHoangThach", {nil}},
	},
}

tbConfig[13] = --S� d�ng B�ng Tinh Th�ch
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "S� d�ng B�ng Tinh Th�ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30155,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� s� d�ng v�t ph�m",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"ThisActivity:UseBTT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_BTT", {nil}},		
	},
}
