

-------局部变量定义 开始---------
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "转生后的奖品达到160级为翻羽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{3,"只可在第190级进行第三次重生，同时达到160级才能领取奖品","=="} },
		{"PlayerFunLib:CheckLevel",	{160,"只可在第190级进行第三次重生，同时达到160级才能领取奖品","=="} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",1,1,"只可在第190级进行第三次重生，同时达到160级才能收到奖品"} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",2,0,"大侠已经领取该奖品了."} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10,7,5,5,0},nExpiredTime=259200,},1,"3rdTransAward"} },
		{"PlayerFunLib:SetTaskBit",	{"2582",2,1} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "转生后的奖品达到160级为翻羽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"北斗老人"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"转生后的奖品达到160级为翻羽",1} },
	},
}
