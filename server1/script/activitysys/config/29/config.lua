Include("\\script\\activitysys\\config\\29\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click v祇 ngi l輓h",
	nStartDate = nil,
	nEndDate  = nil,
--Move soldier's action to soldier statue - Modified by DinhHQ - 20110425
	tbMessageParam = {"Tng Уi"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T苙g Hoa Lan",2} },
--		{"SetDialogTitle",	{"<npc>22/04/2011~22/05, 120级以上人士可以T苙g Hoa Lan，米袋，衣服给我，我将厚待你周到."} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "T苙g Hoa Lan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"Ъng c蕄 ch璦  120",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_IDX_DAILY_GIVE_LANHUA,MAX_GIVE_LANHUA_PERDAY,"H玬 nay  giao  Hoa Lan R鮪g r錳","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,1977,1,0,0},},1,"Kh玭g  hoa lan r鮪g"} },
		{"AddOneMaterial",	{"Hoa Lan",{tbProp={6,1,1977,1,0,0},},1} },
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
	szName = "Sever m� s� ng t秈 NPC",
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
