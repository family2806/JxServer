Include("\\script\\activitysys\\config\\29\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click ���ʿ��",
	nStartDate = nil,
	nEndDate  = nil,
--Move soldier's action to soldier statue - Modified by DinhHQ - 20110425
	tbMessageParam = {"����̨"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������",2} },
--		{"SetDialogTitle",	{"<npc>22/04/2011~22/05, 120��������ʿ�������������״����·����ң��ҽ�������ܵ�."} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"�ȼ�����120��",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_IDX_DAILY_GIVE_LANHUA,MAX_GIVE_LANHUA_PERDAY,"�����Ѿ�������������","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,1977,1,0,0},},1,"����Ұ����"} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,1977,1,0,0},},1} },
		{"ThisActivity:Vng_LanHua_Limit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Vng_OnGiveLanHua",	{nil} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "ServerStart",
	szName = "Sever �򿪽�����NPC",
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
