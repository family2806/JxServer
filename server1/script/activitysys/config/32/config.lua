Include("\\script\\activitysys\\config\\32\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "武林盟主对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"盟主- 沈升衣"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"武林盟主任务",2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "每日任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"'侠之大者，为国为民'.这次我奉师傅之命，到此寻找各位英雄豪杰。我师傅说，只需要我们同心协力，一定会有打退达子的一天。你是不是我要找的人呢?",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我来接武林盟主任务",3} },
		{"AddDialogOpt",	{"我来领取任务奖励",4} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "我来接每日任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"120级以上或者已重生的大侠每天可以到我这接受武林盟主任务，每种任务每天可以完成一次，完成后，我将给你相应的奖励!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"接杀怪任务",5} },
		{"AddDialogOpt",	{"接对话任务",6} },
		{"AddDialogOpt",	{"接收集任务",7} },
		{"AddDialogOpt",	{"我不小心弄丢了你的信",11} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "我来领取任务奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"120级以上或者已重生的大侠每天可以到我这接受武林盟主任务，每种任务每天可以完成一次，完成后，我将给你相应的奖励!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"领取杀怪任务奖励",8} },
		{"AddDialogOpt",	{"领取对话任务奖励",9} },
		{"AddDialogOpt",	{"领取收集任务奖励",10} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "nil",
	szName = "接杀怪任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptKillTask",	{nil} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "nil",
	szName = "接对话任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptTalkTask",	{nil} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "nil",
	szName = "接收集任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptGatherTask",	{nil} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "nil",
	szName = "领取杀怪任务奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletKillTask",	{nil} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "nil",
	szName = "领取对话任务奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletTalkTask",	{nil} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "nil",
	szName = "领取收集任务奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletGatherTask",	{nil} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "nil",
	szName = "我不小心弄丢了你的信了",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_ID,0,"这位<lua GetSex() == 1 and \"姐姐\" or \"哥哥\"/> 我还不需要你帮我送信",">"} },
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_STATE,0,"这位<lua GetSex() == 1 and \"姐姐\" or \"哥哥\"/> 你已经帮我送信到达了，真是感谢","=="} },
		{"PlayerFunLib:CheckItemInPlayer",	{{tbProp={6,1,2571,1,-1,0},},1,"这位<lua GetSex() == 1 and \"姐姐\" or \"哥哥\"/> 在你身上或者在你的储物箱里已经有我的信了，你再仔细找找." } },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2571,1,0,0},},1,"再次领取龙儿的信",""} },
		{"Talk",	{1,"","可以了，那就让我再写给你，也就是练字而已啦"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "宋金小旗儿对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小旗儿"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我来送信给你",15} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "凤凤闯关对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"凤凤"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我来送信给你",15} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "风陵渡小招对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小招"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我来送信给你",15} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "我来送信给你",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:TalkToNpc",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ServerStart",
	szName = "启动 sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Init",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "天保库萧镇对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"萧镇"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"我来送信给你",15} },
	},
}
