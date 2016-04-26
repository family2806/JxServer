

-------局部变量定义 开始---------
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
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "打怪掉落莲藕饼",
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
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪掉落绿豆饼",
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
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "打怪掉落芋头",
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
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金结束，送糯米软糕（胜）",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[中秋活动] [宋金生产糯米软糕]"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "高级宋金结束，送糯米软糕(和)",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[中秋活动] [宋金生产糯米软糕]"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "高级宋金结束，送糯米软糕（输）",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[中秋活动] [宋金生产糯米软糕]"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "ClickNpc",
	szName = "商店卖肉馅包",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"商店"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买肉馅包",8} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "买肉馅包",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"肉馅包",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"30000 lng",{nJxb=30000,},1} },
		{"lib:CheckDay",	{20100920, 20101011, "换取时限已结束"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2500,1,0,0},nExpiredTime=20101011,},1,"[中秋活动] [商贩买肉馅包]"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "嫦娥合成",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"合成"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成灯笼",10} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "合成划分等级",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"<npc>阁下想合成哪种灯笼?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"蝴蝶灯笼",11} },
		{"AddDialogOpt",	{"星星灯",12} },
		{"AddDialogOpt",	{"长管灯笼",13} },
		{"AddDialogOpt",	{"圆灯笼",14} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "合成蝴蝶灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"蝴蝶灯笼",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"莲藕饼",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"绿豆饼",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"芋头饼",{tbProp={6,1,2498,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "换取时限已结束"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2502,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [合成灯笼]"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "合成星星灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"星星灯笼",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"莲藕饼",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"绿豆饼",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"芋头饼",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"糯米软糕",{tbProp={6,1,2499,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "换取时限已结束"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2503,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [合成灯笼]"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "合成长管灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"长管灯笼",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"莲藕饼",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"绿豆饼",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"芋头饼",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"肉馅饼",{tbProp={6,1,2500,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "换取时限已结束"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2504,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [合成灯笼]"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "合成圆灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"圆灯笼",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"莲藕饼",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"绿豆饼",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"芋头饼",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"什锦饼",{tbProp={6,1,2501,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "换取时限已结束"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2505,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [合成灯笼]"} },
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","增加一个活动积分"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "使用蝴蝶灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2502,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","在城市或者新手村使用!"} },
		{"PlayerFunLib:IsFightState",	{1,"在战斗区域使用!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"ThisActivity:CheckTask",	{nTask_HuDie,1000,"达到最高经验，不能再获取经验!","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AwardExp",	{1000000, nTask_HuDie, 1000000000, "使用蝴蝶灯笼", "[中秋活动][使用蝴蝶灯笼]"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "使用星星灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2503,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","请在城市或者新手村使用!"} },
		{"PlayerFunLib:IsFightState",	{1,"请在战斗区域使用!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"大力侍卫"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "使用长管灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2504,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","请在城市或者新手村使用!"} },
		{"PlayerFunLib:IsFightState",	{1,"请在战斗区域使用!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"常胜侍卫"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "使用圆灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2505,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","请在城市或者新手村使用!"} },
		{"PlayerFunLib:IsFightState",	{1,"请在战斗区域使用!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"金刚卫士"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用成都中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2507,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_ChenDu,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用成都中秋饼]"} },
		{"ThisActivity:AddTask",	{nTask_ChenDu,1} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用大理中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2508,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_DaLi,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用大理中秋饼"} },
		{"ThisActivity:AddTask",	{nTask_DaLi,1} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用凤翔中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2509,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FengXiang,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用凤翔中秋饼]"} },
		{"ThisActivity:AddTask",	{nTask_FengXiang,1} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "使用襄阳中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2510,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_XiangYang,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用襄阳中秋饼]"} },
		{"ThisActivity:AddTask",	{nTask_XiangYang,1} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "使用汴京中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2511,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_BianJin,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用汴京中秋饼]"} },
		{"ThisActivity:AddTask",	{nTask_BianJin,1} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "使用临安中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2512,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_LinAn,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用临安中秋饼]"} },
		{"ThisActivity:AddTask",	{nTask_LinAn,1} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "使用扬州中秋饼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2513,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_YangZhou,20,"在活动时间，每种饼只能使用20个","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50级以上才能参加活动",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][使用扬州中秋饼]"} },
		{"ThisActivity:AddTask",	{nTask_YangZhou,1} },
	},
}
tbConfig[26] = --一个细节
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
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "ClickNpc",
	szName = "与嫦娥对话",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"嫦娥"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trong th阨 gian 0 gi?20/09/2010 n 0 gi?11/10/2010, 在2010年09月20日至2010年10月11日，同行可以通过打怪，宋金，商店，奇珍阁领取各种中秋饼，同时也可以合成各种灯笼。在10月18日前使用灯笼，可以召回中秋BOSS，打败后将收到丰富的奖励，同时可以由计划收到拉军灯笼。缴拉军灯笼给嫦娥姐姐，将收到经验奖励，缴1000,2000,3000...将收到比平常更多的经验。嫦娥的大度将根据已缴的拉军灯笼数量决定。每天20点如果嫦娥在最大的状态，将出现放烟火效应，各位站在周围的同行可以收到经验奖励。每天20点30分，嫦娥将回到最小状态，拉军灯数量也回到0.在活动时间内，每个人最多只能缴1999个。"} },
		{"AddDialogOpt",	{"缴拉军灯笼",28} },
		{"AddDialogOpt",	{"检查已缴数量",34} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "缴拉军灯笼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"缴拉军灯笼",1,1,1,0.01},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "活动已结束"} },
		{"lib:CheckTime",	{{{000000,200000},{203000,240000}}, "不是活动时间"} },
		{"AddOneMaterial",	{"拉军灯笼",{tbProp={6,1,2506,1,0,0},},1} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
		{"ThisActivity:CheckTask",	{nTask_GiveCount,"1999 - <ComposeCount> ","在活动时间内，每日只能缴1999个!","<="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:AddExp",	{500000,0,"[中秋活动][缴拉军灯笼]"} },
		{"tb2010ZhongQiu:GiveItem2HengE",	{nil} },
		{"ThisActivity:AddTask",	{nTask_GiveCount,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","增加一个事件积分"} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "点击龙儿",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"小龙"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"换救命面具",33} },
		{"AddDialogOpt",	{"换长工面具",35} },
		{"AddDialogOpt",	{"换坚硬面具",36} },
		{"AddDialogOpt",	{"换鬼影面具",30} },
		{"AddDialogOpt",	{"换回天再造锦囊",31} },
		{"AddDialogOpt",	{"换一纪乾坤符",32} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "换鬼影面具",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"鬼影面具",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "换取时间已结束"} },
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[中秋活动][换鬼影]"} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "换回天再造锦囊",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"回天再造锦囊",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "换取时限已结束"} }
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},3} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0},nExpiredTime=20160, tbParam={60}},1,"[中秋活动][换取回天再造锦囊]"} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "换一纪乾坤符",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"一纪乾坤符",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "换取时限已经结束"} }
		{"AddOneMaterial",	{"一纪乾坤符",{tbProp={6,1,2125,1,0,0},},300} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=20160,},1,"[中秋活动][换一纪乾坤符"} },
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "换救命面具",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"救命面具",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "换取时限已经结束"} }
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[中秋活动][换救命面具]"} },
	},
}
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "nil",
	szName = "检查已缴拉军灯笼数量",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "活动已结束"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:ShowGiveCount",	{nTask_GiveCount} },
	},
}
tbConfig[35] = --一个细节
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "换长工面具",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"长工面具",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "换长工面具时限"} }
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,479,1,0,0},nExpiredTime=10080,},1,"[中秋活动][换长工面具]"} },
	},
}
tbConfig[36] = --一个细节
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "换坚硬面具",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"坚硬面具",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "换取时限已结束"} }
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},20} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,480,1,0,0},nExpiredTime=10080,},1,"[中秋活动][换坚硬面具]"} },
	},
}
