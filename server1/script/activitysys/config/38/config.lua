Include("\\script\\activitysys\\config\\38\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "add npc when server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "right click item named NewYear-Gift",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {"return {tbProp={6,1,3086,-1,-1,0},}"},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSK_USED_NEWYEAR_GIFT_DAILY,MAX_USED_NEWYEAR_GIFT_DAILY,"Sè lÇn sö dông cña ng­¬i h«m nay ®· ®ñ, ngµy mai h·y quay l¹i nhÐ!","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseNewYearGift",	{nil} },
		{"ThisActivity:AddTaskDaily",	{TSK_USED_NEWYEAR_GIFT_DAILY,1} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "right click item named NewYear-Fireworks",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {"return {tbProp={6,1,3087,-1,-1,0},}"},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_USED_NEWYEAR_FIREWORKS,MAX_USED_NEWYEAR_FIREWORKS,"Ng­¬i ®· nhËn ®­îc qu¸ nhiÒu phÇn th­ëng, xin h·y thö c¸i kh¸c ®i!","<"} },
		{"ThisActivity:CheckFireworksUseTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseNewYearFireworks",	{nil} },
		{"ThisActivity:AddTask",	{TSK_USED_NEWYEAR_FIREWORKS,1} },
	},
}
