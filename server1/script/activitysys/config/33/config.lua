Include("\\script\\activitysys\\config\\33\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "·şÎñÆ÷Æô¶¯¼ÓÔØnpc",
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
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "ËÎ½ğµÃ·Ö´óÓÚ1000Ğ¡ÓÚ3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TongKim1000NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim1000", "10 D©y Thõng", 1}},
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "ËÎ½ğµÃ·Ö´óÓÚ3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TongKim3000NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim3000", "30 D©y Thõng", 1}},
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "´³¹Ø¹ıµÚ17¹Ø",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","VuotAi17NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi17", "10 D©y Thõng", 1}},
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "´³¹Ø¹ıµÚ28¹Ø",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_QuocKhanhVN","VuotAi28NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "15 D©y Thõng", 1}},
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "·çÁê¶ÉÉ±ËÀË®ÔôÍ·Áì",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "10 D©y Thõng", 1}},
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "·çÁê¶ÉÉ±ËÀË®Ôô´óÍ·Áì",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDaiDauLinh", "20 D©y Thõng", 1}},
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "Ñ×µÛ´³¹ıµÚÊ®¹Ø",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "20 D©y Thõng", 1}},
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô S¸t thñ ",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","TieuDietBossSatThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossSatThu", "2 D©y Thõng", 1}},
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "É±ËÀ»Æ½ğBOSS",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TieuDietBossTheGioi"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossTheGioi", "30 D©y Thõng", 1}},
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "µÚ¶ş½×¶ÎËÎ½ğ´óÓÚ1000Ğ¡ÓÚ3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TongKim1000NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","TongKim1000Áì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim1000", "10 D©y Thõng vµ 4 NÕn Tr¾ng", 1}},
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "µÚ¶ş½×¶ÎËÎ½ğµÃ·Ö´óÓÚ3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TongKim3000NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},8,"Event_QuocKhanhVN","TongKim3000Áì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim3000", "30 D©y ThõngºÍ8°×À¯Öò", 1}},
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "µÚ¶ş½×¶Î´³¹Ø¹ıµÚ17¹Ø",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","VuotAi17NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","VuotAi17Áì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi17", "10 D©y Thõng vµ 2 NÕn Tr¾ng", 1}},
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "µÚ¶ş½×¶Î´³¹Ø¹ıµÚ28¹Ø",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_QuocKhanhVN","VuotAi28NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","VuotAi28Áì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "15 D©y ThõngºÍ4 °×À¯Öò", 1}},
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "µÚ¶ş½×¶Î·çÁê¶ÉÉ±ËÀË®ÔôÍ·Áì",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhÁì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "10 D©y ThõngºÍ2°×À¯Öò", 1}},
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "µÚ¶ş½×¶Î·çÁê¶ÉÉ±ËÀË®Ôô´óÍ·Áì",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhÁì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDaiDauLinh", "20 D©y ThõngºÍ4°×À¯Öò", 1}},
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "YDBZguoguan",
	szName = "µÚ¶ş½×¶ÎÑ×µÛ´³¹ıµÚÊ®¹Ø",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},5,"Event_QuocKhanhVN","VuotAiViemDe10Áì°×À¯Öò"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "20 D©y ThõngºÍ5 °×À¯Öò", 1}},
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ClickNpc",
	szName = "T­îng §µi¶Ô»°",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"T­îng §µi"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nép D©y Thõng",19} },
		{"AddDialogOpt",	{"§æi Ph¸o Hoa Quèc Kh¸nh",20} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Nép D©y Thõng",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"Nép D©y Thõng",1,0,0,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"D©y Thõng",{tbProp={6,1,2976,1,0,0},},1} },
		{"ThisActivity:CheckTask",	{TKSG_HandinStringCount,"1000-<ComposeCount>","Ã¿¸öÈËÎï×î¶àÖ»½»1000¸öÎïÆ·[D©y Thõng] ÔÚÕû¸ö»î¶¯ÆÚ¼ä","<="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandinString",	{nil} },
		{"ThisActivity:AddTask",	{TKSG_HandinStringCount,1} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "§æi Ph¸o Hoa Quèc Kh¸nh",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"Ph¸o Hoa Quèc Kh¸nh",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"D©y Thõng",{tbProp={6,1,2976,1,0,0},},1} },
		{"AddOneMaterial",	{"D¶i Lôa Mµu §á",{tbProp={6,1,2977,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_ConvertFireworksCount,1} },
		{"ThisActivity:ConvertFireworks",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2979,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","ºÏ³ÉPh¸o Hoa Quèc Kh¸nh"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "ºÏ³ÉPh¸o Hoa Quèc Kh¸nh", "Ph¸o Hoa Quèc Kh¸nh", 1}},
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i víi H»ng Nga",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"H»ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi B¸nh Trung Thu Hµn NguyÖt",22} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "§æi B¸nh Trung Thu Hµn NguyÖt",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"B¸nh Trung Thu Hµn NguyÖt",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"NÕn Tr¾ng",{tbProp={6,1,2981,1,0,0},},1} },
		{"AddOneMaterial",	{"Lång §Ìn ¸nh Tr¨ng",{tbProp={6,1,2978,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_ConvertMooncakeCount,1} },
		{"ThisActivity:ConvertMooncake",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2980,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","DoiBanhTrungThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "DoiBanhTrungThu", "B¸nh Trung Thu Hµn NguyÖt", 1}},
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃPh¸o Hoa Quèc Kh¸nh",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2979,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhĞ!",">="} },
		{"ThisActivity:CheckTask",	{TKSG_UseFireworksCount,1500,"Ã¿¸öÈËÎï×î¶àÖ»Ê¹ÓÃ1500¼şÎïÆ· [Ph¸o Hoa Quèc Kh¸nh] ÔÚÕû¸ö»î¶¯ÆÚ¼ä","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"Hµnh trang İt nhÊt ph¶i cßn 3 chç trèng"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_UseFireworksCount,1} },
		{"ThisActivity:UseFirworks",	{nil} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃB¸nh Trung Thu Hµn NguyÖt",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2980,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhĞ!",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_UseMooncakeCount,15,"Ã¿¸öÈËÎï×î¶àÖ»Ê¹ÓÃ15¼şÎïÆ· [B¸nh Trung Thu Hµn NguyÖt] ÔÚÕû¸ö»î¶¯ÆÚ¼ä","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"Hµnh trang İt nhÊt ph¶i cßn 3 chç trèng"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_UseMooncakeCount,1} },
		{"ThisActivity:UseMooncake",	{nil} },
	},
}
