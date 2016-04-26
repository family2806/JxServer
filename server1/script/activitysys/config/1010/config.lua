Include("\\script\\activitysys\\config\\1010\\variables.lua")
Include("\\script\\activitysys\\config\\1010\\award_ext.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "当启动服务器",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪领面粉地图",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:DropItemRandom",	{nil} },
	},
}
tbConfig[3] = --宋金1000点
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金1000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"宋金1000"} },		
	},
}
tbConfig[4] = --宋金3000点
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金3000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,30,EVENT_LOG_TITLE,"宋金3000"} },		
	},
}
tbConfig[5] =		--闯关 17
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "闯关17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"闯关17"} },		
	},
}
tbConfig[6] =		--闯关 17
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "闯关28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"闯关28"} },		
	},
}
tbConfig[7] = --水贼头领
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "消灭1水贼头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,10,EVENT_LOG_TITLE,"消灭水贼头领"} },				
	},
}
tbConfig[8] = --水贼大头领
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "消灭水贼大头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,20,EVENT_LOG_TITLE,"消灭水贼大头领"} },				
	},
}
tbConfig[9] = --炎帝 - 闯关10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,15,EVENT_LOG_TITLE,"炎帝闯关6"} },				
	},
}
tbConfig[10] = --黄金boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "消灭黄金boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,30,EVENT_LOG_TITLE,"消灭黄金boss"} },				
	},
}
tbConfig[11] = --杀手boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手boss任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MILK,3,EVENT_LOG_TITLE,"消灭杀手boss"} },				
	},
}
--对话Npc
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"商贩"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"买原料合成生日蛋糕",21} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"奶油原料",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"银两",{nJxb=1},10000} }, --买原料消耗1万两
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"可以用1万两来买奶油原料合成武林传奇生日蛋糕"} },		
		{"PlayerFunLib:GetItem",	{ITEM_BUTTER,1,EVENT_LOG_TITLE,"奶油原料"} },
	},
}
tbConfig[14] = --面包师对话
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "点击面包师",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"面包师"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>来得真是时候，他正有一些活动给你"} },		
		{"AddDialogOpt",	{"做冰淇淋饼活动",15} },
		{"AddDialogOpt",	{"领取奖励活动",20} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "与面包师对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>我这里正好有<color=red>做冰淇淋饼活动<color>, 你想参加哪种活动"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想换面粉",26} },		
		{"AddDialogOpt",	{"我想做一般的冰淇淋饼",16} },		
		{"AddDialogOpt",	{"我想做巧克力冰淇淋饼",17} },		
		{"AddDialogOpt",	{"我想做水果冰淇淋饼",18} },		
		{"AddDialogOpt",	{"我想做武林传奇冰淇淋饼",19} },		
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "我想做一般冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"一般冰淇淋饼",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧",">="} },
		{"AddOneMaterial",	{"面粉",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"糖",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"牛奶",ITEM_MILK,1} },
		{"AddOneMaterial",	{"奶油",ITEM_BUTTER,2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_OFTEN_CAKES,1,EVENT_LOG_TITLE,"合成一般冰淇淋饼"} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "我想做巧克力冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"巧克力冰淇淋饼",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧",">="} },
		{"AddOneMaterial",	{"面粉",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"糖",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"牛奶",ITEM_MILK,1} },
		{"AddOneMaterial",	{"奶油",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"巧克力",ITEM_CHOCOLATE,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CHOCOLATE_CAKES,1,EVENT_LOG_TITLE,"合成巧克力冰淇淋饼"} },
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "我想做水果冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"水果冰淇淋饼",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧",">="} },
		{"AddOneMaterial",	{"面粉",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"糖",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"牛奶",ITEM_MILK,1} },
		{"AddOneMaterial",	{"奶油",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"水果",ITEM_FRUIT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_FRUIT_CAKES,1,EVENT_LOG_TITLE,"合成水果冰淇淋饼"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "我想做武林传奇冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"武林传奇冰淇淋饼",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧",">="} },
		{"AddOneMaterial",	{"面粉",ITEM_FLOUR,2} },
		{"AddOneMaterial",	{"糖",ITEM_ROAD,1} },
		{"AddOneMaterial",	{"牛奶",ITEM_MILK,1} },
		{"AddOneMaterial",	{"奶油",ITEM_BUTTER,2} },
		{"AddOneMaterial",	{"水果",ITEM_FRUIT,1} },
		{"AddOneMaterial",	{"巧克力",ITEM_CHOCOLATE,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BIRTHDAY_CAKE,1,EVENT_LOG_TITLE,"合成武林传奇冰淇淋饼"} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "nil",
	szName = "领取活动奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够，下次再来吧?",">="} },
		{"ThisActivity:CheckAwardExp", {"领奖时间从0h00 11/06/2012到24h00 11/06/2012 "},},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_GET_EXP,0,"你已经领取活动奖励了，不能再领取了!","=="} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_GET_EXP, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"Nhan100trExpTaiNpcThoLamBanh"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201206030000,
	nEndDate  = 201206302400,
	tbMessageParam = {"奶油原料",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"银两",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BUTTER,1,EVENT_LOG_TITLE,"在NPC商贩处买奶油"} },
	},
}
--S?d鬾g Item
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "使用一般冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30210,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		--{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1000, "使用物品超过上限，不能继续使用了", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"使用一般冰淇淋饼"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "使用巧克力冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30211,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CAKE, 1500, "使用物品超过上限，不能继续使用了", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"使用巧克力冰淇淋饼"} },
		{"ThisActivity:UseCake",{tbBITTSK_LIMIT_USE_CAKE,1500,2}},
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "使用水果冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30212,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CAKE, 1500, "使用物品超过上限，不能继续使用了", "<"}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"使用水果冰淇淋饼"} },
		{"ThisActivity:UseCake",{tbBITTSK_LIMIT_USE_CAKE,1500,1}},
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "使用生日蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30213,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 200, "使用物品超过上限，不能继续使用了", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"使用生日蛋糕"} },
		{"ThisActivity:UseCakeBirthday",{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,200}},
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "我想把面粉换成糖",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"面粉",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"等级不够，下次再来吧",">="} },
		{"AddOneMaterial",	{"面粉",ITEM_FLOUR,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROAD,1,EVENT_LOG_TITLE,"换面粉"} },
	},
}