Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------局部变量定义 开始---------
local nCloseDate		= 20100816
local nCloseTime		= 201008160000
local nItemUseDate		= 20100823
local nTask_LittleWord		= 1
local nTask_MiddleWord		= 2
local nTask_FightToken_ChenDu		= 3
local nTask_FightToken_DaLi		= 4
local nTask_FightToken_FengXiang		= 5
local nTask_FightToken_XiangYang		= 6
local nTask_FightToken_BianJin		= 7
local nTask_FightToken_LinAn		= 8
local nTask_FightToken_YangZhou		= 9
-------局部变量定义 结束---------

local tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\seven_city_war\\themeactivities\\support.lua"} },
	},
	tbActition = 
	{
		{"tbSevenCityWar_Theme:AddNpc",	{nCloseDate} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪掉落大喜宝盒",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80,90"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2403,1,0,0},nExpiredTime=nCloseDate,},1,"1.5"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金获得大吉宝盒_胜",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[主活动PBM][高级宋金获得大吉宝盒]"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金获得大吉宝盒_和",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[主活动PBM][高级宋金获得大吉宝盒]"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "高级宋金获得大吉宝盒_输",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[主活动PBM][高级宋金获得大吉宝盒]"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "高级闯关获得大吉宝盒",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[主活动PBM][高级闯关获得大吉宝盒]"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡获得大吉宝盒",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},150,"[主活动PBM][风陵渡获得大吉宝盒]"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "杀手任务获得大吉宝盒",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},120,"[主活动PBM][杀手任务获得大吉宝盒]"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "使用大喜宝盒",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2403,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{76,1,"[主活动PBM][使用大喜宝盒]"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "使用大吉宝盒",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2404,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{77,1,"[主活动PBM][使用大吉宝盒]"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "点击宝宝哥",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"宝宝哥"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>借此祝贺新版问世活动，各位大侠可以收集各种必需原料来换取我的珍稀宝物!"} },
		{"AddDialogOpt",	{"换小自穹",12} },
		{"AddDialogOpt",	{"换中自穹(玄晶)",13} },
		{"AddDialogOpt",	{"换中自穹(福缘露)",14} },
		{"AddDialogOpt",	{"换新版装备",15} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "换小自穹",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"小自穹",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"七",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"城",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"大",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"战",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"银两",{nJxb=10000},1} },
		{"AddOneMaterial",	{"小福缘露",{tbProp={6,1,122,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2418,1,0,0},nExpiredTime=nItemUseDate,},1,"[主活动PBM][换小自穹]"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "换玄晶",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"玄晶",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"七",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"城",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"大",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"战",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"银两",{nJxb=60000},1} },
		{"AddOneMaterial",	{"4级玄晶",{tbProp={6,1,147,4,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[主活动PBM][换玄晶]"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "换福缘露",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"福缘露",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"七",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"城",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"大",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"战",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"银两",{nJxb=40000},1} },
		{"AddOneMaterial",	{"大福缘露",{tbProp={6,1,124,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[主活动PBM][福缘露]"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "换新版装备",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"新版装备",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"七",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"城",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"大",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"战",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"天书",{tbProp={6,1,2409,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{78,1,"[主活动PBM][换新版装备]"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "使用小自穹",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2418,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上人物才能使用",">="} },
		{"ThisActivity:CheckTask",	{nTask_LittleWord,999,"每个人物最多只能使用999个小自穹","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_LittleWord,1} },
		{"PlayerFunLib:AddExp",	{1000000,0,"[主活动PBM][使用小自穹]"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "使用小自穹",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2419,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上人物才能使用",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"每个人物最多只能使用中自穹，七星佩，城王盔，大圣甲，战神靴总共999个","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{2500000,0,"[主活动PBM][使用中自穹]"} },
		{"PlayerFunLib:GetAward",	{79,1,"[主活动PBM][使用中自穹]"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "使用七星佩",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2420,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上人物才能使用",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"每个人物最多只能使用中自穹，七星佩，城王盔，大圣甲，战神靴总共999个","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"需要留两个以上空位才能使用七星佩，成王盔，大圣甲，战神靴"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{4000000,0,"[主活动PBM][使用七星佩]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[主活动PBM][使用七星佩]"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用城王盔",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2421,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上人物才能使用",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"每个人物最多只能使用中自穹，七星佩，城王盔，大圣甲，战神靴总共999个","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"需要留两个以上空位才能使用七星佩，成王盔，大圣甲，战神靴"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{6000000,0,"[主活动PBM][使用城王盔]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[主活动PBM][使用成王盔]"} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用大圣甲",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2422,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上人物才能使用",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"每个人物最多只能使用中自穹，七星佩，城王盔，大圣甲，战神靴总共999个","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"需要留两个以上空位才能使用七星佩，成王盔，大圣甲，战神靴"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{8000000,0,"[主活动PBM][使用大圣甲]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[主活动PBM][使用大圣甲]"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用战神靴",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2423,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50级以上人物才能使用",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"每个人物最多只能使用中自穹，七星佩，城王盔，大圣甲，战神靴总共999个","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"需要留两个以上空位才能使用七星佩，成王盔，大圣甲，战神靴"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动PBM][使用战神靴]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[主活动PBM][使用战神靴]"} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "使用成都血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2411,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_ChenDu,20,"同一个城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_ChenDu,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动 PBM][使用成都血战令]"} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "使用大理血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2412,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_DaLi,20,"同一个城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_DaLi,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动 PBM][使用大理血战令]"} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "使用凤翔血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2413,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_FengXiang,20,"同一个城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_FengXiang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动PBM][使用凤翔血战令]"} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "使用凤翔血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2414,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_XiangYang,20,"同一个城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_XiangYang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动 PBM][使用凤翔血战令]"} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "使用汴京血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2415,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_BianJin,20,"同一个城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_BianJin,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动PBM][使用汴京血战令]"} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "使用临安血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2416,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_LinAn,20,"同一类城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_LinAn,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动PBM][使用临安血战令]"} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "使用扬州血战令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2417,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_YangZhou,20,"同一类城市血战令只能使用20个.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_YangZhou,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[主活动PBM][使用扬州血战令]"} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "点击龙儿",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小龙"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"换一纪乾坤符",30} },
		{"AddDialogOpt",	{"换古传面具",31} },
		{"AddDialogOpt",	{"换奥黛面具",32} },
		{"AddDialogOpt",	{"换鬼影面具",33} },
		{"AddDialogOpt",	{"换救命面具",34} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "换一纪乾坤符",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"一纪乾坤符",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=43200,},1,"[主活动PBM][换1个一纪乾坤符"} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "换古传面具",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"古传面具",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,469,1,0,0},nExpiredTime=10080,},1,"[主活动PBM][换古传面具]"} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "换奥黛面具",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"奥黛面具",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,470,1,0,0},nExpiredTime=10080,},1,"[主活动PBM][换奥黛面具]"} },
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "换鬼影面具",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"鬼影面具",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[主活动PBM][换鬼影面具]"} },
	},
}
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "换救命面具",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"救命面具",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"五行奇石",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[主活动PBM][换救命面具]"} },
	},
}
tbConfig[35] = --一个细节
{
	nId = 35,
	szMessageType = "ClickNpc",
	szName = "点击沈驹",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"沈驹"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"换马",36} },
	},
}
tbConfig[36] = --一个细节
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "换马",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"马",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"神行碎片",{tbProp={6,1,2410,1,0,0},},81} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{81,1,"[主活动PBM][换马]"} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(18, tbConfig)
