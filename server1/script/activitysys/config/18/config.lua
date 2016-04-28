Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
local nCloseDate		= 20100816
local nCloseTime		= 201008160000
local nItemUseDate		= 20100823
local nTask_LittleWord		= 1
local nTask_MiddleWord		= 2
local nTask_FightToken_ChenDu		= 3
local nTask_FightToken_DaLi		= 4
local nTask_FightToken_FengXiang		= 5
local nTask_FightToken_XiangYang		= 6
local nTask_FightToken_BianJin		= 7
local nTask_FightToken_LinAn		= 8
local nTask_FightToken_YangZhou		= 9
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

local tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\seven_city_war\\themeactivities\\support.lua"} },
	},
	tbActition = 
	{
		{"tbSevenCityWar_Theme:AddNpc",	{nCloseDate} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "§¸nh qu¸i rít ®¹i hØ b¶o h¹p",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80,90"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2403,1,0,0},nExpiredTime=nCloseDate,},1,"1.5"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p_th¾ng",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho¹t ®éng chİnh PBM][Tèng Kim cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p_hßa",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho¹t ®éng chİnh PBM][Tèng Kim cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p_thua",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho¹t ®éng chİnh PBM][Tèng Kim cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V­ît ¶i cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[Ho¹t ®éng chİnh PBM][V­ît ¶i cao cÊp nhËn ®­îc ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Phong L¨ng §é nhËn ®­îc ®¹i c¸t b¶o h¹p",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},150,"[Ho¹t ®éng chİnh PBM][Phong L¨ng §é nhËn ®­îc ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô s¸t thñ nhËn ®­îc ®¹i c¸t b¶o h¹p",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},120,"[Ho¹t ®éng chİnh PBM][NhiÖm vô s¸t thñ nhËn ®­îc ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông ®¹i hØ b¶o h¹p",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2403,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{76,1,"[Ho¹t ®éng chİnh PBM][Sö dông ®¹i hØ b¶o h¹p]"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Sö dông ®¹i c¸t b¶o h¹p",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2404,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{77,1,"[Ho¹t ®éng chİnh PBM][Sö dông ®¹i c¸t b¶o h¹p]"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo B¶o B¶o Ca",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"B¶o B¶o Ca"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Nh©n dŞp chµo mõng sù kiÖn ra m¾t Phiªn B¶n Míi, c¸c vŞ ®¹i hiÖp cã thÓ thu thËp c¸c nguyªn liÖu cÇn thiÕt ®Ó ®æi lÊy nh÷ng b¶o vËt quı hiÕm cña ta!"} },
		{"AddDialogOpt",	{"§æi tiÓu tù khung",12} },
		{"AddDialogOpt",	{"§æi trung tù khung (huyÒn tinh)",13} },
		{"AddDialogOpt",	{"§æi trung tù khung (Phóc duyªn lé)",14} },
		{"AddDialogOpt",	{"§æi trang bŞ phiªn b¶n míi",15} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "§æi tiÓu tù khung",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"TiÓu Tù Khung",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ThÊt",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Thµnh",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"§¹i",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ChiÕn",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=10000},1} },
		{"AddOneMaterial",	{"TiÓu Phóc Duyªn Lé ",{tbProp={6,1,122,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2418,1,0,0},nExpiredTime=nItemUseDate,},1,"[Ho¹t ®éng chİnh PBM][§æi tiÓu tù khung]"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "§æi trung tù khung (huyÒn tinh)",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Trung Tù Khung",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ThÊt",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Thµnh",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"§¹i",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ChiÕn",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=60000},1} },
		{"AddOneMaterial",	{"HuyÒn Tinh cÊp 4",{tbProp={6,1,147,4,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[Ho¹t ®éng chİnh PBM][§æi trung tù khung]"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "§æi trung tù khung (Phóc duyªn lé)",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Trung Tù Khung",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ThÊt",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Thµnh",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"§¹i",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ChiÕn",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=40000},1} },
		{"AddOneMaterial",	{"§¹i Phóc Duyªn Lé ",{tbProp={6,1,124,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[Ho¹t ®éng chİnh PBM][§æi trung tù khung]"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "§æi trang bŞ phiªn b¶n míi",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"Trang bŞ phiªn b¶n míi",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ThÊt",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"Thµnh",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"§¹i",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ChiÕn",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"M¶nh thiªn th­",{tbProp={6,1,2409,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{78,1,"[Ho¹t ®éng chİnh PBM][§æi trang bŞ phiªn b¶n míi]"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "Sö dông tiÓu tù khung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2418,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh©n vËt cÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{nTask_LittleWord,999,"Mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông 999 tiÓu tù khung","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_LittleWord,1} },
		{"PlayerFunLib:AddExp",	{1000000,0,"[Ö÷»î¶¯PBM][Sö dông tiÓu tù khung]"} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Sö dông tiÓu tù khung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2419,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh©n vËt cÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"Mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông trung tù khung, thÊt tinh béi, thµnh v­¬ng kh«i, ®¹i th¸nh gi¸p, chiÕn thÇn ngoa tæng céng 999 c¸i","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{2500000,0,"[Ho¹t ®éng chİnh PBM][Sö dông trung tù khung]"} },
		{"PlayerFunLib:GetAward",	{79,1,"[Ho¹t ®éng chİnh PBM][Sö dông trung tù khung]"} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông thÊt tinh béi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2420,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh©n vËt cÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"Mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông trung tù khung, thÊt tinh béi, thµnh v­¬ng kh«i, ®¹i th¸nh gi¸p, chiÕn thÇn ngoa tæng céng 999 c¸i","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"ĞèÒªÁôÁ½¸öÒÔÉÏ¿ÕÎ»²ÅÄÜSö dông thÊt tinh béi£¬³ÉÍõ¿ø£¬§¹iÊ¥¼×£¬ChiÕnÉñÑ¥"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{4000000,0,"[Ö÷»î¶¯PBM][Sö dông thÊt tinh béi]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ö÷»î¶¯PBM][Sö dông thÊt tinh béi]"} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "Sö dông thµnh v­¬ng kh«i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2421,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh©n vËt cÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"Mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông trung tù khung, thÊt tinh béi, thµnh v­¬ng kh«i, ®¹i th¸nh gi¸p, chiÕn thÇn ngoa tæng céng 999 c¸i","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"ĞèÒªÁôÁ½¸öÒÔÉÏ¿ÕÎ»²ÅÄÜSö dông thÊt tinh béi£¬³ÉÍõ¿ø£¬§¹iÊ¥¼×£¬ChiÕnÉñÑ¥"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{6000000,0,"[Ö÷»î¶¯PBM][Sö dông thµnh v­¬ng kh«i]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ho¹t ®éng chİnh PBM][Sö dông thµnh v­¬ng kh«i]"} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "Sö dông ®¹i th¸nh gi¸p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2422,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh©n vËt cÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"Mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông trung tù khung, thÊt tinh béi, thµnh v­¬ng kh«i, ®¹i th¸nh gi¸p, chiÕn thÇn ngoa tæng céng 999 c¸i","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"ĞèÒªÁôÁ½¸öÒÔÉÏ¿ÕÎ»²ÅÄÜSö dông thÊt tinh béi£¬³ÉÍõ¿ø£¬§¹iÊ¥¼×£¬ChiÕnÉñÑ¥"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{8000000,0,"[Ö÷»î¶¯PBM][Sö dông ®¹i th¸nh gi¸p]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ö÷»î¶¯PBM][Sö dông ®¹i th¸nh gi¸p]"} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Sö dông chiÕn thÇn ngoa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2423,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"Nh©n vËt cÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"Mçi nh©n vËt nhiÒu nhÊt chØ cã thÓ sö dông trung tù khung, thÊt tinh béi, thµnh v­¬ng kh«i, ®¹i th¸nh gi¸p, chiÕn thÇn ngoa tæng céng 999 c¸i","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"ĞèÒªÁôÁ½¸öÒÔÉÏ¿ÕÎ»²ÅÄÜSö dông thÊt tinh béi£¬³ÉÍõ¿ø£¬§¹iÊ¥¼×£¬ChiÕnÉñÑ¥"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯PBM][Sö dông chiÕn thÇn ngoa]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[Ö÷»î¶¯PBM][Sö dông chiÕn thÇn ngoa]"} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Sö dông thµnh ®« huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2411,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_ChenDu,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_ChenDu,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯ PBM][Sö dông thµnh ®« huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "Sö dông ®¹i lı huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2412,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_DaLi,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_DaLi,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯ PBM][Sö dông ®¹i lı huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "Sö dông ph­îng t­êng huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2413,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_FengXiang,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_FengXiang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯PBM][Sö dông ph­îng t­êng huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "Sö dông ph­îng t­êng huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2414,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_XiangYang,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_XiangYang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯ PBM][Sö dông ph­îng t­êng huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "Sö dông biÖn kinh huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2415,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_BianJin,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_BianJin,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯PBM][Sö dông biÖn kinh huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "Sö dông l©m an huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2416,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_LinAn,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_LinAn,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯PBM][Sö dông l©m an huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "Sö dông d­¬ng ch©u huyÕt chiÕn lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2417,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_YangZhou,20,"Cïng 1 lo¹i thµnh thŞ huyÕt chiÕn lÖnh chØ cã thÓ sö dông 20 c¸i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_YangZhou,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[Ö÷»î¶¯PBM][Sö dông d­¬ng ch©u huyÕt chiÕn lÖnh]"} },
	},
}
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo long nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"BĞ Long"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi nhÊt kû cµn kh«n phï",30} },
		{"AddDialogOpt",	{"§æi mÆt n¹ cæ truyÒn",31} },
		{"AddDialogOpt",	{"§æi mÆt n¹ ¸o dµi",32} },
		{"AddDialogOpt",	{"§æi mÆt n¹ quû ¶nh",33} },
		{"AddDialogOpt",	{"§æi mÆt n¹ cöu mÖnh",34} },
	},
}
tbConfig[30] = --Ò»¸öÏ¸½Ú
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "§æi nhÊt kû cµn kh«n phï",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"NhÊt Kû Cµn Kh«n Phï",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=43200,},1,"[Ho¹t ®éng chİnh PBM][§æi 1 nhÊt kû cµn kh«n phï]"} },
	},
}
tbConfig[31] = --Ò»¸öÏ¸½Ú
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ cæ truyÒn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"MÆt n¹ cæ truyÒn",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,469,1,0,0},nExpiredTime=10080,},1,"[Ho¹t ®éng chİnh PBM][§æi mÆt n¹ cæ truyÒn]"} },
	},
}
tbConfig[32] = --Ò»¸öÏ¸½Ú
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ ¸o dµi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"MÆt n¹ ¸o dµi",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,470,1,0,0},nExpiredTime=10080,},1,"[Ho¹t ®éng chİnh PBM][§æi mÆt n¹ ¸o dµi]"} },
	},
}
tbConfig[33] = --Ò»¸öÏ¸½Ú
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ quû ¶nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"MÆt n¹ quû ¶nh",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[Ho¹t ®éng chİnh PBM][§æi mÆt n¹ quû ¶nh]"} },
	},
}
tbConfig[34] = --Ò»¸öÏ¸½Ú
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ cöu mÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"MÆt n¹ cöu mÖnh",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[Ho¹t ®éng chİnh PBM][§æi mÆt n¹ cöu mÖnh]"} },
	},
}
tbConfig[35] = --Ò»¸öÏ¸½Ú
{
	nId = 35,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo ThÈm C©u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThÈm C©u"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi ngùa",36} },
	},
}
tbConfig[36] = --Ò»¸öÏ¸½Ú
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "§æi ngùa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ngùa",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ThÇn Hµnh To¸i PhiÕn",{tbProp={6,1,2410,1,0,0},},81} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{81,1,"[Ho¹t ®éng chİnh PBM][§æi ngùa]"} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(18, tbConfig)
