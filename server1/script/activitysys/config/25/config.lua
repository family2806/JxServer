Include("\\script\\activitysys\\config\\25\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "nil",
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
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Click 进入元旦",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"元旦"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"介绍快乐砸蛋活动",3} },
		{"AddDialogOpt",	{"用元旦金锤砸蛋",21} },
		{"AddDialogOpt",	{"用元旦银锤砸蛋",22} },
		{"AddDialogOpt",	{"用元旦铜锤砸蛋g",23} },
		{"AddDialogOpt",	{"使用元旦银锤和金锤获得奖励次数达到200次",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ 痛]] or [[大侠请停止]/>"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "介绍快乐砸蛋活动",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从2010年12月21日0h到2011年1月10日24h， 大侠可以拿着元旦铜锤、元旦银锤、元旦金锤到'元旦'处砸蛋，你将获得意外惊喜，大侠如果想用元旦银锤、元旦铜锤砸蛋，除了需要有想要的锤外，还需要满足以下两个条件<enter>1，需要与3人组队，3人组队需要戴在汴京、襄阳或者临安礼官处领取的易容面具<enter>2，3人组队需要戴颜色相同、外形不同的易容面具<enter> 用元旦金锤则不需要任何条件，其中，元旦铜锤可以在礼官处领取，元旦银锤可以在参加系统游戏中领取，元旦金锤可以在奇珍阁领取。"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "用元旦金锤砸蛋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"此次活动使用的元旦银锤和金锤最多为200次","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("没有color=yellow>%s<color> 不能砸蛋","元旦金锤")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("使用奖励 %s 砸蛋","元旦金锤")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("使用奖励 %s 砸蛋","元旦金锤"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "用元旦银锤砸蛋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"此次活动使用的元旦银锤和金锤最多为200次","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("没有color=yellow>%s<color> 不能砸蛋","元旦银锤")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("使用奖励 %s 砸蛋","元旦银锤")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("使用奖励 %s 砸蛋","元旦银锤")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "用元旦铜锤砸蛋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"元旦铜锤每天最多只能用5次","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("没有color=yellow>%s<color> 不能砸蛋","元旦铜锤")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("使用奖励%s 砸蛋","元旦铜锤")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("使用奖励%s 砸蛋","元旦铜锤")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "使用元旦银锤和金锤获取奖励已达200次",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"大侠没有使用够200次元旦银锤和金锤，继续加油哦",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"你已领奖了","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"使用元旦银锤和金锤获取奖励已达200次 "} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("闯关奖励达到%d 关",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("闯关奖励达到%d 关",17)} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("高级宋金积分奖励达到%d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("高级宋金积分奖励达到%d",3000)} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "点击试炼堂长老",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"试炼堂长老"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"快乐砸蛋活动",25} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},10,"100"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "杀手任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s 奖励","杀手任务")} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "领取辉煌果",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s 奖励","辉煌果")} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "世界Boss掉出",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},15,"100"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "领取元旦银锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("今天你已经在我这领取 %s了","元旦银锤"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"在试炼堂领取"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("闯关奖励达到%d关",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("闯关奖励达到%d关",28)} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "点击礼官",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"礼官"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"快乐砸蛋活动",24} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "nil",
	szName = "领取易容面具",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("今日你已在我这领取%s了","元旦易容面具"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"从礼官处领取"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "nil",
	szName = "领取元旦铜锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("今日你已在我这领取%s 了","元旦铜锤"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"从礼官处领取"} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "启动 sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddYuanDanDialogNpc",	{nil} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "是否使用金锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("你确定想用<color=yellow>%s<color> 吗？","元旦金锤")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"确认",4} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "是否使用银锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("你确认使用<color=yellow>%s<color> 吗？","元旦银锤")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"确认",5} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "是否使用铜锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("你确认想使用 <color=yellow>%s<color> 吗?","元旦铜锤")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"确认",6} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "礼官对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>欢迎参加快乐砸蛋活动"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"领取易容面具",18} },
		{"AddDialogOpt",	{"领取元旦铜锤",19} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "试炼堂长老对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>欢迎参加快乐砸蛋活动"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"领取元旦银锤",15} },
	},
}
