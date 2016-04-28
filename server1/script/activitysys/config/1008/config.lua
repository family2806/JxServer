Include("\\script\\activitysys\\config\\1008\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi khëi ®éng server sÏ t¶i NguyÖt Nhi",
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
	szName = "B¶n ®å ®¸nh qu¸i nhËn ®­îc lä mËt",
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
--ÔÚ»î¶¯ÔÚ»ñÈ¡Ô­ÁÏµÄ·½·¨
tbConfig[3] = --TongKim1000 µã
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 1000 ®iÓm",
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
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "10 Qu¶ Song Tö", 1}},
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
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,30,EVENT_LOG_TITLE,"TongKim3000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "30 Qu¶ Song Tö", 1}},
	},
}
tbConfig[5] =		--´³¹Ø 17
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"V­ît qua ¶i 17"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V­ît qua ¶i 17", "10 Qu¶ Song Tö", 1}},
	},
}
tbConfig[6] =  --VuotAi28
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"VuotAi28"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "VuotAi28", "10 Qu¶ Song Tö",1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietThuyTacDauLinh", "10 Qu¶ Song Tö",1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh", "20 Qu¶ Song Tö",1}},
	},
}
tbConfig[9] = --Ñ×µÛ- ´³¹Ø10
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"V­ît qua ¶i Viªm §Õ thø 10"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V­ît qua ¶i Viªm §Õ thø 10", "20 Qu¶ Song Tö",1}},		
	},
}
tbConfig[10] = --»Æ½ðboss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss Hoµng Kim",
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,40,EVENT_LOG_TITLE,"Tiªu diÖt boss Hoµng Kim"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Tiªu diÖt boss Hoµng Kim", "40 Qu¶ Song Tö",1}},			
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "3 Qu¶ Song Tö",1}},				
	},
}

