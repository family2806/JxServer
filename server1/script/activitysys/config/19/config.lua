Include("\\script\\activitysys\\config\\19\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click NguyÖt L·o",
	nStartDate = nil,
	nEndDate  = nil,
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
	szName = "BÊm vµo ch­ëng ®¨ng cung n÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lı Nh©n Duyªn",4} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "ÔÂÀÏµÄT¬ Hång Thiªn Lı Nh©n Duyªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸ch Niªn Tu §¾c §ång ThuyÒn §é, Thiªn Niªn Tu Lai Céng ChÈm Miªn, Ta sö dông D©y Hång nµy ®Ó rµng buéc nh©n duyªn trªn thÕ gian nµy"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña Ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng'T¬ Hång Thiªn Lı Nh©n Duyªn'",5} },
		{"AddDialogOpt",	{"NhËn 'D©y Hång'",6} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Ch­ëng §¨ng Cung N÷µÄT¬ Hång Thiªn Lı Nh©n Duyªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H¹t Gièng C©y Hoa Hång vµ §Ëu T­¬ng T­ ng­¬i chØ ®ùoc nhËn mét trong 2 lo¹i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña Ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"½éÉÜ'T¬ Hång Thiªn Lı Nh©n Duyªn'",5} },
		{"AddDialogOpt",	{"NhËn H¹t Gièng Hoa Hång",7} },
		{"AddDialogOpt",	{"NhËn §Ëu T­¬ng T­",8} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "½éÉÜT¬ Hång Thiªn Lı Nh©n Duyªn»î¶¯",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"´Ó 0h/13/02/2011 µ½ 24h/23/02/2011, ÄÇÀïÁìÒ»ÌõºìÏß£¬ÔÚÃ¿ÌõºìÏßÉÏ¶¼ÓĞÒ»¸öÒöÔµºÅ£¬µ±ÄãÁìÍêºìÏßºó£¬¾Í¿ÉÒÔµ½Ch­ëng §¨ng Cung N÷ÄÇÀïNhËn §Ëu T­¬ng T­»òÕßÊÇÃµ¹åÖÖ×Ó£¬Ã¿ÌìÏÀÊ¿ÓĞÁ½´Î»ú»áNhËn H¹t Gièng Hoa Hång»òÕßÏàË¼¶¹£¬Ã¿´Î»ú»áÄã¿ÉÒÔÑ¡ÔñÁìÈ¡Ò»¿ÅÃµ¹åÖÖ×Ó»òÕßÏàË¼¶¹£¬Èç¹ûÔÚµ±ÈÕNhËn H¹t Gièng Hoa Hång»òÕßÏàË¼¶¹µÄ»ú»áÎ´ÓÃÍê£¬¾ÍÄÜÀÛ»ıÁìÈ¡»ú»áµ½ÏÂÒ»ÈÕ¼ÌĞøÁìÈ¡£¬Ã¿Î»ÏÀÊ¿NhËn H¹t Gièng Hoa Hång»òÕßÏàË¼¶¹µÄ»ú»á×î¶àÖ»ÄÜÀÛ»ı6´Î£¬³¬¹ı6´Î¾Í²»ÄÜ¼ÌĞøÀÛ»ıÁË£¬¾«Á¶Ê¯ÉÌµêÇíÏàÓñÒ×ÎïÆ·¿ÉÒÔ°ïÄãÔö¼ÓÒ»´ÎNhËn H¹t Gièng Hoa Hång»òÕßÏàË¼¶¹µÄ»ú»áÁìÈ¡ºÍÖÖÏàË¼¶¹ÎŞÏŞÖÆ£¬ÁìÈ¡ºÍÖÖÃµ¹åÖÖ×ÓÒªÇóÂú×ãÏÂÃæÆäÖĞÒ»¸öÌõ¼ş\n1.Á½¸öÒìĞÔÍæ¼Ò×é¶Ó£¬Á½ÈËºìÏßÉÏµÄÒöÔµºÅÒª³É¶Ô£¨ÕûÊıºÅ£©¡£\n2.·òÆŞÁ½ÈË×é¶Ó\ÏÀÊ¿¿ÉÒÔÓëÒìĞÔÅóÓÑÒ»Æğµ½Æß´ó³ÇÇø»òÕß°Ë´óĞÂÊÖ´åÍâÖÖÃµ¹åÖÖ×Ó£¬ÒìĞÔÁ½ÈËÒ»Æğ×é¶ÓÕÕ¹Ë±ğÈËÖÖÏÂµÄÃµ¹åÊ÷Ñ¿£¬ÔÚÃµ¹åÊ÷Ñ¿³¤³ÉÃµ¹åÊ÷¿ªÂú»¨µÄ¹ı³ÌÖĞ£¬ÏÀÊ¿ĞèÒª¼°Ê±½øĞĞ½½Ë®£¬Ê©·Ê£¬³ı³æ£¬°Î²İ£¬³ı³æ½½Ë®£¬°Î²İÊ©·ÊÔ½¼°Ê±¿ìËÙ£¬Ôò×îºóÔÚ±»ÕÕ¹ËµÄÃµ¹åÊ÷ÉÏµÄÃµ¹åÀñºĞ¾ÍÔ½¶à£¬µ±Ãµ¹åÊ÷³¤´ó³É¿ªÂúÃµ¹å»¨µÄÃµ¹åÊ÷£¬Äã¿ÉÒÔ²ÉÕªÄãÖÖµÄÃµ¹åÊ÷ÉÏµÄÃµ¹åÀñºĞ£¬ÖÖÏàË¼¶¹²»ĞèÒª×é¶Ó£¬ÖÖÏàË¼Ê÷Ò²ĞèÒª½½Ë®£¬³ı³æ£¬°Î²İ£¬Ê©·Ê£¬ËùÒÔ£¬ÕâĞ©¹¤×÷×öµÄÔ½¼°Ê±£¬×îºóÊÕµ½µÄ½±Æ·¾ÍÔ½·á¸»£¬ÏàË¼Ê÷³É³¤ºó£¬ÏÀÊ¿¿ÉÒÔ²ÉÕªÏàÓ¦ÊıÁ¿µÄÏàË¼ÀñºĞ¡£"},
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
	szName = "NhËn D©y Hång ë chç NguyÖt L·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{GetHongXian,0,"H«m nay ng­¬i ®· nhËn D©y Hång råi","=="} },
		{"ThisActivity:CheckHongXian",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn ®¹o cô"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHongXian",	{nil} },
		{"ThisActivity:SetValentineRandNumber",	{ValentineNumber} },
		{"ThisActivity:AddTaskDaily",	{GetHongXian,1} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "ÔÚCh­ëng §¨ng Cung N÷´¦NhËn H¹t Gièng Hoa Hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§Ëu T­¬ng T­ vµ H¹t Gièng C©y Hoa Hång tiÓu hiÖp ng­¬i chØ ®­îc nhËn 1 trong hai lo¹i, tiÓu hiÖp nÕu ng­¬i muèn nhËn H¹t Gièng C©y Hoa Hång, cÇn ph¶i tháa m·n 1 trong 2 ®iÒu kiÖn d­íi ®©y<enter>1. Hai ng­êi ch¬i kh¸c giíi tİnh tæ ®éi víi nhau, Sè Nh©n Duyªn cña 2 ng­êi ch¬i cïng tæ ®éi ph¶i lµ sè ch½n ( sè cÆp ch½n )<enter>2. Phu thª 2 ng­êi tæ ®éi víi nhau"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn H¹t Gièng Hoa Hång",9} },
		{"AddDialogOpt",	{"§Ó ta suy nghÜ kü l¹i xem",4} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "ÔÚCh­ëng §¨ng Cung N÷´¦NhËn §Ëu T­¬ng T­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§Ëu T­¬ng T­ vµ H¹t Gièng C©y Hoa Hång tiÓu hiÖp ng­¬i chØ cã thÓ nhËn 1 trong 2 lo¹i nµy, tiÓu hiÖp ng­¬i ch­a t×m ®­îc nh©n duyªn cña m×nh ­, ng­¬i cã thÓ nhËn 1 §Ëu T­¬ng T­ ë chç cña ta råi ®i trång, chØ cã ®iÒu phÇn th­ëng trång §Ëu T­¬ng T­ kh«ng phong phó b»ng trång C©y Hoa Hång, tiÓu hiÖp hay lµ ng­¬i nhanh chãng ®i t×m nh©n duyªn cña m×nh ®i."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn §Ëu T­¬ng T­",10} },
		{"AddDialogOpt",	{"§Ó ta suy nghÜ kü l¹i xem",4} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "NhËn H¹t Gièng Hoa Hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckGetMeiGuiHuaZiCondition",	{nil} },
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"Sè lÇn nhËn ®· dïng hÕt",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn ®¹o cô"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2697,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"LÔ T×nh Nh©n n¨m 2011, nhËn ®­îc H¹t Gièng Hoa Hång"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "NhËn §Ëu T­¬ng T­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"Sè lÇn nhËn ®· dïng hÕt",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn ®¹o cô"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2698,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"LÔ T×nh Nh©n n¨m 2011, nhËn ®­îc §Ëu T­¬ng T­"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Sö dông Quúnh T­¬ng Ngäc DiÖp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2703,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckQJYYTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{QJYY_ExGetSeedTime,1} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
