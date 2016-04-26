

-------局部变量定义 开始---------
local TASK_TIME_LEFT_A		= 2662
local TASK_TIME_LEFT_B		= 2663
local TASK_ITEM_USED_A		= 2664
local TASK_ITEM_USED_B		= 2665
-------局部变量定义 结束---------

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
	szMessageType = "nil",
	szName = "劈血谷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{917,1816,3392} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "恶人谷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{918,1816,3392} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "nil",
	szName = "蚀骨崖",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险！",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{919,1608,3168} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "黑木崖",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{920,1608,3168} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "天附山",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{921,1560,3104} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "盘龙山",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{922,1560,3104} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "地母山",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{923,2008,4080} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "宛凤山",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"等级过低，恐怕对大侠太危险!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"阁下修炼的时间已用完!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{924,2008,4080} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "使用白骨令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2255,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"需是充值玩家及130级以上才能使用",">="} },
		{"PlayerFunLib:IsCharged",	{"需是充值玩家及130级以上才能使用"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,1020,"白骨修炼的时间最多只能积累1080分钟!","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_A,3,"此道具每日只能使用3次!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_A,1} },
		{"dostring",	{"local nLeftTime = GetTask(2662); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2662, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[白骨修炼积累的时间为%d 分钟]], GetTask(2662)))"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "使用天龙令",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2256,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"需是充值玩家及130级以上才能使用",">="} },
		{"PlayerFunLib:IsCharged",	{"需是充值玩家及130级以上才能使用"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,1020,"白骨修炼的时间最多只能积累1080分钟","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_B,3,"此道具每日只能使用3次!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_B,1} },
		{"dostring",	{"local nLeftTime = GetTask(2663); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2663, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[天龙修炼积累的时间为%d 分钟]], GetTask(2663)))"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "点击车夫",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"车夫"},
	tbCondition = 
	{
	},
	tbActition = 
	{
--		{"AddDialogOpt",	{"走到新的地图",13} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "选择地图",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"客官想去哪?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"劈血谷",2} },
		{"AddDialogOpt",	{"恶人谷",3} },
		{"AddDialogOpt",	{"蚀骨崖",4} },
		{"AddDialogOpt",	{"黑木崖",5} },
		{"AddDialogOpt",	{"天附山",6} },
		{"AddDialogOpt",	{"盘龙山",7} },
		{"AddDialogOpt",	{"地母山",8} },
		{"AddDialogOpt",	{"宛凤山",9} },
	},
}
