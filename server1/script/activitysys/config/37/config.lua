Include("\\script\\activitysys\\config\\37\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "启动服务器将加载圣诞老人",
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
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪地图获得圣诞衣",
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
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CLOTHING,1,"6"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金积分高于1000低于3000获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"宋金1000领取圣诞袋"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金积分3000获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,30,EVENT_LOG_TITLE,"宋金3000获得圣诞袋"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "闯过第17关获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"闯过第17关获得圣诞袋"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "闯过第28关获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"闯过第28关获得圣诞袋"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "水贼头领风陵渡获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"消灭水贼头领获得圣诞袋"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "水贼大头领获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,20,EVENT_LOG_TITLE,"消灭水贼大头领获得圣诞袋"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关过第10关获得圣诞袋",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,15,EVENT_LOG_TITLE,"炎帝闯关过第10关获得圣诞袋"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "消灭黄金BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,50,EVENT_LOG_TITLE,"消灭黄金BOSS获得圣诞袋"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "消灭杀手BOSS",
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
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,3,EVENT_LOG_TITLE,"消灭杀手BOSS获得圣诞袋"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "闯关消灭Boss ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"30"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_STAR,1,EVENT_LOG_TITLE,"chuangguan30"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "炎帝消灭最后BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:YDBZ_GiveStar",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "点击圣诞大松",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞大松"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online 领奖",15} },
		{"AddDialogOpt",	{"合成物品",17} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "领圣诞裤对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从0:00-01-12-2011 到 24:00-31-12-2011,150级以及150级以上的大侠(重生不限制) 可以参加圣诞活动，只要在线一个小时将获得10条圣诞裤子和40个南瓜饼，每天最多只能活动5次",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online领奖",16} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "nil",
	szName = "决定领圣诞裤子",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_XMAS_TROUSERS_DAILY,50,"今天你不能领了，明天再来吧.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveXmasTrousers",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "合成物品对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"在活动时间内，大侠可以到我这合成圣诞礼盒，圣诞老人(小), 圣诞老人 (中), 圣诞老人(大), 圣诞饼, 其中圣诞礼盒成功合成的比例为70%, 小圣诞老人成功合成的比例为60%, 其他物品成功合成的比例为100%,你想合成吗？",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成圣诞礼盒",18} },
		{"AddDialogOpt",	{"合成圣诞老人(小)",19} },
		--暂时关闭- Modified By DinhHQ - 20111129
	--	{"AddDialogOpt",	{"合成圣诞老人(中)",20} },
		{"AddDialogOpt",	{"合成圣诞老人(大)",21} },
		{"AddDialogOpt",	{"合成圣诞饼",22} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "合成圣诞礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"获得圣诞礼盒",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"圣诞衣服",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"圣诞裤子",ITEM_XMAS_TROUSERS,1} },
		--Change request Event Noel - Modified by DinhHQ - 20111129
		{"AddOneMaterial",	{"银两",{nJxb=1},50000} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeXmasGift",	{nil} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "合成圣诞老人(小)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞老人(小)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"圣诞衣服",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"圣诞裤子",ITEM_XMAS_TROUSERS,1} },
		{"AddOneMaterial",	{"圣诞袋",ITEM_XMAS_BAG,1} },
		--Change request Event Noel - Modified by DinhHQ - 20111129
		{"AddOneMaterial",	{"银两",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeXmasPerson_S",	{nil} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "合成圣诞老人(中)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞老人(中)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"圣诞衣服",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"圣诞帽子",{tbProp={6,1,3072,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3078,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"合成圣诞老人(中)"} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "合成圣诞老人(大)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞老人(大)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"圣诞衣服",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"圣诞裤子",ITEM_XMAS_TROUSERS,1} },
		{"AddOneMaterial",	{"圣诞袋子",ITEM_XMAS_BAG,1} },
		{"AddOneMaterial",	{"圣诞帽子",{tbProp={6,1,3072,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3079,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"合成圣诞老人(大)"} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "合成圣诞饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞饼",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"圣诞衣服",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"圣诞袋子",ITEM_XMAS_BAG,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3082,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"composeXmasCake"} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "点击圣诞老人",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞老人"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"从 0:00-01-12-2011 到 24:00-31-12-2011, 150级以及150级以上的大侠(重生无限制)可以到这使用300, 400, 500颗星星来换取张宣BOSS，金试亮，慕容全招魂令牌，你想换哪种?"} },		
		{"AddDialogOpt",	{"张宣BOSS招魂令牌",24} },
		{"AddDialogOpt",	{"金试亮招魂令牌",25} },
		{"AddDialogOpt",	{"慕容全招魂令牌",26} },
		--бn b?exp - Modified by DinhHQ - 20111201
		--{"AddDialogOpt",	{"领取经验值补偿",33} },
		--Ho箃 ng th?3 - Modified By DinhHQ -20111215
		{"AddDialogOpt",	{"圣诞夜礼物",34} },
		{"AddDialogOpt",	{"合成圣诞老人",38} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "张宣BOSS招魂令牌",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"张宣BOSS令牌",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"星星",ITEM_XMAS_STAR,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3083,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "金试亮招魂令牌",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" Boss令牌 - 金试亮",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"星星",ITEM_XMAS_STAR,400} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3084,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "慕容全招魂令牌",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Boss令牌 - 慕容全",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"星星",ITEM_XMAS_STAR,500} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3085,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "使用圣诞老人 (小)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3077,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_S_LIMIT,MAX_USED_XMAS_PERSON_S_LIMIT,"你已使用够了圣诞老人(小), 不能再使用了!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_S",	{nil} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "使用圣诞老人(中)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3078,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_M_LIMIT,MAX_USED_XMAS_PERSON_M_LIMIT,"你已使用够了圣诞老人(中), 不能再使用了!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_M",	{nil} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "ItemScript",
	szName = "使用圣诞老人(大)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3079,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_L_LIMIT,MAX_USED_XMAS_PERSON_L_LIMIT,"你已使用够了圣诞老人(大), 不能再使用了!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_L",	{nil} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "ItemScript",
	szName = "使用圣诞礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3080,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_GIFT_LIMIT,MAX_USED_XMAS_GIFT_LIMIT,"你已使用够了圣诞礼盒, 不能再使用了!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasGift",	{nil} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "ItemScript",
	szName = "使用圣诞饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3082,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_CAKE_LIMIT,MAX_USED_XMAS_CAKE_LIMIT,"你已使用够了圣诞饼, 不能再使用了!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasCake",	{nil} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
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
tbConfig[33] = 
{
	nId = 33,
	szMessageType = "nil",
	szName = "领取圣诞补偿",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetCompensation",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2911,nStartBit = 29,nBitCount = 1,nMaxValue = 1}, 0, "每人只能领奖一次", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2911,nStartBit = 29,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{18e6,0,"Event_Noel","领取种树补偿奖励"} },
	},
}
tbConfig[34] =
{
	nId = 34,
	szMessageType = "CreateDialog",
	szName = "圣诞夜领奖对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"从 0:00-24-12-2011 到 24:00-25-12-2011,150级以及150级以上的大侠(重生不限制)可以到我这领取圣诞礼品为2亿不叠加经验值，每个人只能领取唯一的一次。",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我想领奖",35} },
	},
}
tbConfig[35] = 
{
	nId = 35,
	szMessageType = "nil",
	szName = "领取圣诞夜奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 20,nBitCount = 1,nMaxValue = 1}, 0, "每人只能领取一次奖励", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 20,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{200e6,0,"Event_Noel","NhanThuongDiemKinhNghiemDemGiangSinh"} },
	},
}
tbConfig[36] =--商贩买烤鸡
{
	nId = 36,
	szMessageType = "ClickNpc",
	szName = "点击商贩",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"商贩"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"买烤鸡",37} },
	},
}
tbConfig[37] =
{
	nId = 37,
	szMessageType = "CreateCompose",
	szName = "买烤鸡",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"烤鸡",1,1,1,0.02,0,50},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"银两",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="G?quay",tbProp={6,1,30167,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"买烤鸡"} },
	},
}
tbConfig[38] =
{
	nId = 38,
	szMessageType = "CreateCompose",
	szName = "合成圣诞老人",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"圣诞老人",1,1,1,0.02,0,50},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"烤鸡",{tbProp={6,1,30167,1,0,0},nExpiredTime=20120101,},1} },		
		{"AddOneMaterial",	{"南瓜饼",{tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,},1} },
		{"AddOneMaterial",	{"圣诞帽子",ITEM_XMAS_HAT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30168,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "合成圣诞老人"} },
	},
}
tbConfig[39] = 
{
	nId = 39,
	szMessageType = "ItemScript",
	szName = "使用圣诞老人",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30168,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{3, 3, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "只能在各城市及新手村使用."} },
		{"PlayerFunLib:CheckTask",	{2916,1500,"每人最多只能使用1500个圣诞老人物品","<"} },		
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_Pink",	{nil} },
	},
}
