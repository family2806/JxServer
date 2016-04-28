Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--ªÓ∂Ø÷–—∞’“‘≠¡œµƒ∑Ω∑®
tbConfig[1] = --TongKim1000µ„
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "TËng kim cao c p 1000 Æi”m",
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "20 Hoµng Thπch", 1}},
	},
}

tbConfig[2] = --TongKim3000µ„
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "TËng kim cao c p 3000 Æi”m",
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 Hoµng Thπch", 1}},
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi17", "15 Hoµng Thπch", 1}},
	},
}

tbConfig[4] =  				--VuotAi28
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V≠Ót qua ∂i 28",
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi28", "30 Hoµng Thπch", 1}},
	},
}

tbConfig[5] = --ÀÆ‘ÙÕ∑¡Ï
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDauLinh", "20 Hoµng Thπch", 1}},
	},
}

tbConfig[6] = --ÀÆ‘Ù¥ÛÕ∑¡Ï
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDaiDauLinh", "30 Hoµng Thπch", 1}},
	},
}

tbConfig[7] = --—◊µ€- ¥≥πÿ10
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAiViemDe10", "30 Hoµng Thπch", 1}},
	},
}
tbConfig[8] = --ª∆Ωboss
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossTheGioi", "30 Hoµng Thπch", 1}},
	},
}
tbConfig[9] = --…± ÷boss
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Nhi÷m vÙ s∏t thÒ c p 90",
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "5 Hoµng Thπch", 1}},
	},
}

---”ÎNpc∂‘ª∞
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "B m vµo Ti”u Ph≠¨ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti”u Ph≠¨ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NÈp Hoµng Thπch",12} },
		{"AddDialogOpt",	{"HÓp thµnh B®ng Tinh Thπch",11} },
	},
}

tbConfig[11] = --HÓp thµnh B®ng Tinh Thπch
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "HÓp thµnh B®ng Tinh Thπch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B®ng Tinh Thπch",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"ßºng c p cÒa ng≠¨i ch≠a ÆÒ 150, kh´ng th” tham gia hoπt ÆÈng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"Hoµng Thπch",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Thi™n Tinh Thπch",{tbProp={6,1,30154,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30155,1,0,0},nExpiredTime=nItemExpiredTime,},1,"Event_PNVN", "GhepBangTinhThach"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "HÓp thµnh B®ng Tinh Thπch", "1 B®ng Tinh Thπch", 1}},
	},
}

tbConfig[12] = --NÈp vÀt ph»m Hoµng Thπch
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "NÈp vÀt ph»m Hoµng Thπch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>NÈp vÀt ph»m Hoµng Thπch",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"ßºng c p cÒa ng≠¨i ch≠a ÆÒ 150, kh´ng th” tham gia hoπt ÆÈng nµy",">="} },
		{"ThisActivity:HandInHoangThachLimit", {nil}},
		{"AddOneMaterial",	{"Hoµng Thπch",{tbProp={6,1,30153,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:HandInHoangThach", {nil}},
	},
}

tbConfig[13] = --Sˆ dÙng B®ng Tinh Thπch
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Sˆ dÙng B®ng Tinh Thπch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30155,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"ßºng c p cÒa ng≠¨i kh´ng ÆÒ, kh´ng th” sˆ dÙng vÀt ph»m",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"ThisActivity:UseBTT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_BTT", {nil}},		
	},
}
