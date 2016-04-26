Include("\\script\\activitysys\\config\\29\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click 点击士兵",
	nStartDate = nil,
	nEndDate  = nil,
--Move soldier's action to soldier statue - Modified by DinhHQ - 20110425
	tbMessageParam = {"纪念台"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"送兰花",2} },
--		{"SetDialogTitle",	{"<npc>22/04/2011~22/05, 120级以上人士可以送兰花，米袋，衣服给我，我将厚待你周到."} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "送兰花",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"等级不足120级",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_IDX_DAILY_GIVE_LANHUA,MAX_GIVE_LANHUA_PERDAY,"今天已经交够了兰花了","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,1977,1,0,0},},1,"不够野兰花"} },
		{"AddOneMaterial",	{"兰花",{tbProp={6,1,1977,1,0,0},},1} },
		{"ThisActivity:Vng_LanHua_Limit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Vng_OnGiveLanHua",	{nil} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 5,
	szMessageType = "ServerStart",
	szName = "Sever 打开将加载NPC",
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
