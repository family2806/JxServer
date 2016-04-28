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
	szName = "Click v祇 Nguy猲 Фn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguy猲 Фn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi韎 thi謚 ho箃 ng p tr鴑g vui v�",3} },
		{"AddDialogOpt",	{"用Nguy猲 Фn金锤砸蛋",21} },
		{"AddDialogOpt",	{"用Nguy猲 Фn银锤砸蛋",22} },
		{"AddDialogOpt",	{"用Nguy猲 Фn铜锤砸蛋g",23} },
		{"AddDialogOpt",	{"使用Nguy猲 Фn银锤和金锤获得奖励次数达到200次",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ 產u ]] or [[ i hi謕 xin ng 匽]/>"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Gi韎 thi謚 ho箃 ng p tr鴑g vui v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从2010年12月21日0h到2011年1月10日24h， 大侠可以拿着Nguy猲 Фn铜锤、Nguy猲 Фn银锤、Nguy猲 Фn金锤到'Nguy猲 Фn'处砸蛋，你将获得意外惊喜，大侠如果想用Nguy猲 Фn银锤、Nguy猲 Фn铜锤砸蛋，除了需要有想要的锤外，还需要满足以下两个条件<enter>1，需要与3人组队，3人组队需要戴在汴京、襄阳或者临安L� Quan处领取的易容面具<enter>2，3人组队需要戴颜色相同、外形不同的易容面具<enter> 用Nguy猲 Фn金锤则不需要任何条件，其中，Nguy猲 Фn铜锤可以在L� Quan处领取，Nguy猲 Фn银锤可以在参加系统游戏中领取，Nguy猲 Фn金锤可以在奇珍阁领取。"},
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
	szName = "用Nguy猲 Фn金锤砸蛋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"此次活动使用的Nguy猲 Фn银锤和金锤最多为200次","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("Kh玭g c� <color=yellow>%s<color> kh玭g th� p tr鴑g","Nguy猲 Фn金锤")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("Ph莕 thng s� d鬾g %s p tr鴑g","Nguy猲 Фn金锤")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("Ph莕 thng s� d鬾g %s p tr鴑g","Nguy猲 Фn金锤"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "用Nguy猲 Фn银锤砸蛋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"此次活动使用的Nguy猲 Фn银锤和金锤最多为200次","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("Kh玭g c� <color=yellow>%s<color> kh玭g th� p tr鴑g","Nguy猲 Фn银锤")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("Ph莕 thng s� d鬾g %s p tr鴑g","Nguy猲 Фn银锤")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("Ph莕 thng s� d鬾g %s p tr鴑g","Nguy猲 Фn银锤")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "用Nguy猲 Фn铜锤砸蛋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"Nguy猲 Фn铜锤每天最多只能用5次","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("Kh玭g c� <color=yellow>%s<color> kh玭g th� p tr鴑g","Nguy猲 Фn铜锤")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("Ph莕 thng s� d鬾g %s p tr鴑g","Nguy猲 Фn铜锤")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("Ph莕 thng s� d鬾g %s p tr鴑g","Nguy猲 Фn铜锤")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "使用Nguy猲 Фn银锤和金锤获取奖励已达200次",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"大侠没有使用够200次Nguy猲 Фn银锤和金锤，继续加油哦",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"B筺   l躰h thng r錳","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"使用Nguy猲 Фn银锤和金锤获取奖励已达200次 "} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("Ph莕 thng vt 秈 t n %d 秈",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("Ph莕 thng vt 秈 t n %d 秈",17)} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("Ph莕 thng 甶觤 t輈h l騳 T鑞g Kim cao c蕄 t n %d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("Ph莕 thng 甶觤 t輈h l騳 T鑞g Kim cao c蕄 t n %d",3000)} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 th� luy謓 阯g trng l穙",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Trng l穙 Th� Luy謓 Л阯g"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho箃 ng p Tr鴑g vui v�",25} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Phong L╪g ",
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
	szName = "Nhi謒 v� S竧 th� ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s ph莕 thng","Nhi謒 v� S竧 th� ")} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "Nh苩 qu� huy ho祅g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s ph莕 thng","Nh苩 qu� huy ho祅g")} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "Boss Th� Gi韎 r琲 ra",
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
	szName = "领取Nguy猲 Фn银锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("H玬 nay ngi  nh薾 � ch� c馻 ta %s r錳","Nguy猲 Фn银锤"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"Nh薾 � Th� Luy謓 Л阯g"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("Ph莕 thng vt 秈 t n %d 秈",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("Ph莕 thng vt 秈 t n %d 秈",28)} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho箃 ng p Tr鴑g vui v�",24} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "nil",
	szName = "Nh薾 M苩 N� D� Dung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("H玬 nay ngi  nh薾 � ch� c馻 ta %s r錳","Nguy猲 Фn易容面具"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"从L� Quan处领取"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "nil",
	szName = "领取Nguy猲 Фn铜锤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("H玬 nay ngi  nh薾 � ch� c馻 ta %s r錳","Nguy猲 Фn铜锤"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"从L� Quan处领取"} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "Kh雐 ng sever",
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
	szName = "Ph秈 ch╪g s� d鬾g Ch飝 V祅g",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ngi x竎 nh mu鑞 s� d鬾g <color=yellow>%s<color> kh玭g?","Nguy猲 Фn金锤")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X竎 nh薾",4} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "Ph秈 ch╪g s� d鬾g Ch飝 B筩",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("你X竎 nh薾使用<color=yellow>%s<color> 吗？","Nguy猲 Фn银锤")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X竎 nh薾",5} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Ph秈 ch╪g s� d鬾g Ch飝 уng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("你X竎 nh薾想使用 <color=yellow>%s<color> 吗?","Nguy猲 Фn铜锤")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X竎 nh薾",6} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "L� Quan对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>欢迎参加Ho箃 ng p Tr鴑g vui v�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh薾 M苩 N� D� Dung",18} },
		{"AddDialogOpt",	{"领取Nguy猲 Фn铜锤",19} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "Trng l穙 Th� Luy謓 Л阯g对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>欢迎参加Ho箃 ng p Tr鴑g vui v�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"领取Nguy猲 Фn银锤",15} },
	},
}
