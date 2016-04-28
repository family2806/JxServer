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
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lı Nh©n Duyªn",3} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click zhangdenggongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lı Nh©n Duyªn",4} },
		{"AddDialogOpt",	{"Ch­ëng §¨ng Cung N÷",13} },
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
	tbMessageParam = {"ÔÚ»î¶¯Ê±¼äÄÚ£¬¸÷Î»120¼¶ÒÔÉÏµÄ´óÏÀÃ¿ÈÕ¶¼¿ÉÒÔµ½NguyÖt H¹ l·o nh©nÄÇÁìÈ¡Ò»ÌõºìÏß£¬Ò²¿ÉÒÔµ½ÕÆµÆ¹¬Å®´¦NhËn §Ëu Hång»òÕßÃÀ¹úÖÖ×Ó£¬ÁìÈ¡ºÍÖÖºì¶¹ĞèÒªÂú×ã»î¶¯Ìõ¼ş£¬ÁìÈ¡ºÍÖÖÃµ¹åÖÖ×ÓĞèÒªÂú×ãÒÔÏÂÆäÖĞÈÎºÎÒ»¸öÌõ¼ş<enter> 1. 2¸öÒìĞÔÍæ¼ÒÒ»Æğ×é¶Ó£¬2ÈËºìÏßÉÏµÄÒöÔµºÅºÍ³ÉÅ¼ºÅÒ»Æğ×é¶Ó<enter> 2. ·òÆŞË«·½Ò»Æğ×é¶Ó<enter>µ±Ò»ÆğÖÖÃµ¹åÖÖ×ÓµÄÊ±ºò£¬Í¬Ò»¶ÓÎéÖĞ´óÏÀµÄÒìĞÔÅóÓÑĞèÒªÅàÑø¶Ô·½µÄÃµ¹åÖÖ×Ó£¬µ±Ãµ¹å³É³¤£¬Äã¿ÉÒÔÊÕ¼¯×Ô¼ºÊ÷ÉÏµÄÒìÏãÃµ¹å£¬ÅàÑøºì¶¹ÎŞĞè×é¶Ó£¬Ö»ĞèÒªÅàÑø×Ô¼ºµÄÖÖ×Ó¾ÍĞĞ£¬ÅàÑøÃµ¹åÖÖ×Ó/ºì¶¹ĞèÒª¼°Ê±³ı³æ£¬°Î²İµÈ£¬ÕâÑù²ÅÄÜ»ñµÃ¸ü¶à½±Àø¡£ <enter> ÔÚ»î¶¯ÆÚ¼ä£¬ÔÚÆæÕä¸óÓĞDi Hoa Hßa Méng£¬´óÏÀ¿ÉÒÔÄÃDi Hoa Hßa Méng½»¸øÕÆµÆ¹¬Å®£¬ÕÆµÆ¹¬Å®½«¸øÄãÇ¬À¤»ıÀúµ¤£¬´óÏÀ¿ÉÒÔÊ¹ÓÃÇ¬À¤»ıÀúµ¤µ½¶öÀÇ¹ÈÏûÃğ¶öÀÇ×óÊ¹£¬´ò°Ü¶öÀÇ×óÊ¹½«»ñµÃºÜ¶à½±Àø¡£",0},
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
		--{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,0,"½ñÌìÄãÒÑNhËn T¬ HångÁË","=="} },
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
	tbMessageParam = {format("ºì¶¹ºÍÃµ¹åÖÖ×ÓÃ¿ÌìÖ»ÄÜÁìÈ¡ÆäÖĞÒ»ÖÖ£¬Èç¹ûÔÚµ±ÈÕ²»ÁìÈ¡£¬½«µş¼Óµ½µÚ¶şÈÕÁìÈ¡£¬×î¶àÖ»ÄÜµş¼Ó3¸ö. <enter> ÏÀÊ¿ÏëNhËn H¹t Gièng Hoa Hång£¬ĞèÒª´ğÓ¦ÒÔÏÂÈÎºÎÌõ¼ş<enter> 1. 2ÒìĞÔÍæ¼ÒÒ»Æğ×é¶Ó<enter> 2. ºìÏß","Cöa hµng tinh lùc"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ÎÒÏëNhËn H¹t Gièng Hoa Hång",8} },
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
	tbMessageParam = {format("ºì¶¹ºÍÃµ¹åÖÖ×ÓÃ¿ÌìÖ»ÄÜÁìÈ¡ÆäÖĞÒ»ÖÖ£¬Èç¹ûÔÚµ±ÈÕ²»ÁìÈ¡£¬½«µş¼Óµ½µÚ¶şÈÕÁìÈ¡£¬×î¶àÖ»ÄÜµş¼Ó3¸ö. <enter>%s ÓĞĞãÔÂÄıÂ¶£¬ĞãÔÂÄıÂ¶¿ÉÒÔÔö¼ÓÒ»´ÎÁìÈ¡Ò»Ãµ¹åÖÖ×Ó»òÕß1¿Åºì¶¹ <enter>´óÏÀ£¬ÄãÃ»ÓĞÕÒµ½×Ô¼ºµÄÒöÔµÂğ£¬Äã¿ÉÒÔNhËn §Ëu Hång´øÈ¥ÖÖ£¬ÓĞÒ»µãÊÇºì¶¹µÄ½±ÀøÃ»ÓĞÃµ¹åµÄ·á¸»Å¶£¬Òª²»´óÏÀ¿ìµãÈ¥ÕÒ×Ô¼ºµÄÒöÔµ°É£¬ºÍËû£¨Ëı£©È¥ÖÖÊ÷¸üÓĞÈ¤Ğ©","Cöa hµng tinh lùc"),0},
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
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","Äã¶à»ñµÃÒ»´Î»ú»áNhËn H¹t Gièng Hoa Hång»òÕßºì¶¹"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "handin yihuahemeng",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"Cµn Kh«n Phİch LŞch §¬n",1,1,1,0.02},
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
	szName = "Ch­ëng §¨ng Cung N÷",
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
		{"PlayerFunLib:AddExp",	{60000000,1,EVENT_LOG_TITLE,"Ch­ëng §¨ng Cung N÷"} },
	},
}
