

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
local nTask_HuDie		= 1
local nTask_XinXin		= 2
local nTask_ZhuXin_YuanXin		= 3
local nTask_ChenDu		= 4
local nTask_DaLi		= 5
local nTask_FengXiang		= 6
local nTask_XiangYang		= 7
local nTask_BianJin		= 8
local nTask_LinAn		= 9
local nTask_YangZhou		= 10
local nTask_GiveCount		= 11
local nTask_Activi_Point		= 2794
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "§¸nh qu¸i rít b¸nh h¹t sen",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"322,321,144,124,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2496,1,0,0},nExpiredTime=20101011,},1,"5"} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "§¸nh qu¸i rít b¸nh ®Ëu xanh",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"225,226,227,224,340,75"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2497,1,0,0},nExpiredTime=20101011,},1,"5"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "§¸nh qu¸i rít b¸nh khoai m«n",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2498,1,0,0},nExpiredTime=20101011,},1,"1"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp kÕt thóc tÆng b¸nh dÎo (th¾ng)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[Ho¹t ®éng trung thu] [Tèng Kim s¶n sinh b¸nh dÎo]"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp kÕt thóc tÆng b¸nh dÎo (hßa)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[Ho¹t ®éng trung thu] [Tèng Kim s¶n sinh b¸nh dÎo]"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp kÕt thóc tÆng b¸nh dÎo (thua)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[Ho¹t ®éng trung thu] [Tèng Kim s¶n sinh b¸nh dÎo]"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "ClickNpc",
	szName = "Hµng rong b¸n b¸nh nh©n thÞt",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua b¸nh nh©n thÞt",8} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Mua b¸nh nh©n thÞt",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"B¸nh nh©n thÞt",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"30000 l­îng",{nJxb=30000,},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2500,1,0,0},nExpiredTime=20101011,},1,"[ÖÐÇï»î¶¯] [ÉÌ··Mua b¸nh nh©n thÞt]"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "H»ng nga hîp thµnh",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"H»ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H»ng NgaµÆÁý",10} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "H»ng Nga»®·ÖµÈ¼¶",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"<npc>¸óÏÂÏëH»ng NgaÄÄÖÖµÆÁý?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Lång ®Ìn b­¬m b­ím",11} },
		{"AddDialogOpt",	{"§Ìn ng«i sao",12} },
		{"AddDialogOpt",	{"Lång ®Ìn èng",13} },
		{"AddDialogOpt",	{"Lång ®Ìn trßn",14} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "H»ng NgaLång ®Ìn b­¬m b­ím",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"Lång ®Ìn b­¬m b­ím",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B¸nh H¹t Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh §Ëu Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh Khoai M«n",{tbProp={6,1,2498,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2502,1,0,0},nExpiredTime=20101018,},1,"[ÖÐÇï»î¶¯] [H»ng NgaµÆÁý]"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "H»ng Nga§Ìn ng«i saoÁý",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"§Ìn ng«i saoÁý",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B¸nh H¹t Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh §Ëu Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh Khoai M«n",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh dÎo",{tbProp={6,1,2499,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2503,1,0,0},nExpiredTime=20101018,},1,"[ÖÐÇï»î¶¯] [H»ng NgaµÆÁý]"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "H»ng NgaLång ®Ìn èng",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"Lång ®Ìn èng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B¸nh H¹t Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh §Ëu Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh Khoai M«n",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh nh©n thÞt",{tbProp={6,1,2500,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2504,1,0,0},nExpiredTime=20101018,},1,"[ÖÐÇï»î¶¯] [H»ng NgaµÆÁý]"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "H»ng NgaLång ®Ìn trßn",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"Lång ®Ìn trßn",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B¸nh H¹t Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh §Ëu Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh Khoai M«n",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"B¸nh thËp cÈm",{tbProp={6,1,2501,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2505,1,0,0},nExpiredTime=20101018,},1,"[ÖÐÇï»î¶¯] [H»ng NgaµÆÁý]"} },
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","Gia t¨ng 1 ®iÓm tÝch lòy sù kiÖn"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃLång ®Ìn b­¬m b­ím",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2502,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","Xin h·y sö dông t¹i thµnh thÞ hoÆc t©n thñ th«n!"} },
		{"PlayerFunLib:IsFightState",	{1,"Xin h·y sö dông t¹i khu vùc chiÕn ®Êu!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"ThisActivity:CheckTask",	{nTask_HuDie,1000,"§¹t ®Õn kinh nghiÖm cao nhÊt, kh«ng thÓ nhËn thªm kinh nghiÖm!","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AwardExp",	{1000000, nTask_HuDie, 1000000000, "Ê¹ÓÃLång ®Ìn b­¬m b­ím", "[ÖÐÇï»î¶¯][Ê¹ÓÃLång ®Ìn b­¬m b­ím]"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃ§Ìn ng«i saoÁý",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2503,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","ÇëXin h·y sö dông t¹i thµnh thÞ hoÆc t©n thñ th«n!"} },
		{"PlayerFunLib:IsFightState",	{1,"ÇëXin h·y sö dông t¹i khu vùc chiÕn ®Êu!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"§¹i Lùc ThÞ VÖ"} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃLång ®Ìn èng",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2504,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","ÇëXin h·y sö dông t¹i thµnh thÞ hoÆc t©n thñ th«n!"} },
		{"PlayerFunLib:IsFightState",	{1,"ÇëXin h·y sö dông t¹i khu vùc chiÕn ®Êu!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"Th­êng Th¾ng ThÞ VÖ"} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃLång ®Ìn trßn",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2505,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","ÇëXin h·y sö dông t¹i thµnh thÞ hoÆc t©n thñ th«n!"} },
		{"PlayerFunLib:IsFightState",	{1,"ÇëXin h·y sö dông t¹i khu vùc chiÕn ®Êu!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"Kim C­¬ng ThÞ VÖ"} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu Thµnh §«",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2507,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_ChenDu,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu Thµnh §«]"} },
		{"ThisActivity:AddTask",	{nTask_ChenDu,1} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu §¹i Lý",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2508,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_DaLi,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu §¹i Lý"} },
		{"ThisActivity:AddTask",	{nTask_DaLi,1} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu Ph­îng T­êng",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2509,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FengXiang,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu Ph­îng T­êng]"} },
		{"ThisActivity:AddTask",	{nTask_FengXiang,1} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu T­¬ng D­¬ng",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2510,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_XiangYang,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu T­¬ng D­¬ng]"} },
		{"ThisActivity:AddTask",	{nTask_XiangYang,1} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu BiÖn Kinh",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2511,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_BianJin,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu BiÖn Kinh]"} },
		{"ThisActivity:AddTask",	{nTask_BianJin,1} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu L©m An",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2512,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_LinAn,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu L©m An]"} },
		{"ThisActivity:AddTask",	{nTask_LinAn,1} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Trung Thu D­¬ng Ch©u",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2513,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_YangZhou,20,"Trong thêi gian ho¹t ®éng, mçi lo¹i b¸nh chØ ®­îc sö dông 20 c¸i","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[ÖÐÇï»î¶¯][Sö dông B¸nh Trung Thu D­¬ng Ch©u]"} },
		{"ThisActivity:AddTask",	{nTask_YangZhou,1} },
	},
}
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddTaskNpc",	{nil} },
		{"tb2010ZhongQiu:AddDecorationNpc",	{nil} },
	},
}
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i víi H»ng Nga",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"H»ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trong thêi gian 0 gi?20/09/2010 ®Õn 0 gi?11/10/2010, ÔÚ2010Äê09ÔÂ20ÈÕÖÁ2010Äê10ÔÂ11ÈÕ£¬Í¬ÐÐ¿ÉÒÔÍ¨¹ý´ò¹Ö£¬ËÎ½ð£¬Hµng rong£¬ÆæÕä¸óÁìÈ¡¸÷ÖÖÖÐÇï±ý£¬Í¬Ê±Ò²¿ÉÒÔH»ng Nga¸÷ÖÖµÆÁý¡£ÔÚ10ÔÂ18ÈÕÇ°Ê¹ÓÃµÆÁý£¬¿ÉÒÔÕÙ»ØÖÐÇïBOSS£¬´ò°Üºó½«ÊÕµ½·á¸»µÄ½±Àø£¬Í¬Ê±¿ÉÒÔÓÉ¼Æ»®ÊÕµ½Lång ®Ìn kÐo qu©n¡£Nép lång ®Ìn kÐo qu©n¸øH»ng Nga½ã½ã£¬½«ÊÕµ½¾­Ñé½±Àø£¬½É1000,2000,3000...½«ÊÕµ½±ÈÆ½³£¸ü¶àµÄ¾­Ñé¡£H»ng NgaµÄ´ó¶È½«¸ù¾ÝÒÑ½ÉµÄLång ®Ìn kÐo qu©nÊýÁ¿¾ö¶¨¡£Ã¿Ìì20µãÈç¹ûH»ng NgaÔÚ×î´óµÄ×´Ì¬£¬½«³öÏÖ·ÅÑÌ»ðÐ§Ó¦£¬¸÷Î»Õ¾ÔÚÖÜÎ§µÄÍ¬ÐÐ¿ÉÒÔÊÕµ½¾­Ñé½±Àø¡£Ã¿Ìì20µã30·Ö£¬H»ng Nga½«»Øµ½×îÐ¡×´Ì¬£¬À­¾üµÆÊýÁ¿Ò²»Øµ½0.ÔÚ»î¶¯Ê±¼äÄÚ£¬Ã¿¸öÈË×î¶àÖ»ÄÜ½É1999¸ö¡£"} },
		{"AddDialogOpt",	{"Nép lång ®Ìn kÐo qu©n",28} },
		{"AddDialogOpt",	{"KiÓm tra sè l­îng ®· nép",34} },
	},
}
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "Nép lång ®Ìn kÐo qu©n",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"Nép lång ®Ìn kÐo qu©n",1,1,1,0.01},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "Ho¹t ®éng ®· kÕt thóc"} },
		{"lib:CheckTime",	{{{000000,200000},{203000,240000}}, "Kh«ng ph¶i lµ thêi gian ho¹t ®éng"} },
		{"AddOneMaterial",	{"Lång ®Ìn kÐo qu©n",{tbProp={6,1,2506,1,0,0},},1} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
		{"ThisActivity:CheckTask",	{nTask_GiveCount,"1999 - <ComposeCount> ","Trong thêi gian ho¹t ®éng mçi ng­êi chØ ®­îc nép 1999 c¸i!","<="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:AddExp",	{500000,0,"[ÖÐÇï»î¶¯][Nép lång ®Ìn kÐo qu©n]"} },
		{"tb2010ZhongQiu:GiveItem2HengE",	{nil} },
		{"ThisActivity:AddTask",	{nTask_GiveCount,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","Gia t¨ng 1 ®iÓm tÝch lòy sù kiÖn"} },
	},
}
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo long nhi",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"BÐ Long"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi mÆt n¹ cöu mÖnh",33} },
		{"AddDialogOpt",	{"§æi mÆt n¹ tr­êng c«ng",35} },
		{"AddDialogOpt",	{"§æi MÆt n¹ kiªn ng¹nh",36} },
		{"AddDialogOpt",	{"§æi mÆt n¹ quû ¶nh",30} },
		{"AddDialogOpt",	{"§æi håi thiªn t¸i t¹o cÈm nang",31} },
		{"AddDialogOpt",	{"§æi nhÊt kû cµn kh«n phï",32} },
	},
}
tbConfig[30] = --Ò»¸öÏ¸½Ú
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ quû ¶nh",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"MÆt n¹ quû ¶nh",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[Ho¹t ®éng trung thu][§æi quû ¶nh]"} },
	},
}
tbConfig[31] = --Ò»¸öÏ¸½Ú
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "§æi håi thiªn t¸i t¹o cÈm nang",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"CÈm nang thay ®æi trêi ®Êt",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Thêi h¹n ®æi ®· kÕt thóc"} }
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},3} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0},nExpiredTime=20160, tbParam={60}},1,"[ÖÐÇï»î¶¯][»»È¡CÈm nang thay ®æi trêi ®Êt]"} },
	},
}
tbConfig[32] = --Ò»¸öÏ¸½Ú
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "§æi nhÊt kû cµn kh«n phï",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"NhÊt Kû Cµn Kh«n Phï",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Thêi h¹n ®æi ®· kÕt thóc"} }
		{"AddOneMaterial",	{"NhÊt Kû Cµn Kh«n Phï",{tbProp={6,1,2125,1,0,0},},300} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=20160,},1,"[ÖÐÇï»î¶¯][§æi nhÊt kû cµn kh«n phï"} },
	},
}
tbConfig[33] = --Ò»¸öÏ¸½Ú
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ cöu mÖnh",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"MÆt n¹ cöu mÖnh",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Thêi h¹n ®æi ®· kÕt thóc"} }
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[ÖÐÇï»î¶¯][§æi mÆt n¹ cöu mÖnh]"} },
	},
}
tbConfig[34] = --Ò»¸öÏ¸½Ú
{
	nId = 34,
	szMessageType = "nil",
	szName = "¼ì²éÒÑNép lång ®Ìn kÐo qu©nÊýÁ¿",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "Ho¹t ®éng ®· kÕt thóc"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:ShowGiveCount",	{nTask_GiveCount} },
	},
}
tbConfig[35] = --Ò»¸öÏ¸½Ú
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "§æi mÆt n¹ tr­êng c«ng",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"MÆt n¹ tr­êng c«ng",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "§æi mÆt n¹ tr­êng c«ngÊ±ÏÞ"} }
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,479,1,0,0},nExpiredTime=10080,},1,"[ÖÐÇï»î¶¯][§æi mÆt n¹ tr­êng c«ng]"} },
	},
}
tbConfig[36] = --Ò»¸öÏ¸½Ú
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "§æi MÆt n¹ kiªn ng¹nh",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"MÆt n¹ kiªn ng¹nh",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Thêi h¹n ®æi ®· kÕt thóc"} }
		{"AddOneMaterial",	{"Ngò Hµnh Kú Th¹ch",{tbProp={6,1,2125,1,0,0},},20} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,480,1,0,0},nExpiredTime=10080,},1,"[ÖÐÇï»î¶¯][§æi MÆt n¹ kiªn ng¹nh]"} },
	},
}
