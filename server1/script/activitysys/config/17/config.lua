tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "使用野叟的神秘宝箱",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2374,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2348,1,-1,0},},6,"需要%d 玄天锤, 阁下所带数量不够!"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{71,1,"野叟的神秘宝箱"} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2348,1,-1,0},},6} },
		{"ThisActivity:Jiluxiaohao_yesou",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "使用攻城战礼包",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2377,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{72,1,"攻城战礼包"} },
		{"ThisActivity:Jiluxiaohao_chengzhan",	{nil} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "使用至尊秘宝",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2375,-1,-1,-1},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2348,1,-1,0},},12,"需要%d 玄天锤，阁下不够数量!"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{73,1,"至尊秘宝"} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2348,1,-1,0},},12} },
		{"ThisActivity:Jiluxiaohao_zhizun",	{nil} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "使用水贼的财宝(旧)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2376,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{74,1,"水贼的财宝"} },		
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "使用风火锦囊",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2373,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{75,1,"风火锦囊"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "独孤天峰死",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"独孤天峰"} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2375,1,0,0},},20,"100"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "BOSS 死",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2375,1,0,0},},10,"100"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "水贼头领死亡(废)",
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
	szMessageType = "NpcOnDeath",
	szName = "水贼大头领死亡船1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{337} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2743,1,0,0},},9,"100"} },
		--调整从水贼大头领boss落下的奖励- Modified By DinhHQ - 20120523
		{"ThisActivity:VnFFBigBossDrop",	{nil}}
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "水贼大头领死亡船23",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"338,339"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2743,1,0,0},},3,"100"} },
		--调整从水贼大头领boss落下的奖励 - Modified By DinhHQ - 20120523
		{"ThisActivity:VnFFBigBossDrop",	{nil},}
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "nil",
	szName = "null",
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
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "使用水贼宝箱",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2743,1,0,0},}},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2744,1,0,0},},1,"需要一个 %d 如意钥匙} },
		{"ThisActivity:VnUsePirateBox",	{nil}}
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2744,1,0,0},},1} },
	--	{"ThisActivity:GiveAward",	{"shuizeibaoxiang",1,"use_shuizeibaoxiang"} },
		--{"ThisActivity:Jiluxiaohao_shuizexiangzi",	{nil} },		
	},
}
