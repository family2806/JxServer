Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------局部变量定义 开始---------
-------局部变量定义 结束---------

local tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "商店卖黄金球壳",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"商店"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买黄金球壳",2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "商店卖黄金壳_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"黄金球壳",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"银两",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2358,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]合成黄金球壳"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金生出原料袋_胜利",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]宋金放出原料袋"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金放出原料袋_打平",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[宋金放出原料袋"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "高级宋金放出原料袋_输",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]宋金放出原料袋"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "高级宋金放出原料袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},80,"[WC 2010]闯关放出原料袋"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡放出原料袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},200,"[WC 2010]风陵渡放出原料袋"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "杀手任务放出的原料袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2360,1,0,0},nExpiredTime=20100628,},200,"[WC 2010]杀手任务放出的原料袋"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "使用原料袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2360,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{63,1,"[WC 2010]使用原料袋"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "在礼官合成皮球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>阁下想合成哪种球?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成皮球",11} },
		{"AddDialogOpt",	{"合成黄金球",12} },
		{"AddDialogOpt",	{"合成白金球",13} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "合成皮球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"皮球",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"橡胶芯",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"粘合剂",{tbProp={6,1,2362,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2363,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]合成皮球"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "合成黄金球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"黄金球",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"橡胶芯",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"粘合剂",{tbProp={6,1,2362,1,0,0},},1} },
		{"AddOneMaterial",	{"黄金球壳",{tbProp={6,1,2358,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2364,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]合成黄金球"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "合成白金球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"白金球",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"橡胶芯",{tbProp={6,1,2361,1,0,0},},1} },
		{"AddOneMaterial",	{"粘合剂",{tbProp={6,1,2362,1,0,0},},1} },
		{"AddOneMaterial",	{"白金球壳",{tbProp={6,1,2359,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2365,1,0,0},nExpiredTime=20100628,},1,"[WC 2010]合成白金球"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "使用皮球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2363,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上才能使用",">="} },
		{"ThisActivity:CheckTask",	{1,500,"使用皮球最多只得500000000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,0,"[WC 2010]使用皮球获得经验"} },
		{"ThisActivity:AddTask",	{1,1} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "使用黄金球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2364,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上才能使用",">="} },
		{"ThisActivity:CheckTask",	{2,4000,"使用黄金球和白金球最多总共只得 4000000000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2000000,0,"[WC 2010]使用黄金球获得经验"} },
		{"ThisActivity:AddTask",	{2,2} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "使用白金球",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2365,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上才能使用",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"装备需要10个空槽以上才能使用白金球"} },
		{"ThisActivity:CheckTask",	{2,4000,"使用黄金球和白金球最多总共只得4000000000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{64,1,"[WC 2010]使用白金球获得奖品"} },
		{"ThisActivity:ExecActivityDetail",	{17} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "nil",
	szName = "使用白金球_经验",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{2,4000,"使用黄金球和白金球最多总共只得4000000000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{65,1,"[WC 2010]使用白金球获得经验奖励"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "使用补血丹",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2366,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{3,1000,"使用补血丹最多只得1000000000经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[WC 2010]使用补血丹增加经验"} },
		{"ThisActivity:AddTask",	{3,10} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "礼官合成装备",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>大侠想合成哪种装备?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成荣耀之衣",20} },
		{"AddDialogOpt",	{"合成精准之靴",21} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "合成荣耀之衣",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"荣耀之衣",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"小球之衣",{tbProp={6,1,2367,1,0,0},},99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,214},nQuality=1,nExpiredTime=86400,},1,"[WC 2010]合成荣耀之衣"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "合成精准之靴",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"精准之靴",0,2,2,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"精准之靴",{tbProp={6,1,2368,1,0,0},},99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,215},nQuality=1,nExpiredTime=86400,},1,"[WC 2010]合成精准之靴"} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ClickNpc",
	szName = "礼官介绍活动",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"礼官"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"活动祝贺WORLDCUP",23} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "礼官介绍活动_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>祝贺地球上最大的足球大会,从11/06/2010 到 28/06/2010, 各位同行可以参加很多有吸引力的活动"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我来合成皮球",10} },
		{"AddDialogOpt",	{"我来合成装备",19} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(15, tbConfig)
