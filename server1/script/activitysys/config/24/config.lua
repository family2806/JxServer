tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "点击龙儿",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小龙"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想换披风",2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "我想换披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>只有大侠名望显赫，才能获取我绝美的披风，大侠想选择哪种?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"凌云披风",4} },
		{"AddDialogOpt",	{"绝世披风",5} },
		{"AddDialogOpt",	{"破军披风",6} },
		{"AddDialogOpt",	{"傲雪披风",10} },
		{"AddDialogOpt",	{"惊雷披风",11} },
		{"AddDialogOpt",	{"下一页",3} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "我想换披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>只有大侠名望显赫，才能获取我绝美的披风，大侠想选择哪种?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"飞风御风",12} },
		{"AddDialogOpt",	{"上一页",2} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "凌云披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"凌云披风",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},66} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3465},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "绝世披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"绝世披风",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{2} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},462} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3466},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "破军披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"破军披风",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{3} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},1386} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3467},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "傲雪披风 (转移及时)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"傲雪披风 (转移及时)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3468},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "惊雷披风(转移及时)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"飞风惊雷(转移及时)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3470},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "御风披风 (转移及时 )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"御风披风 (转移及时 )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3473},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "傲雪披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>傲雪披风<color> 有以下几种，大侠想选择哪一种?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"傲雪披风(转移及时)",7} },
		{"AddDialogOpt",	{"傲雪披风(概率化解杀枪)",13} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "惊雷披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>惊雷披风<color>有以下几种，大侠想选择哪一种?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"惊雷披风 (转移及时)",8} },
		{"AddDialogOpt",	{"惊雷披风 (概率化解杀枪)",14} },
		{"AddDialogOpt",	{"惊雷披风( 重击)",15} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "御风披风",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>御风披风<color> 有以下几种，大侠想选择哪一种?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"御风披风 (转移及时)",9} },
		{"AddDialogOpt",	{"御风披风 (概率化解杀枪)",16} },
		{"AddDialogOpt",	{"御风披风 (重击)",17} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "傲雪披风 (概率化解杀枪)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"傲雪披风 (概率化解杀枪)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3469},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "惊雷披风(概率化解杀枪)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"惊雷披风(概率化解杀枪)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3471},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "惊雷披风 ( 重击 )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"惊雷披风 ( 重击 )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3472},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "御风披风 (概率化解杀枪)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"御风披风 (概率化解杀枪)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3474},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "御风披风(重击)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"御风披风(重击)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"精炼石",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3475},nBindState = -2,nExpiredTime=10080,},1,"买披风"} },
	},
}
