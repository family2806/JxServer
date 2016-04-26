Include("\\script\\activitysys\\config\\42\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click fenghuatree",
	nStartDate = 201205100000,
	nEndDate  = 201206010000,
	tbMessageParam = {"C﹜ Phng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"上交刘灵丹",2} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "nil",
	szName = "hand in liulingdan",
	nStartDate = 201205100000,
	nEndDate  = 201206010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,3188,1,0,0},},1,"你没有刘灵丹"} },
		{"ThisActivity:CheckTaskDaily",	{TSK_HANDIN_LIULINGDAN,3,"今天你不能继续上交刘灵丹了","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSK_HANDIN_LIULINGDAN,1} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,3188,1,0,0},},1} },
		{"ThisActivity:AddTrebleExpTime",	{TSK_TREBLEEXP_TIME,TSK_HANDIN_LIULINGDAN} },
	},
}
