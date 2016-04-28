Include("\\script\\activitysys\\config\\28\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Ng­êi choi click vµo L·o N«ng CÇn Cï",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L·o N«ng CÇn Cï"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Mïa xu©n ®· ®Õn, ta muèn trång thªm mét Ýt hoa mµu ë ngoµi th«n chóng ta"} },
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng TiÕt Trång C©y",2} },
		{"AddDialogOpt",	{"NhËn Thïng Gç",3} },
		{"AddDialogOpt",	{"§­a L·o N«ng mét Thïng N­íc",4} },
		{"AddDialogOpt",	{"§­a L·o N«ng Long ¢m Th¸nh Thñy",5} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu ho¹t ®éng TiÕt Trång C©y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>´ºÌìµ½ÁË£¬ÎÒÏë¶àÖÖ»¨£¬´Ó2011Äê03ÔÂ28ÈÕ0Ê±µ½2011Äê04ÔÂ04ÈÕ24Ê±£¬Ð¡ÏÀ¿ÉÒÔµ½ÎÒÕâNhËn Thïng Gç£¬È»ºóµ½ÖìÏÉÕò(206,189), ÁúÈªÕò (223,189)»òÕßÊ¯¹ÄÕò (217,184)µÄË®Ì¶°ïÎÒÌáË®£¬Ã¿ÌìÃ¿ÈË×î¶àÖ»ÄÜÄÃ5´Î£¬Ð¡ÏÀÒª°ÑË®ÌáÂú¸øÎÒ£¬ÎÒ½«¸øÄã·áºñµÄ½±Àø£»Èç¹ûÄã¿ÉÒÔ°ÑLong ¢m Th¸nh Thñy´ø¸øÎÒ£¬ÎÒ½«ËÍÄã·á¸»½±Æ·£¬µ±ÎÒ»ñµÃLong ¢m Th¸nh ThñyÊýÁ¿´ïµ½500´Î£¬Èç¹ûÔÚ15·ÖÖÓÄÚÄã²»ÄÜ´ò°ÜËû£¬ÄÇÄ¾¿Í½«Àë¿ªÄÇÀï£¬Long ¢m Th¸nh Thñy¿ÉÒÔÔÚÆæÕä¸óÕÒµ½¡£.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "NhËn Thïng Gç",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"ÄãµÄµÈ¼¶²»¹»£¬²»ÄÜNhËn Thïng Gç",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
		{"ThisActivity:CheckMuTong",	{nil} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H«m nay ng­¬i ®· vÊt v¶ l¾m råi, ngµy mai l¹i ®Õn nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGetMuTong",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "§­a L·o N«ng mét Thïng N­íc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2737,1,0,0},},1,"Nhanh ch©n ®i lÊy ®Çy n­íc cho ta"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H«m nay ng­¬i ®· vÊt v¶ l¾m råi, hay lµ nghØ ng¬i ®i råi ngµy mai l¹i ®Õn nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveMuTong",	{nil} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§­a L·o N«ng Long ¢m Th¸nh Thñy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2738,1,0,0},},1,"Ta kh«ng cã Long ¢m Th¸nh Thñy"} },
		{"AddOneMaterial",	{"Long ¢m Th¸nh Thñy",{tbProp={6,1,2738,1,0,0},},1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveLongYinShengShui",	{nil} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "Sever më sÏ ®¨ng t¶i NPC",
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
