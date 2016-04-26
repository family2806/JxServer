

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "选择选送万宝箱",
	nStartDate = 200910150000,
	nEndDate  = 200911020000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2564,0,"每天只能免费领取1<color=yellow>万宝箱<color> t?color=yellow>南海奇人<color>","=="} },
		{"PlayerFunLib:CheckLevel",	{140,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{"return {tbProp={6,1,2157,1,0,0},nExpiredTime=10080,}",1,"wanbaoxiang,get from npc"} },
		{"PlayerFunLib:AddTaskDaily",	{2564,1} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "使用 [免费万宝箱]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2157,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"每日最多只能使用9个 <color=yellow> 万宝箱<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{16,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "使用 [收费万宝箱]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2158,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"每天最多只能使用9个<color=yellow> 万宝箱<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{17,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "点击进入南海奇人",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"南海奇人"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"送万宝箱",1} },
	},
}
