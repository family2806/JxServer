Include("\\script\\activitysys\\config\\1003\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "§¸nh qu¸i rít nguyªn liÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,30131,1,0,0},nExpiredTime=nItemExpiredTime,},1,"5"} },
	},
}
tbConfig[3] = --TongKim1000µã
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 1000 ®iÓm",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"EventVuLanBaoHieu\tTongKim1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "20 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[4] = --TongKim3000µã
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 3000 ®iÓm",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},40,"EventVuLanBaoHieu\tTongKim3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},15,"ÎäÀ¶±¨Ð¢»î¶¯\tV­ît qua ¶i 17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V­ît qua ¶i 17", "15 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},25,"ÎäÀ¶±¨Ð¢»î¶¯\tV­ît qua ¶i 28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V­ît qua ¶i 28", "25 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[7] = --Ë®ÔôÍ·Áì
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "GiÕt chÕt 1 thñy tÆc ®Çu lÜnh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},10,"ÎäÀ¶±¨Ð¢»î¶¯\tGiÕt chÕt 1 thñy tÆc ®Çu lÜnh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "GiÕt chÕt 1 thñy tÆc ®Çu lÜnh", "10 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[8] = --Ë®Ôô´óÍ·Áì
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"ÎäÀ¶±¨Ð¢»î¶¯\tTiªu diÖt thuû tÆc ®¹i ®Çu lÜnh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh", "20 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[9] = --Ñ×µÛ®Õ
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},30,"ÎäÀ¶±¨Ð¢»î¶¯\tV­ît qua ¶i Viªm §Õ thø 10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V­ît qua ¶i Viªm §Õ thø 10", "30 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[10] = --ÊÀ½çboss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss thÕ giíi",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},50,"ÎäÀ¶±¨Ð¢»î¶¯\tTiªu diÖt boss thÕ giíi"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Tiªu diÖt boss thÕ giíi", "50 Nô Hoa Hång §á", 1}},
	},
}
tbConfig[11] = --É±ÊÖboss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô s¸t thñ cÊp 90",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},5,"EventVuLanBaoHieu\tTieuDietBossS¸tThñ"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "5 Nô Hoa Hång §á", 1}},
	},
}
----add ¶Ô»°npc
tbConfig[12] = --Ch­ëng §¨ng Cung N÷¶Ô»°
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Ch­ëng §¨ng Cung N÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn ®æi Cöu Tiªn Ngù YÕn",13} },		
	},
}
----ºÏ³ÉÔ­ÁÏ
tbConfig[13] = --§æi Cöu Tiªn Ngù YÕn
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "§æi Cöu Tiªn Ngù YÕn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Cöu Tiªn Ngù YÕn",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{"Nô Hoa Hång §á",{tbProp={6,1,30132,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRoseBud", {nil}},		
	},
}
tbConfig[14] = --¶Ô»°Môc KiÒu Liªn
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Môc KiÒu Liªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Môc KiÒu Liªn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh Thóy Tùu Hå Tiªn",15} },
		{"AddDialogOpt",	{"ËÍNô Hoa Hång §á",16} },
		{"AddDialogOpt",	{"TÆng Cöu Tiªn Ngù YÕn",18} },
	},
}
tbConfig[15] = --§æi Thóy Tùu Hå Tiªn
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "§æi Thóy Tùu Hå Tiªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Thóy Tùu Hå Tiªn",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{"Nô Hoa Hång §á",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},5} },
		{"AddOneMaterial",	{"Cöu Tiªn Ngù YÕn",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"H¶i VÞ Bång Lai",{tbProp={6,1,30129,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30130,1,0,0},nExpiredTime=nItemExpiredTime,},1,"ÎäÀ¶±¨Ð¢»î¶¯\\tHîp thµnh Thóy Tùu Hå Tiªn"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Hîp thµnh Thóy Tùu Hå Tiªn", "1 Thóy Tùu Hå Tiªn", 1}},
	},
}
tbConfig[16] = --ËÍÃµ¹å
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "ËÍNô Hoa Hång §á",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ËÍNô Hoa Hång §á",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{"Nô Hoa Hång §á",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"ThisActivity:CheckGiveRedRoseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRose", {nil}},
	},
}
tbConfig[17] = --Sö dông Thóy Tùu Hå Tiªn
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Sö dông Thóy Tùu Hå Tiªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30130,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ sö dông vËt phÈm",">="} },
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:TTHT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_TTHT", {nil}},		
	},
}
tbConfig[18] = --TÆng Cöu Tiªn Ngù YÕn
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "TÆng Cöu Tiªn Ngù YÕn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>TÆng Cöu Tiªn Ngù YÕn",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"ThisActivity:GiveCuuTienLimit", {nil}},
		{"AddOneMaterial",	{"Cöu Tiªn Ngù YÕn",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:GiveCuuTien", {nil}},
	},
}