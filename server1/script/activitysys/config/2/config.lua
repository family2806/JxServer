Include("\\script\\activitysys\\config\\2\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click big xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i Tïng Gi¸ng Sinh"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng Gi¸ng Sinh",5} },
		{"AddDialogOpt",	{"NhËn C©y Th«ng Gi¸ng Sinh",2} },
		{"AddDialogOpt",	{"NhËn TÊt Gi¸ng Sinh",3} },
		{"AddDialogOpt",	{"§æi thµnh phÇn th­ëng",4} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "nil",
	szName = "get xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT,"H«m nay ng­¬i ®· nhËn C©y Th«ng Gi¸ng Sinh råi, ngµy mai h·y quay l¹i.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_TREE,MAX_GET_TREE_LIMIT,EVENT_LOG_TITLE,"get xmas tree"} },
		{"ThisActivity:AddTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "get xmas stocking",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT,"H«m nay ng­¬i ®· nhËn TÊt Gi¸ng Sinh råi, ngµy mai h·y quay l¹i.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_STOCKING,MAX_GET_STOCKING_LIMIT,EVENT_LOG_TITLE,"get xmas stocking"} },
		{"ThisActivity:AddTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "get award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TÝch LÞch ®¬n",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nãn gi¸ng sinh",ITEM_XMAS_HAT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_AWARD,1,EVENT_LOG_TITLE,"exchange award"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "event introduction",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vµo lóc 0:00 ngµy 1 th¸ng 12 n¨m 2011 ®Õn 24:00 ngµy 31 th¸ng 12 n¨m 2011, nh÷ng ®¹i hiÖp cÊp 150 trë lªn ( trïng sinh kh«ng giíi h¹n cÊp ®é) cã thÓ tham gia ho¹t ®éng, ®¹i hiÖp cã thÓ ®Õn §¹i Tïng Gi¸ng Sinh t¹i L©m An (198,184), Ph­îng T­êng (198,199), BiÖn Kinh (213,195), §¹i Lý (202,198), T­¬ng D­¬ng (198,201), Thµnh §«(392,316) nhËn C©y Th«ng Gi¸ng Sinh vµ TÊt Gi¸ng Sinh, ®¹i hiÖp cã thÓ ë trong thµnh nhÊn chuét ph¶i ®Ó sö dông ®¹o cô C©y Th«ng Gi¸ng Sinh, nhËn ®­îc mét C©y Th«ng Gi¸ng Sinh, ®¹i hiÖp cã thÓ sö dông Qu¶ Gi¸ng Sinh, §Ìn Lång Gi¸ng Sinh, Kño Gi¸ng Sinh, Chu«ng Gi¸ng Sinh, Sao Gi¸ng Sinh ®Ó trang trÝ cho C©y Th«ng Gi¸ng Sinh, ®Ó nhËn ®­îc phÇn th­ëng, Qu¶ Gi¸ng Sinh, §Ìn Lång Gi¸ng Sinh, Qu¶ Gi¸ng Sinh, Chu«ng Gi¸ng Sinh, Sao Gi¸ng Sinh cã thÓ ®¸nh qu¸i r¬i ra t¹i Tr­êng B¹ch S¬n Nam, Kháa Lang §éng, Sa M¹c TÇng 3, M¹c Cao QuËt, TiÕn Cóc §éng. Mçi ngµy vµo lóc 19:00 - 23:00, ®¹i hiÖp cã thÓ mang theo TÊt Gi¸ng Sinh ®Õn §Ønh Tr­êng B¹ch ( T­¬ng D­¬ng-ThÇn BÝ Th­¬ng Nh©n LiÔu Êt-§Ønh Tr­êng B¹ch) ®Ó thu thËp LÔ VËt Gi¸ng Sinh, lÔ vËt sÏ v« cïng hÊp dÉn ®Êy! §Æc biÖt trong thêi gian diÔn ra ho¹t ®éng trong Kú Tr©n C¸c cßn cã vËt phÈm Mò Gi¸ng Sinh, ®¹i hiÖp cã thÓ mang theo Mò Gi¸ng Sinh ®i ®Õn §¹i Tïng Gi¸ng Sinh ®æi lÊy Cµn Kh«n TÝch LÞch §¬n, Cµn Kh«n TÝch LÞch §¬n nµy cã uy lùc v« song, cã thÓ sö dông nã ®Ó ®¸no b¹i ¸c Lang T¶ Sø, ¸c Lang T¶ Sø Èn nÊp trong ¸c Lang Cèc, ®¹i hiÖp cã thÓ th«ng qua Xa Phu t¹i c¸c thµnh thÞ ®Ó ®i vµo ¸c Lang Cèc, ®¸nh b¹i ¸c Lang T¶ Sø cã thÓ nhËn ®­îc phÇn th­ëng v« cïng phong phó .",0},
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
	szMessageType = "ServerStart",
	szName = "add big xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"§¹i Tïng Gi¸ng Sinh",XMAS_BIG_TREE_ID,XMAS_BIG_TREE_POS} },
		{"ThisActivity:CreateAmbienceNpc",	{nil} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "use xmas tree",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_XMAS_TREE},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskbyTime",	{TSKI_USE_TREE_TIME,60} },
		{"PlayerFunLib:IsFightState",	{0, "ChØ cã thÓ sö dông t¹i nh÷ng khu vùc phi chiÕn ®Êu."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"PlayerFunLib:CheckTaskDaily",	{2915,6,"Sö dông vËt phÈm ®¹t giíi h¹n ngµy.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{2915,1} },
		{"ThisActivity:UseTree",	{nil} },		
		{"ThisActivity:SetTaskByNowTime",	{TSKI_USE_TREE_TIME} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "use pilidan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2739,-1,-1,-1},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
		{"ThisActivity:CheckTaskDaily",	{TSKI_PILIDAN_EXP_LIMIT,MAX_PILIDAN_EXP_LIMIT,"Sö dông vËt phÈm ®¹t giíi h¹n ngµy.","<"} },
		{"ELangGuWorld:UseItemKillNpc",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSKI_PILIDAN_EXP_LIMIT,1} },
		{"ThisActivity:UsePiLiDan",	{nil} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "map321 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"321"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_APPLE,1,25} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "map75 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"75"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_LANTERN,1,25} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "map227 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CANDY,1,25} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "map340 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"340"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_BELL,1,25} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "NpcOnDeath",
	szName = "map93 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_STAR,1,25} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "map322 drop apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"322"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_APPLE,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_LANTERN,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CANDY,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_BELL,1,5} },
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_STAR,1,5} },
	},
}
