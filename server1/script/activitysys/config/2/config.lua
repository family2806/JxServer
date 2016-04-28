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
		{"ThisActivity:CheckTaskDaily",	{TSKI_TREE_LIMIT,MAX_GET_TREE_LIMIT,"½ñÌìÄãÒÑ¾­NhËn C©y Th«ng Gi¸ng SinhÁË£¬Ã÷ÌìÔÙÀ´°É","<"} },
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
		{"ThisActivity:CheckTaskDaily",	{TSKI_STOCKING_LIMIT,MAX_GET_STOCKING_LIMIT,"½ñÌìÄãÒÑ¾­NhËn TÊt Gi¸ng SinhÁË£¬Ã÷ÌìÔÙÀ´°É","<"} },
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
	tbMessageParam = {"Tİch LŞch ®¬n",1,1,1,0.02},
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
	tbMessageParam = {"´Ó2011Äê12ÔÂ1ÈÕ0:00µ½2011Äê12ÔÂ31ÈÕ24:00£¬150¼¶ÒÔÉÏµÄ´óÏÀ£¨ÖØÉú²»ÊÜ¼¶±ğÏŞÖÆ£©¿ÉÒÔ²Î¼Ó»î¶¯£¬´óÏÀ¿ÉÒÔµ½ÁÖ°²(198,184),·ïÏé (198,199),ãê¾© (213,195), ´óÀí (202,198), ÏåÑô(198,201),³É¶¼(392,316) µÄ§¹i Tïng Gi¸ng SinhNhËn C©y Th«ng Gi¸ng SinhºÍÊ¥µ®Íà£¬´óÏÀ¿ÉÒÔÔÚ³ÇÄÚµã»÷Êó±êÓÒ¼üÊ¹ÓÃÊ¥µ®Ê÷µÀ¾ß£¬ÊÕµ½Ò»¿ÅÊ¥µ®Ê÷£¬´óÏÀ¿ÉÒÔÊ¹ÓÃÊ¥µ®¹û£¬Ê¥µ®µÆÁı£¬Ê¥µ®ÖÓ,Ê¥µ®ĞÇĞÇÀ´×°ÊÎÊ¥µ®Ê÷£¬À´½ÓÊÕ½±Æ·£¬Ê¥µ®¹û£¬Ê¥µ®µÆÁı£¬Ê¥µ®¹û£¬Ê¥µ®ÖÓ£¬Ê¥µ®ĞÇĞÇ¿ÉÒÔ´òÔÚ³¤°×É½ÄÏ£¬ÂãÀÇ¶´£¬µÚ3²ãÉ³Ä®£¬Äª¸ß¿ß£¬½ø¾Õ¶´ÂäÏÂµÄ¹ÖÎï¡£Ã¿Ìì19:00- 23:00, ´óÏÀ¿ÉÒÔ´ø×ÅÊ¥µ®Íàµ½³¤°×É½£¨ÏåÑô¡ªÉñÃØÉÌÈËÁøÒÒ¡ª³¤°×¶¥£©ÊÕ¼¯Ê¥µ®ÀñÎï£¬ÀñÎï»á·Ç³£ÓĞÎüÒıÁ¦Å¶£¡ÓÈÆäÊÇÔÚÆæÕä¸óÓĞ»î¶¯µÄÊ±¼äÀï£¬»¹ÓĞNãn gi¸ng sinhÎïÆ·£¬´óÏÀ¿ÉÒÔ´ø×ÅNãn gi¸ng sinhµ½§¹i Tïng Gi¸ng Sinh»»È¡Ç¬À¤Tİch LŞch ®¬n£¬´ËµÆÍşÁ¦ÎŞË«£¬¿ÉÒÔÓÃËüÀ´´ò°Ü¶öÀÇ×óÊ·£¬ËüÒş²ØÔÚ¶öÀÇ¹È¡£´óÏÀ¿ÉÒÔÍ¨¹ı¸÷³ÇÇøµÄ³µ·òµ½´ï¶öÀÇ¹È£¬´ò°Ü¶öÀÇ×óÊ·¿ÉÒÔÊÕµ½·Ç³£·á¸»µÄ½±Æ·¡£",0},
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
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thŞ vµ c¸c t©n thñ th«n."} },
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
