Include("\\script\\activitysys\\g_activity.lua")
local tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "DailogOption",
	szName = "我想用树枝换取经验",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"雪梅","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer1","阁下想用什么来换？"} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ComposeDailogOption",
	szName = format("使用g %s 换取经验", "小树枝", 4000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","换经验",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"小树枝","return {tbProp={6,1,2141,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"使用小树枝，中树枝，大树枝，最多只能得到300.000.000 经验","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{18} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ComposeDailogOption",
	szName = format("使用%s 换成 %u 经验", "中树枝", 6000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","换经验",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"中树枝","return {tbProp={6,1,2142,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"使用小树枝, 中树枝，大树枝，最多只能得300.000.000 经验","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{19} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "ComposeDailogOption",
	szName = format("使用 %s 换成 %u 经验", "大树枝", 10000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","换经验",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"大树枝","return {tbProp={6,1,2143,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"使用小树枝,中树枝，大树枝，最多只得300.000.000 经验","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{20} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "DailogOption",
	szName = format("收到 %s", "装饰点"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"雪梅","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer2","阁下想用什么来换取?"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "ComposeDailogOption",
	szName = format("使用%s 换 %d %s", "小树枝", 1, "装饰点"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","换装饰点",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"小树枝","return {tbProp={6,1,2141,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"阁下还没有帮会"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{1} },
		{"G_ACTIVITY:ExecActivityDetail",	{18} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "ComposeDailogOption",
	szName = format("使用%s 换%d %s", "中树枝", 2, "装饰点"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","换装饰点",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"中树枝","return {tbProp={6,1,2142,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"阁下依然还没有帮会"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{2} },
		{"G_ACTIVITY:ExecActivityDetail",	{19} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "ComposeDailogOption",
	szName = format("使用%s 换 %d %s", "大树枝", 3, "装饰点"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","换装饰点",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"大树枝","return {tbProp={6,1,2143,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"阁下依然还没有帮会"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{3} },
		{"G_ACTIVITY:ExecActivityDetail",	{20} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "DailogOption",
	szName = "看帮会装饰点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"雪梅","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3","大侠想看什么？"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "DailogOption",
	szName = "看本帮装饰点情况",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3","",""},
	tbCondition = 
	{
		{"PlayerFunLib:IsHaveTong",	{"阁下依然没有帮会"} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:TongInfo",	{nil} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "DailogOption",
	szName = "看帮会装饰点排行榜情况",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1","选看一个帮会排行"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "DailogOption",
	szName = "每批排行榜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.1", format("<lua LadderFunLib:GetInfo(10263,\"%s\",\"%s\",\"%s\")/>", "序号", "帮会名称", "数量" ) } },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "DailogOption",
	szName = "周排行榜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.2",format("<lua LadderFunLib:GetInfo(10264,\"%s\",\"%s\",\"%s\")/>", "序号", "帮会名称", "数量")} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "DailogOption",
	szName = "整个活动的排行榜",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.3",format("<lua LadderFunLib:GetInfo(10265,\"%s\",\"%s\",\"%s\")/>",  "序号", "帮会名称", "数量" )} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "DailogOption",
	szName = "领取奖品排行",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"雪梅","",""},
	tbCondition = 
	{
		{"PlayerFunLib:IsHaveTong",	{"阁下依然还没有帮会"} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:GetAwardDailog",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "DailogOption",
	szName = "走到经常出现圣诞树的地点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"车夫","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"tbZhongQiu200909:FlyToTree",	{nil} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "SetDailogTitle",
	szName = "设置雪梅标题",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"雪梅","<npc>".." 我正需要寻找美丽的松枝来装饰周围的圣诞树，让它更加隆重。大侠可以帮我寻找完美的松枝吗？?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "nil",
	szName = "增加功德点，同时增加经验点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"使用小树枝，中树枝，大树枝，最多只能得300.000.000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{4000000,0,"树枝换经验"} },
		{"PlayerFunLib:AddTask",	{2647,4} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "nil",
	szName = "增加功德点，同时增加经验点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"使用小树枝，中树枝，大树枝，最多只能得300.000.000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{6000000,0,"树枝换经验"} },
		{"PlayerFunLib:AddTask",	{2647,6} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "nil",
	szName = "增加功德点，同时增加经验点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"使用小树枝，中树枝，大树枝，最多只能得300.000.000 经验","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"树枝换经验"} },
		{"PlayerFunLib:AddTask",	{2647,10} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(7, tbConfig)
