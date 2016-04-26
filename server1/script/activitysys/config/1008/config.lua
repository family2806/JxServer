Include("\\script\\activitysys\\config\\1008\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "启动服务器将加载月儿",
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
	szName = "打怪获得密瓶地图",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_HONEY_BOTTLE,1,"7"} },
	},
}
--在活动在获取原料的方法
tbConfig[3] = --宋金1000 点
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金1000 点",
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"TongKim1000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "宋金1000", "10 个双子果", 1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,30,EVENT_LOG_TITLE,"宋金3000"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "宋金000", "30个双子果", 1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"闯关17"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "闯关17", "10 个双子果", 1}},
	},
}
tbConfig[6] =  --闯关28
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "闯关 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"闯关28"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "闯关28", "10 个双子果",1}},
	},
}
tbConfig[7] = --水贼头领
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "杀手1水贼头领",
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,10,EVENT_LOG_TITLE,"杀手水贼头领"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "杀手水贼头领", "10 个双子果",1}},
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"消灭水贼大头领"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭水贼大头领", "20 个双子果",1}},
	},
}
tbConfig[9] = --炎帝- 闯关10
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,20,EVENT_LOG_TITLE,"炎帝闯关10"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "炎帝闯关10", "20 个双子果",1}},		
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,40,EVENT_LOG_TITLE,"消灭黄金boss"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭黄金boss", "40 个双子果",1}},			
	},
}
tbConfig[11] = --杀手boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手boss",
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
		{"PlayerFunLib:GetItem",	{ITEM_TWIN_PEANUT,3,EVENT_LOG_TITLE,"消灭杀手boss"} },				
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "消灭杀手boss", "3 个双子果",1}},				
	},
}

-----与Npc对话
tbConfig[12] =
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "点击月儿",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"月儿"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成物品",13} },
		{"AddDialogOpt",	{"Online 领奖",17} },
		{"AddDialogOpt",	{"玫瑰活动",22} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "合成物品对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>大侠需要什么帮助吗？",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成解热茶",14} },
		{"AddDialogOpt",	{"合成绿色礼盒",15} },	
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "合成解热茶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>解热茶",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够150级, 不能参加该活动",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"密瓶",ITEM_HONEY_BOTTLE,1} },
		{"AddOneMaterial",	{"青城雪芽",ITEM_THANH_THANH_TUYET_NHA,1} },
		{"AddOneMaterial",	{"双子果",ITEM_TWIN_PEANUT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COOL_TEA,1,EVENT_LOG_TITLE, "合成解热茶"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "合成解热茶", "1 解热茶", 1}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "合成绿色礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>绿色礼盒",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"你的等级不够150级, 不能参加该活动",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"AddOneMaterial",	{"双子果",ITEM_TWIN_PEANUT,1} },
		{"AddOneMaterial",	{"密瓶",ITEM_HONEY_BOTTLE,2} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BLUE_ROSE,1,EVENT_LOG_TITLE, "合成绿色礼盒"} },
		--{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "合成解热茶", "1 解热茶", 1}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "OnLogin",
	szName = "在线玩家",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "领取红蜡烛对话",
	nStartDate = 201202130000,
	nEndDate  = 201202232400,
	tbMessageParam = {"在活动举行的时间内，150级以上的大侠 (重生不限制) 可以参加在线活动领奖，每在线一个小时将获得一只红蜡烛，每天最多只能领取3次。",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online领取奖励",18} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "决定领红蜡烛",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TSK_ONLINE_AWARD_DAILY_LIMIT,3,"今天不能再领了，明天再来吧.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedCandle",	{nil} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用解热茶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30174,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_TEA_USING, 1500, "每人只能使用该物品1500次.", "<"}},	
	},
	tbActition = 
	{		
		{"ThisActivity:UseCoolTea",	{nil} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用白色礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30175,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用."} },		
		{"PlayerFunLib:CheckTaskDaily",	{TSK_USE_WHITE_GIFT_DAILY_LIMIT,3,"今天你不能使用该物品了，明天再继续使用.","<"} },
	},
	tbActition = 
	{			
		{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,"使用白色礼盒"} },
		{"ThisActivity:WhiteGiftAddTask", {nil}},
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用绿色礼物",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30179,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各大城市和新手村使用."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_BLUE_GIFT_USING, 1000, "每人只能使用该物品1000次.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"使用绿色礼物"} },
		{"ThisActivity:CastSkillOnUsingBlueGift",	{nil} },
		{"ThisActivity:BlueGiftAddTask", {nil}},
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "美国获得对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"如果阁下有玫瑰可以交给我参加玫瑰活动。活动内容如下:<enter>- 上交时间: <color=red>2012年2月2日0时到2012年2月28日24时<color><enter>- 最后总计时间g: <color=red>0h20 到29-2-12<color><enter>- 领奖时间: <color=red>9h  29-2-12到24h 29-2-2012<color>",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"更新27号已交玫瑰数量27",29} },
		{"AddDialogOpt",	{"上交玫瑰",23} },
		{"AddDialogOpt",	{"看排名榜",24} },	
		{"AddDialogOpt",	{"领取排名奖励",25} },
	},
}
tbConfig[23] = --交绿色礼物
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "上交玫瑰",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>上交物品",1,1,1,0.02},
	tbCondition = 
	{			
		{"AddOneMaterial",	{"玫瑰",{tbProp={6,1,30172,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },	
		{"ThisActivity:GiveRoseCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRose",	{nil} },		
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "nil",
	szName = "看排行榜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "玫瑰活动领奖对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"请选择奖励:",0},
	tbCondition = 
	{
		{"ThisActivity:TopListAwardCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"1等奖励",26} },
		{"AddDialogOpt",	{"2等奖励",27} },	
		{"AddDialogOpt",	{"3等奖励",28} },
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "1等奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{1} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "2等奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{2} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "nil",
	szName = "3等奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{3} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "nil",
	szName = "更新交花信息",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
	},
	tbActition = 
	{
		{"ThisActivity:UpdateRoseNumber",	{nil} },
	},
}