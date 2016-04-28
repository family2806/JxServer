Include("\\script\\activitysys\\config\\30\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "¸ß¼¶ËÎ½ğ»ı·Ö´óÓÚ1000ÇÒĞ¡ÓÚ3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveSongjinAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "TongKim1000NhanCayBut"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TongKim1000", "C©y Bót", 1}},
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "¸ß¼¶ËÎ½ğ»ı·Ö´óÓÚ3000",
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
		--{"ThisActivity:GiveSongjinAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "TongKim3000NhanCayBut"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TongKim3000", "C©y Bót", 1}},
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "¸ß¼¶´³¹Ø¹ı17¹Ø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{17} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "´³¹Ø17»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAi17", "C©y Bót", 1}},
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "¸ß¼¶´³¹Ø¹ı28¹Ø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{28} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "VuotAi28»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAi28", "C©y Bót", 1}},
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "FinishKillerBoss",
	szName = "¸ß¼¶ÉC©y BótÖboss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveShashouAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},2,"Event_NhaGiaoVN", "ÏûÃğÉC©y BótÖBossSat»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossSatThu", "C©y Bót", 1}},
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
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
		--{"ThisActivity:GiveYDBZAward",	{10} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},15,"Event_NhaGiaoVN", "VuotAiViemDe10»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAiViemDe10", "C©y Bót", 1}},
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Ò°Íâ´ò¹ÖµôÂäGiÊy Tr¾ng",
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
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,3039,1,0,0},nExpiredTime=20111201,},1,"5"} },		
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "ServerStart",
	szName = "·şÎñÆ÷Æô¶¯Ê±¼ÓÔØnpc",
	nStartDate = 201111010000,
	nEndDate  = 201112010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "·çÁê¶ÉË®ÔôÍ·Áì",
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
		--{"ThisActivity:GiveFenglinduAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},5,"Event_NhaGiaoVN", "TieuDietThuyTacDauLinh»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietThuyTacDauLinh", "C©y Bót", 1}},
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "·çÁê¶ÉË®Ôô´óÍ·Áì",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveFenglinduAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "TieuDietThuyTacDaiDauLinh»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietThuyTacDaiDauLinh", "C©y Bót", 1}},
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "»Æ½ğboss",
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
		--{"ThisActivity:GiveGoldBossAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "ÏûÃğÊÀ½çBoss»ñµÃC©y Bót"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossTheGioi", "C©y Bót", 1}},
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "µã»÷§¹i L·o S­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i L·o S­"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"Giao nép Cuèn S¸ch",13} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ngµy nhµ gi¸o",14} },
		--{"AddDialogOpt",	{"NhËn §å Phæ Kim ¤",15} },
		{"SetDialogTitle",	{"Ã¿Äê½ÌÊ¦½ÚÓÖµ½ÁË£¬¸÷Î»´óÏÀ¿ÉÒÔÍ¨¹ıÉÏ½»<color=yellow> Cuèn S¸ch <color> ¸øÎÒ½«»ñµÃ½±Àø£¬Èç¹ûÉÏ½»´ÎÊı´ïµ½700´Î£¬ÒÀÈ»¿ÉÒÔÊÕµ½Ò»Ğ©½ğÎÚÍ¼Æ×¡£Í¬Ê±£¬ÔÚ2011Äê11ÔÂ20ÈÕ£¬¿ÉÒÔµ½ÎÒÕâÀïÁìÈ¡Event_NhaGiaoVNÀñÆ·£¬Ã¿ÈËÖ»ÄÜÁìÈ¡Ò»´Î£¬²»ÒªÍü¼ÇÄÇÌìÅ¶¡£"} },
	},
}
--tbConfig[13] = --Ò»¸öÏ¸½Ú
--{
--	nId = 13,
--	szMessageType = "nil",
--	szName = "Giao nép Cuèn S¸ch¼®",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {nil},
--	tbCondition = 
--	{
--		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
--	},
--	tbActition = 
--	{
--		{"ThisActivity:HandInBook",	{nil} },
--	},
--}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Sö dông Cuèn S¸ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3042,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"ThisActivity:CheckBookLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBook",	{nil} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng ngµy nhµ gi¸o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_TeacherAward,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn n÷a","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:TeacherAward",	{nil} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "NhËn §å Phæ Kim ¤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_JinwuAward,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn n÷a","=="} },
		{"ThisActivity:CheckTask",	{TSK_HandInBook,700,"Sè l­îng Cuèn S¸ch mµ ®¹i hiÖp giao nép ch­a ®ñ 700 lÇn, kh«ng thÓ nhËn phÇn th­ëng.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:JinwuAward",	{nil} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "µã»÷Th­ §ång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th­ §ång"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giao nép GiÊy Tr¾ng",17} },
		{"AddDialogOpt",	{"Hîp thµnh Cuèn S¸ch",18} },
		{"SetDialogTitle",	{"´óÏÀ! ÓĞ<color=yellow> GiÊy Tr¾ng<color> Âğ, ¸øÎÒ°É£¬ÎÒ½«¸øÄãÏàÓ¦µÄ½±Àø¡£¸úÄãËµÒ»¸öÃØÃÜ£¬Ê¹ÓÃ<color=yellow> 5 ÕÅGiÊy Tr¾ng£¬Ò»Ö§C©y Bót£¬Ò»Æ¿Lä Mùc <color> juice¿ÉÒÔºÏ³ÉÒ»±¾ <color=yellow> Êé <color>, ÄÃCuèn S¸chÉÏ½»¸ø<color=yellow> ÎÒÅÔ±ßµÄ§¹i L·o S­<color> ½«ÊÕµ½±¦¹ó½±Àø¡£ºÍÄãĞ¡ÉùËµ°É£¬GiÊy Tr¾ng¿ÉÒÔµ½ <color=yellow> ³¤°×É½ÄÏ£¬³¤°×É½±±£¬ÂãÀÇ¶´£¬É³Ä®É½¶´3£¬Äª¸ß¿ß£¬½ø¾Õ¶´ <color> ´ò¹ÖµôÂä£¬¶øC©y BótÔò¿ÉÒÔÍ¨¹ı²Î¼Ó¸÷ÖÖĞÔÄÜ»î¶¯»ñµÃ£¬Lä Mùc¿ÉÒÔÔÚ <color=yellow> ÆæÕä¸óÕÒµ½<color>, ²»ÒªÅª´íÁËÅ¶"} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "nil",
	szName = "Giao nép GiÊy Tr¾ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandInPaper",	{nil} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Cuèn S¸ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Cuèn S¸ch",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"GiÊy Tr¾ng",{tbProp={6,1,3039,1,0,0},},5} },
		{"AddOneMaterial",	{"C©y Bót",{tbProp={6,1,3040,1,0,0},},1} },
		{"AddOneMaterial",	{"Lä Mùc",{tbProp={6,1,3041,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3042,1,0,0},nExpiredTime=20111201,},1,"Event_NhaGiaoVN","GhepCuonSach"} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "Sö dông Hoa Tri ¢n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3043,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedZhienhua,nMaxZhienhua,"ThËt ®¸ng tiÕc hiÖn t¹i sè lÇn sö dông ®· ®ñ, kh«ng thÓ sö dông ®­îc n÷a","<"} },
		{"ThisActivity:CheckTask",	{TSK_HandInPaper,nMaxPaperCount,format("Ä¿Ç°Giao nép GiÊy Tr¾ngÊıÁ¿Î´´ïµ½%s, ²»ÄÜÊ¹ÓÃ",nMaxPaperCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhienhua",	{nil} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "Sö dông Thiªn Vò Hån",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3044,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedTianyuhun,nMaxTianyuhun,"ThËt ®¸ng tiÕc hiÖn t¹i sè lÇn sö dông ®· ®ñ, kh«ng thÓ sö dông ®­îc n÷a","<"} },
		--{"ThisActivity:CheckTask",	{TSK_HandInBook,nMaxBookCount,format("Ä¿Ç°Giao nép Cuèn S¸ch¼®ÊıÁ¿Î´´ïµ½%s, ²»ÄÜÊ¹ÓÃ",nMaxBookCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseTianyuhun",	{nil} },
	},
}