-----ÓëNpc¶Ô»°
tbConfig[12] =
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo NguyÖt Nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"NguyÖt Nhi"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh vËt phÈm",13} },
		{"AddDialogOpt",	{"Online nhËn th­ëng",17} },
		{"AddDialogOpt",	{"Sù kiÖn Hoa Hång",22} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "Hîp thµnh vËt phÈm¶Ô»°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>VÞ ®¹i hiÖp nµy cã cÇn ta gióp g× kh«ng?",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh Trµ Gi¶i NhiÖt",14} },
		{"AddDialogOpt",	{"Hîp thµnh Hép Quµ Mµu Xanh",15} },	
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Trµ Gi¶i NhiÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Trµ gi¶i nhiÖt",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"Lä mËt",ITEM_HONEY_BOTTLE,1} },
		{"AddOneMaterial",	{"Thanh Thµnh TuyÕt Nha",ITEM_THANH_THANH_TUYET_NHA,1} },
		{"AddOneMaterial",	{"Qu¶ song tö",ITEM_TWIN_PEANUT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COOL_TEA,1,EVENT_LOG_TITLE, "Hîp thµnh Trµ Gi¶i NhiÖt"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Hîp thµnh Trµ Gi¶i NhiÖt", "1 Trµ gi¶i nhiÖt", 1}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Hép Quµ Mµu Xanh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Quµ mµu Xanh",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"Qu¶ song tö",ITEM_TWIN_PEANUT,1} },
		{"AddOneMaterial",	{"Lä mËt",ITEM_HONEY_BOTTLE,2} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BLUE_ROSE,1,EVENT_LOG_TITLE, "Hîp thµnh Hép Quµ Mµu Xanh"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Hîp thµnh Trµ Gi¶i NhiÖt", "1 Trµ gi¶i nhiÖt", 1}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "OnLogin",
	szName = "Ng­êi ch¬i trùc tuyÕn",
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
	szName = "§èi tho¹i nhËn NÕn §á",
	nStartDate = 201202130000,
	nEndDate  = 201202232400,
	tbMessageParam = {"Trong thêi gian diÔn ra sù kiÖn, c¸c ®¹i hiÖp cÊp 150 trë lªn (trïng sinh kh«ng giíi h¹n) cã thÓ tham gia ho¹t ®éng online nhËn th­ëng, cø mçi tiÕng ®ång hå oline trªn m¹ng sÏ nhËn ®­îc 1 NÕn §á, mçi ngµy nhiÒu nhÊt chØ nhËn ®­îc 3 lÇn",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online nhËn phÇn th­ëng",18} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "QuyÕt ®Þnh nhËn NÕn ®á",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TSK_ONLINE_AWARD_DAILY_LIMIT,3,"H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.","<"} },
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
	szName = "Sö dông Trµ gi¶i nhiÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30174,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_TEA_USING, 1500, "Mçi nh©n vËt chØ ®­îc sö dông vËt phÈm nµy 1500 lÇn.", "<"}},	
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
	szName = "Sö dông Hép quµ tr¾ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30175,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },		
		{"PlayerFunLib:CheckTaskDaily",	{TSK_USE_WHITE_GIFT_DAILY_LIMIT,3,"H«m nay ng­¬i kh«ng thÓ sö dông vËt phÈm nµy n÷a, ngµy mai h·y sö dông tiÕp.","<"} },
	},
	tbActition = 
	{			
		{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,"Sö dông Hép quµ tr¾ng"} },
		{"ThisActivity:WhiteGiftAddTask", {nil}},
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Sö dông quµ mµu xanh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30179,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_BLUE_GIFT_USING, 1000, "Mçi nh©n vËt chØ ®­îc sö dông vËt phÈm nµy 1000 lÇn.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"Sö dông quµ mµu xanh"} },
		{"ThisActivity:CastSkillOnUsingBlueGift",	{nil} },
		{"ThisActivity:BlueGiftAddTask", {nil}},
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn hoa hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Èç¹û¸óÏÂÓÐHoa Hång¿ÉÒÔ½»¸øÎÒ²Î¼ÓSù kiÖn Hoa Hång¡£»î¶¯ÄÚÈÝÈçÏÂ:<enter>- ÉÏ½»Ê±¼ä: <color=red>2012Äê2ÔÂ2ÈÕ0Ê±µ½2012Äê2ÔÂ28ÈÕ24Ê±<color><enter>- ×îºó×Ü¼ÆÊ±¼äg: <color=red>0h20 µ½29-2-12<color><enter>- Áì½±Ê±¼ä: <color=red>9h  29-2-12µ½24h 29-2-2012<color>",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"CËp nhËt sè l­îng hoa ®· nép ngµy 27",29} },
		{"AddDialogOpt",	{"Giao nép Hoa Hång",23} },
		{"AddDialogOpt",	{"Xem b¶ng xÕp h¹ng",24} },	
		{"AddDialogOpt",	{"NhËn phÇn th­ëng xÕp h¹ng",25} },
	},
}
tbConfig[23] = --½»ÂÌÉ«ÀñÎï
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "Giao nép Hoa Hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nép vËt phÈm",1,1,1,0.02},
	tbCondition = 
	{			
		{"AddOneMaterial",	{"Hoa Hång",{tbProp={6,1,30172,1,0,0},},1} },
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
	szName = "xem b¶ng xÕp h¹ng",
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
	szName = "Sù kiÖn Hoa HångÁì½±¶Ô»°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xin chän phÇn th­ëng:",0},
	tbCondition = 
	{
		{"ThisActivity:TopListAwardCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 1",26} },
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 2",27} },	
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 3",28} },
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "PhÇn th­ëng xÕp h¹ng 1",
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
	szName = "PhÇn th­ëng xÕp h¹ng 2",
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
	szName = "PhÇn th­ëng xÕp h¹ng 3",
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
	szName = "cËp nhËt th«ng tin nép hoa",
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