Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

local tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Hµng rong b¸n vá bãng hoµng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua vá bãng hoµng kim",2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "Hµng rong b¸n vá bãng hoµng kim_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vá bãng hoµng kim",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2358,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]GhÐp thµnh vá bãng hoµng kim"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp sinh ra tói nguyªn liÖu_th¾ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]Tèng kim cho ra tói nguyªn liÖu"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp cho ra tói nguyªn liÖu_Hßa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]Tèng kim cho ra tói nguyªn liÖu"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp cho ra tói nguyªn liÖu_Thua",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]Tèng kim cho ra tói nguyªn liÖu"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "Tèng kim cao cÊp cho ra tói nguyªn liÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]V­ît ¶i cho ra tói nguyªn liÖu"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Phong L¨ng §é cho ra tói nguyªn liÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},200,"[WC 2010]Phong L¨ng §é cho ra tói nguyªn liÖu"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô s¸t thñ cho ra tói nguyªn liÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},200,"[WC 2010]NhiÖm vô s¸t thñ cho ra tói nguyªn liÖu"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông tói nguyªn liÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2360,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{63,1,"[WC 2010]Sö dông tói nguyªn liÖu"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "T¹i lÔ quan hîp thµnh bãng da",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ghÐp thµnh lo¹i bãng nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"GhÐp thµnh bãng da",11} },
		{"AddDialogOpt",	{"GhÐp thµnh bãng hoµng kim",12} },
		{"AddDialogOpt",	{"GhÐp thµnh bãng b¹ch kim",13} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "GhÐp thµnh bãng da",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bãng da",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ruét cao su",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"ChÊt dÎo",{tbProp={6,1,2362,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2363,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]GhÐp thµnh bãng da"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "GhÐp thµnh bãng hoµng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bãng hoµng kim",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ruét cao su",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"ChÊt dÎo",{tbProp={6,1,2362,1,0,0},},1} },
		{"AddOneMaterial",	{"Vá bãng hoµng kim",{tbProp={6,1,2358,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2364,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]GhÐp thµnh bãng hoµng kim"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "GhÐp thµnh bãng b¹ch kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bãng b¹ch kim",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ruét cao su",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"ChÊt dÎo",{tbProp={6,1,2362,1,0,0},},1} },
		{"AddOneMaterial",	{"Vá bãng b¹ch kim",{tbProp={6,1,2359,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2365,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]GhÐp thµnh bãng b¹ch kim"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "Sö dông bãng da",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2363,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"CÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{1,500,"Sö dông bãng da×î¶àÖ»µÃ500000000 ¾­Ñé","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,0,"[WC 2010]Sö dông bãng da»ñµÃ¾­Ñé"} },
		{"ThisActivity:AddTask",	{1,1} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "Sö dông bãng hoµng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2364,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"CÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"ThisActivity:CheckTask",	{2,4000,"Sö dông bãng hoµng kimºÍBãng b¹ch kim×î¶à×Ü¹²Ö»µÃ 4000000000 ¾­Ñé","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2000000,0,"[WC 2010]Sö dông bãng hoµng kim»ñµÃ¾­Ñé"} },
		{"ThisActivity:AddTask",	{2,2} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "Sö dông bãng b¹ch kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2365,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"CÊp 50 trë lªn míi cã thÓ sö dông",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"×°±¸ÐèÒª10¸ö¿Õ²ÛÒÔÉÏ²ÅÄÜSö dông bãng b¹ch kim"} },
		{"ThisActivity:CheckTask",	{2,4000,"Sö dông bãng hoµng kimºÍBãng b¹ch kim×î¶à×Ü¹²Ö»µÃ4000000000 ¾­Ñé","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{64,1,"[WC 2010]Sö dông bãng b¹ch kim»ñµÃ½±Æ·"} },
		{"ThisActivity:ExecActivityDetail",	{17} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "nil",
	szName = "Sö dông bãng b¹ch kim_¾­Ñé",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{2,4000,"Sö dông bãng hoµng kimºÍBãng b¹ch kim×î¶à×Ü¹²Ö»µÃ4000000000 ¾­Ñé","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{65,1,"[WC 2010]Sö dông bãng b¹ch kim»ñµÃ¾­Ñé½±Àø"} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông Bæ HuyÕt §¬n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2366,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{3,1000,"Sö dông Bæ HuyÕt §¬n nhiÒu nhÊt chØ ®­îc 1000000000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[WC 2010]Sö dông bæ huyÕt ®¬n t¨ng kinh nghiÖm"} },
		{"ThisActivity:AddTask",	{3,10} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "LÔ quan ghÐp trang bÞ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>§¹i hiÖp muèn ghÐp thµnh lo¹i trang bÞ nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"GhÐp thµnh Vinh DiÖu Chi Y",20} },
		{"AddDialogOpt",	{"GhÐpt hµnh TiÓu tóc chi ngoa",21} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "GhÐp thµnh Vinh DiÖu Chi Y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vinh DiÖu Chi Y",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"TiÓu CÇu chi y",{tbProp={6,1,2367,1,0,0},},99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,214},nQuality=1,nExpiredTime=86400,},1,"[WC 2010]GhÐp thµnh Vinh DiÖu Chi Y"} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "GhÐpt hµnh TiÓu tóc chi ngoa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TiÓu tóc chi ngoa",0,2,2,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"TiÓu tóc chi ngoa",{tbProp={6,1,2368,1,0,0},},99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,215},nQuality=1,nExpiredTime=86400,},1,"[WC 2010]GhÐpt hµnh TiÓu tóc chi ngoa"} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ClickNpc",
	szName = "LÔ quan giíi thiÖu ho¹t ®éng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÔ Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng chµo mõng WORLDCUP",23} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "LÔ quan giíi thiÖu ho¹t ®éng_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Chµo mõng ngµy héi bãng ®¸ lín nhÊt hµnh tinh, trong kho¶ng 11/06/2010 – 0h ngµy 28/06/2010, quý ®ång ®¹o cã thÓ tham gia c¸c ho¹t ®éng víi nhiÒu phÇn th­ëng hÊp dÉn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ®Õn ®Ó ghÐp bãng da",10} },
		{"AddDialogOpt",	{"Ta ®Õn ghÐp trang bÞ",19} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(15, tbConfig)
