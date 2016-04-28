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

tbConfig[3] =		--V≠Ót qua ∂i 17
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "V≠Ót qua ∂i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},15,"Event_PNVN", "V≠Ót qua ∂i 17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V≠Ót qua ∂i 17", "15 Hoµng Thπch", 1}},
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
	szName = "Gi’t ch’t 1 thÒy t∆c Æ«u l‹nh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_PNVN", "Gi’t ch’t 1 thÒy t∆c Æ«u l‹nh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Gi’t ch’t 1 thÒy t∆c Æ«u l‹nh", "20 Hoµng Thπch", 1}},
	},
}

tbConfig[6] = --ÀÆ‘Ù¥ÛÕ∑¡Ï
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Ti™u di÷t thu˚ t∆c Æπi Æ«u l‹nh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "Ti™u di÷t thu˚ t∆c Æπi Æ«u l‹nh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Ti™u di÷t thu˚ t∆c Æπi Æ«u l‹nh", "30 Hoµng Thπch", 1}},
	},
}

tbConfig[7] = --—◊µ€- ¥≥πÿ10
{
	nId = 7,
	szMessageType = "YDBZguoguan",
	szName = "V≠Ót qua ∂i Vi™m ß’ th¯ 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "V≠Ót qua ∂i Vi™m ß’ th¯ 10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V≠Ót qua ∂i Vi™m ß’ th¯ 10", "30 Hoµng Thπch", 1}},
	},
}
tbConfig[8] = --ª∆Ωboss
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Ti™u di÷t boss Hoµng Kim",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},30,"Event_PNVN", "Ti™u di÷t boss Hoµng Kim"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Ti™u di÷t boss Hoµng Kim", "30 Hoµng Thπch", 1}},
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30153,1,0,0},nExpiredTime=nItemExpiredTime,},5,"Event_PNVN", "TieuDietBossS∏tThÒ"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossS∏tThÒ", "5 Hoµng Thπch", 1}},
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

tbConfig[12] = --NÈp Hoµng ThπchŒÔ∆∑
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "NÈp Hoµng ThπchŒÔ∆∑",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>NÈp Hoµng ThπchŒÔ∆∑",1,1,1,0.02},
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
