

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "BigBoss 死亡",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"独孤天峰"} },
	},
	tbActition = 
	{
		{"BigBoss:BigBossDeath",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "[独孤天峰]全部server的奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckTimeAndWeekDay",	{2000,2100,"0,1,2,3,4,5,6","现在不是领奖时间"} },
		{"PlayerFunLib:CheckLevel",	{90,format("级%d 以上才能领奖!",90),">="} },
	},
	tbActition = 
	{
		{"dostring",	{"Include([[\\script\\missions\\boss\\bigboss.lua]]); BigBoss:BigBossGlobalReward()"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ClickNpc",
	szName = "点击进入礼官",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"礼官"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"[独孤天峰]全部server的奖励",2} },
	},
}
