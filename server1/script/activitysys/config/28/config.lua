Include("\\script\\activitysys\\config\\28\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Ng��i choi click v�o L�o N�ng C�n C�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L�o N�ng C�n C�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>M�a xu�n �� ��n, ta mu�n tr�ng th�m m�t �t hoa m�u � ngo�i th�n ch�ng ta"} },
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng Ti�t Tr�ng C�y",2} },
		{"AddDialogOpt",	{"Nh�n Th�ng G�",3} },
		{"AddDialogOpt",	{"��a L�o N�ng m�t Th�ng N��c",4} },
		{"AddDialogOpt",	{"��a L�o N�ng Long �m Th�nh Th�y",5} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Gi�i thi�u ho�t ��ng Ti�t Tr�ng C�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>���쵽�ˣ�������ֻ�����2011��03��28��0ʱ��2011��04��04��24ʱ��С�����Ե�����Nh�n Th�ng G磬Ȼ��������(206,189), ��Ȫ�� (223,189)����ʯ���� (217,184)��ˮ̶������ˮ��ÿ��ÿ�����ֻ����5�Σ�С��Ҫ��ˮ�������ң��ҽ�������Ľ������������԰�Long �m Th�nh Th�y�����ң��ҽ�����ḻ��Ʒ�����һ��Long �m Th�nh Th�y�����ﵽ500�Σ������15�������㲻�ܴ��������ľ�ͽ��뿪���Long �m Th�nh Th�y������������ҵ���.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "Nh�n Th�ng G�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ĵȼ�����������Nh�n Th�ng G�",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��"} },
		{"ThisActivity:CheckMuTong",	{nil} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H�m nay ng��i �� v�t v� l�m r�i, ng�y mai l�i ��n nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGetMuTong",	{nil} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "��a L�o N�ng m�t Th�ng N��c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2737,1,0,0},},1,"Nhanh ch�n �i l�y ��y n��c cho ta"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��"} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H�m nay ng��i �� v�t v� l�m r�i, hay l� ngh� ng�i �i r�i ng�y mai l�i ��n nh�","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveMuTong",	{nil} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "��a L�o N�ng Long �m Th�nh Th�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2738,1,0,0},},1,"Ta kh�ng c� Long �m Th�nh Th�y"} },
		{"AddOneMaterial",	{"Long �m Th�nh Th�y",{tbProp={6,1,2738,1,0,0},},1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveLongYinShengShui",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "Sever m� s� ��ng t�i NPC",
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
