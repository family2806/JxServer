Include("\\script\\activitysys\\config\\25\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
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
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Click vµo Nguyªn §¶n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguyªn §¶n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng ®Ëp trøng vui vÎ",3} },
		{"AddDialogOpt",	{"ÓÃNguyªn §¶n½ğ´¸ÔÒµ°",21} },
		{"AddDialogOpt",	{"ÓÃNguyªn §¶nÒø´¸ÔÒµ°",22} },
		{"AddDialogOpt",	{"ÓÃNguyªn §¶nÍ­´¸ÔÒµ°g",23} },
		{"AddDialogOpt",	{"Ê¹ÓÃNguyªn §¶nÒø´¸ºÍ½ğ´¸»ñµÃ½±Àø´ÎÊı´ïµ½200´Î",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ ®au ]] or [[ ®¹i hiÖp xin ®õng …]]/>"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu ho¹t ®éng ®Ëp trøng vui vÎ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"´Ó2010Äê12ÔÂ21ÈÕ0hµ½2011Äê1ÔÂ10ÈÕ24h£¬ ´óÏÀ¿ÉÒÔÄÃ×ÅNguyªn §¶nÍ­´¸¡¢Nguyªn §¶nÒø´¸¡¢Nguyªn §¶n½ğ´¸µ½'Nguyªn §¶n'´¦ÔÒµ°£¬Äã½«»ñµÃÒâÍâ¾ªÏ²£¬´óÏÀÈç¹ûÏëÓÃNguyªn §¶nÒø´¸¡¢Nguyªn §¶nÍ­´¸ÔÒµ°£¬³ıÁËĞèÒªÓĞÏëÒªµÄ´¸Íâ£¬»¹ĞèÒªÂú×ãÒÔÏÂÁ½¸öÌõ¼ş<enter>1£¬ĞèÒªÓë3ÈË×é¶Ó£¬3ÈË×é¶ÓĞèÒª´÷ÔÚãê¾©¡¢ÏåÑô»òÕßÁÙ°²LÔ Quan´¦ÁìÈ¡µÄÒ×ÈİÃæ¾ß<enter>2£¬3ÈË×é¶ÓĞèÒª´÷ÑÕÉ«ÏàÍ¬¡¢ÍâĞÎ²»Í¬µÄÒ×ÈİÃæ¾ß<enter> ÓÃNguyªn §¶n½ğ´¸Ôò²»ĞèÒªÈÎºÎÌõ¼ş£¬ÆäÖĞ£¬Nguyªn §¶nÍ­´¸¿ÉÒÔÔÚLÔ Quan´¦ÁìÈ¡£¬Nguyªn §¶nÒø´¸¿ÉÒÔÔÚ²Î¼ÓÏµÍ³ÓÎÏ·ÖĞÁìÈ¡£¬Nguyªn §¶n½ğ´¸¿ÉÒÔÔÚÆæÕä¸óÁìÈ¡¡£"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "ÓÃNguyªn §¶n½ğ´¸ÔÒµ°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"´Ë´Î»î¶¯Ê¹ÓÃµÄNguyªn §¶nÒø´¸ºÍ½ğ´¸×î¶àÎª200´Î","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("Kh«ng cã <color=yellow>%s<color> kh«ng thÓ ®Ëp trøng","Nguyªn §¶n½ğ´¸")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Nguyªn §¶n½ğ´¸")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Nguyªn §¶n½ğ´¸"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "ÓÃNguyªn §¶nÒø´¸ÔÒµ°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"´Ë´Î»î¶¯Ê¹ÓÃµÄNguyªn §¶nÒø´¸ºÍ½ğ´¸×î¶àÎª200´Î","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("Kh«ng cã <color=yellow>%s<color> kh«ng thÓ ®Ëp trøng","Nguyªn §¶nÒø´¸")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Nguyªn §¶nÒø´¸")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Nguyªn §¶nÒø´¸")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "ÓÃNguyªn §¶nÍ­´¸ÔÒµ°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"Nguyªn §¶nÍ­´¸Ã¿Ìì×î¶àÖ»ÄÜÓÃ5´Î","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("Kh«ng cã <color=yellow>%s<color> kh«ng thÓ ®Ëp trøng","Nguyªn §¶nÍ­´¸")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Nguyªn §¶nÍ­´¸")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Nguyªn §¶nÍ­´¸")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "Ê¹ÓÃNguyªn §¶nÒø´¸ºÍ½ğ´¸»ñÈ¡½±ÀøÒÑ´ï200´Î",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"´óÏÀÃ»ÓĞÊ¹ÓÃ¹»200´ÎNguyªn §¶nÒø´¸ºÍ½ğ´¸£¬¼ÌĞø¼ÓÓÍÅ¶",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"B¹n ®·  lÜnh th­ëng råi","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"Ê¹ÓÃNguyªn §¶nÒø´¸ºÍ½ğ´¸»ñÈ¡½±ÀøÒÑ´ï200´Î "} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",17)} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("PhÇn th­ëng ®iÓm tİch lòy Tèng Kim cao cÊp ®¹t ®Õn %d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("PhÇn th­ëng ®iÓm tİch lòy Tèng Kim cao cÊp ®¹t ®Õn %d",3000)} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo thİ luyÖn ®­êng tr­ëng l·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr­ëng l·o Thİ LuyÖn §­êng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng §Ëp Trøng vui vÎ",25} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Phong L¨ng ®é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},10,"100"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô S¸t thñ ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s phÇn th­ëng","NhiÖm vô S¸t thñ ")} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "NhÆt qu¶ huy hoµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s phÇn th­ëng","NhÆt qu¶ huy hoµng")} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "Boss ThÕ Giíi r¬i ra",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},15,"100"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "ÁìÈ¡Nguyªn §¶nÒø´¸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("H«m nay ng­¬i ®· nhËn ë chç cña ta %s råi","Nguyªn §¶nÒø´¸"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"NhËn ë Thİ LuyÖn §­êng"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",28)} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo LÔ Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÔ Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng §Ëp Trøng vui vÎ",24} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "nil",
	szName = "NhËn MÆt N¹ DŞ Dung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("H«m nay ng­¬i ®· nhËn ë chç cña ta %s råi","Nguyªn §¶nÒ×ÈİÃæ¾ß"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"´ÓLÔ Quan´¦ÁìÈ¡"} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "nil",
	szName = "ÁìÈ¡Nguyªn §¶nÍ­´¸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("H«m nay ng­¬i ®· nhËn ë chç cña ta %s råi","Nguyªn §¶nÍ­´¸"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"´ÓLÔ Quan´¦ÁìÈ¡"} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "Khëi ®éng sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddYuanDanDialogNpc",	{nil} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "Ph¶i ch¨ng sö dông Chïy Vµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng­¬i x¸c ®Şnh muèn sö dông <color=yellow>%s<color> kh«ng?","Nguyªn §¶n½ğ´¸")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X¸c nhËn",4} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "Ph¶i ch¨ng sö dông Chïy B¹c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("ÄãX¸c nhËnÊ¹ÓÃ<color=yellow>%s<color> Âğ£¿","Nguyªn §¶nÒø´¸")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X¸c nhËn",5} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Ph¶i ch¨ng sö dông Chïy §ång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("ÄãX¸c nhËnÏëÊ¹ÓÃ <color=yellow>%s<color> Âğ?","Nguyªn §¶nÍ­´¸")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X¸c nhËn",6} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "LÔ Quan¶Ô»°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>»¶Ó­²Î¼ÓHo¹t ®éng §Ëp Trøng vui vÎ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn MÆt N¹ DŞ Dung",18} },
		{"AddDialogOpt",	{"ÁìÈ¡Nguyªn §¶nÍ­´¸",19} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "Tr­ëng l·o Thİ LuyÖn §­êng¶Ô»°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>»¶Ó­²Î¼ÓHo¹t ®éng §Ëp Trøng vui vÎ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ÁìÈ¡Nguyªn §¶nÒø´¸",15} },
	},
}
