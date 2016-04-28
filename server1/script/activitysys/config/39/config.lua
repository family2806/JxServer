Include("\\script\\activitysys\\config\\39\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click yuexialaoren",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"NguyÖt H¹ l·o nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lý Nh©n Duyªn",3} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click zhangdenggongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lý Nh©n Duyªn",4} },
		{"AddDialogOpt",	{"PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé",13} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "yuelao_yinyuan",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"B¸ch Niªn Tu §¾c §ång ThuyÒn §é, Thiªn Niªn Tu Lai Céng ChÈm Miªn, Ta sö dông D©y Hång nµy ®Ó rµng buéc nh©n duyªn trªn thÕ gian nµy",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éngLÔ T×nh Nh©n",5} },
		{"AddDialogOpt",	{"NhËn T¬ Hång",6} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "gongnv_yinyuan",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"H¹t Gièng Hoa Hång vµ §Ëu Hång mét lÇn ng­¬i chØ cã thÓ nhËn 1 trong hai lo¹i",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éngLÔ T×nh Nh©n",5} },
		{"AddDialogOpt",	{"NhËn H¹t Gièng Hoa Hång",7} },
		{"AddDialogOpt",	{"NhËn §Ëu Hång",9} },
--By: NgaVN - ÔÚÕÆµÆ¹¬Å®NPCÑ¡»»Ç¬À¤¼ÅÄ¯µ¤
		--{"AddDialogOpt",	{"Giao nép Di Hoa Hßa Méng",12} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "yinyuan introduction",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"Trong thêi gian ho¹t ®éng, c¸c ®¹i hiÖp cÊp 120 trë lªn mçi ngµy ®Òu cã thÓ ®Õn NguyÖt H¹ L·o Nh©n nhËn 1 T¬ Hång, còng cã thÓ ®Õn PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé nhËn §Ëu Hång hoÆc H¹t Gièng Hoa Hång, nhËn vµ trång §Ëu Hång cÇn ph¶i ®¸p øng ®­îc ®iÒu kiÖn cña ho¹t ®éng, nhËn vµ trång H¹t Gièng Hoa Hång cÇn ph¶i ®¸p øng ®­îc 1 trong 2 ®iÒu kiÖn bÊt kú d­íi ®©y<enter> 1. Hai  ng­êi ch¬i kh¸c nhau vÒ giíi tÝnh cïng nhau tæ ®éi, sè nh©n duyªn vµ sè thµnh ngÉu trªn T¬ Hång cña hai ng­êi cïng tæ ®éi<enter> 2. Phu thª hai ng­êi cïng nhau tæ ®éi <enter> khi cïng nhau trång H¹t Gièng Hoa Hång, ng­êi kh¸c giíi tÝnh cña ®¹i hiÖp cïng ®éi ngò cÇn ph¶i nu«i d­ìng H¹t Gièng Hoa Hång cña ®èi ph­¬ng, Khi Hoa Hång tr­ëng thµnh, ng­¬i cã thÓ thu thËp DÞ H­¬ng Hoa Hång trªn c©y cña m×nh. nu«i d­ìng Hång §Ëu kh«ng cÇn tæ ®éi, chØ cÇn nu«i d­ìng h¹t gièng cña m×nh lµ ®­îc, nu«i d­ìng H¹t Gièng Hoa Hång/§Ëu Hång cÇn ph¶i kÞp thêi b¾t s©u , nhæ cá, v.v kÞp thêi, nh­ vËy míi nhËn ®­îc cµng nhiÒu phÇn th­ëng. <enter> trong thêi gian ho¹t ®éng trong Kú Tr©n C¸c cã Di Hoa Hßa Méng, ®¹i hiÖp cã thÓ lÊy Di Hoa Hßa Méng giao cho PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé, PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé sÏ cho ng­¬i Cµn Kh«n TÝch LÞch §¬n, ®¹i hiÖp cã thÓ sö dông Cµn Kh«n TÝch LÞch §¬n ®i ¸c Lang Cèc tiªu diÖt ¸c Lang T¶ Sø, ®¸nh b¹i ¸c Lang T¶ Sø sÏ nhËn ®­îc nhiÒu phÇn th­ëng",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "get redline from yuelao",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
--By: NgaVN	
		--{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,0,"H«m nay ng­¬i ®· nhËn D©y Hång råi","=="} },
		{"ThisActivity:CheckRedline",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		--{"ThisActivity:AddTaskDaily",	{TSK_GET_REDLINE,1} },
		{"ThisActivity:GiveRedline",	{nil} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "get rose see from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {format("§Ëu Hång vµ H¹t Gièng Hoa Hång mçi ngµy chØ cã thÓ lÜnh nhËn 1 trong hai c¸i, nÕu nh­ trong ngµy kh«ng nhËn, th× sÏ d­îc céng dån sang ngµy h«m sau ®Ó nhËn, nhiÒu nhÊt chØ cã thÓ céng dån 3 c¸i. <enter> hiÖp sÜ muèn nhËn H¹t Gièng Hoa Hång, cÇn ph¶i ®¸p øng hai ®iÒu kiÖn bÊt kú d­íi ®©y <enter> 1. 2 Ng­êi ch¬i kh¸c giíi tÝnh cïng nhau tæ ®éi<enter> 2. D©y T¬ Hång","Cöa hµng tinh lùc"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn H¹t Gièng Hoa Hång",8} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "surely get rose see from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckTeamConfig",	{nil} },
		{"ThisActivity:CheckSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:SubSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3109,1,0,0},nBindState = -2,nExpiredTime=20120301,},1,"EVENT_LOG_TITLE","get rose seed"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "CreateDialog",
	szName = "get redbean from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {format("§Ëu Hång vµ H¹t Gièng Hoa Hång mçi ngµy chØ cã thÓ lÜnh nhËn 1 trong hai c¸i, nÕu nh­ trong ngµy kh«ng nhËn, th× sÏ d­îc céng dån sang ngµy h«m sau ®Ó nhËn, nhiÒu nhÊt chØ cã thÓ céng dån 3 c¸i. <enter>%s cã Tó NguyÖt Ng­ng Lé, Tó NguyÖt Ng­ng Lé cã thÓ t¨ng thªm 1 lÇn nhËn 1 H¹t Gièng Hoa Hång hoÆc 1 §Ëu Hång <enter> ®¹i hiÖp, ng­¬i ch­a t×m ®­îc nh©n duyªn cña m×nh sao, ng­¬i cã thÓ nhËn §Ëu Hång ®em ®i trång, cã diÒu lµ phÇn th­ëng cña §Ëu Hång kh«ng phong phó b»ng Hoa Hång ®©u nhÐ, hay lµ ®¹i hiÖp ng­¬i nhanh nhanh ®i t×m nh©n duyªn cña m×nh ®i, cïng víi anh ta (c« ta) ®i trång c©y th× thó vÞ h¬n.","Cöa hµng tinh lùc"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn §Ëu Hång",10} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "surely get redbean from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:SubSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3110,1,0,0},nBindState = -2,nExpiredTime=20120301,},1,EVENT_LOG_TITLE,"get redbean"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "use xiuyueninglv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {{tbProp={6,1,3115,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckDateEx",	{nil} },
--By: NgaVN
		{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,2,"H«m nay ng­¬i ®· sö dông 2 lÇn Tó NguyÖt Ng­ng Lé, mai h·y sö dông tiÕp","<"} },		
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSK_SEEDTIME_EX,1} },
		{"ThisActivity:AddTaskDaily",	{TSK_GET_REDLINE,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","Ng­¬i nhËn ®­îc thªm mét lÇn c¬ héi nhËn H¹t Gièng Hoa Hång hoÆc §Ëu Hång"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "handin yihuahemeng",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"Cµn Kh«n PhÝch LÞch §¬n",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Di Hoa Hßa Méng",{tbProp={6,1,3112,1,0,0},},1} },
	},
	tbActition = 
	{
--By: NgaVN - ÔÚÕÆµÆ¹¬Å®NPCÑ¡»»Ç¬À¤¼ÅÄ¯µ¤
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,3116,1,0,0},nExpiredTime=20120301,},1,EVENT_LOG_TITLE,"handin yihuahemeng get pilidan"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDLINE_NUM,0,"§¹i HiÖp ®· nhËn råi, Hay mai nhËn n÷a","=="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,2,"H«m nay ch­a sö dông 2 Tó NguyÖt Ng­ng Lé","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSK_REDLINE_NUM,1} },
		{"PlayerFunLib:AddExp",	{60000000,1,EVENT_LOG_TITLE,"PhÇn th­ëng sö dông Tó NguyÖt Ng­ng Lé"} },
	},
}
