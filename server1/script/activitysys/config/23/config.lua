Include("\\script\\activitysys\\config\\23\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "FinishYesou",
	szName = "一天内已完成10个野叟任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_YeSou,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"一天内已完成十个野叟任务"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_YeSou,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "LeagueResult",
	szName = "当日有第一场联赛胜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {2,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LeagueMatch,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"当日有第一场联赛胜"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LeagueMatch,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "当日第一次得到3000宋金积分",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_SongJin,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"当日第一次得到3000宋金积分"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_SongJin,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "当日第一次完成信使风之旗",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "当日第一次完成风陵渡",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_FengLingDu,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"当日第一次完成风陵渡"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_FengLingDu,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "当日杀死3个蓝怪第一次95级",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNpcPower",	{2} },
		{"NpcFunLib:CheckNpcLevel",	{"95"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LanGuai,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"当日杀死3个蓝怪第一次95级"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LanGuai,1} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "Chuanguan",
	szName = "当日第一次完成闯关1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28", 2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_ChuangGuan,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"当日第一次完成闯关1"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_ChuangGuan,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "杀手任务(暂无)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "炎帝宝藏(暂无)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "nil",
	szName = "龙脉任务(暂无)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "FinishCangBaoTu",
	szName = "当日3次闯过第一个藏宝图关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_CangBaoTu,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"当日3次闯过第一个藏宝图关"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_CangBaoTu,1} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "nil",
	szName = "杀死BOSS(暂无)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "每天上网领奖",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"礼官"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"领行侠令",14} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "领行侠令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_GetEveryDay,0,"你已经领了!","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,format("每天最多只能领%d行侠旗，今天你已经领购了，明天再来吧", 25),"<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"你的装备没有空位了，此次奖励不能获得"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"每天上网领奖"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_GetEveryDay,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
