Include("\\script\\activitysys\\config\\28\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "��ҵ��������ũ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"������ũ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>���쵽�ˣ����������Ǵ������һЩ��"} },
		{"AddDialogOpt",	{"����ֲ���ڻ�y",2} },
		{"AddDialogOpt",	{"��ȡľͰ",3} },
		{"AddDialogOpt",	{"����ũһͰˮ",4} },
		{"AddDialogOpt",	{"����ũ����ʥˮ",5} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "����ֲ���ڻ�y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>���쵽�ˣ�������ֻ�����2011��03��28��0ʱ��2011��04��04��24ʱ��С�����Ե�������ȡľͰ��Ȼ��������(206,189), ��Ȫ�� (223,189)����ʯ���� (217,184)��ˮ̶������ˮ��ÿ��ÿ�����ֻ����5�Σ�С��Ҫ��ˮ�������ң��ҽ�������Ľ������������԰�����ʥˮ�����ң��ҽ�����ḻ��Ʒ�����һ������ʥˮ�����ﵽ500�Σ������15�������㲻�ܴ��������ľ�ͽ��뿪�������ʥˮ������������ҵ���.",0},
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
	szName = "��ľͰ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"��ĵȼ�������������ľͰ",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ�������"} },
		{"ThisActivity:CheckMuTong",	{nil} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"�������Ѻ������ˣ���������Ŷ","<"} },
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
	szName = "����ũһͰˮ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"���ĵȼ����������ܲμӻ",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2737,1,0,0},},1,"���ȥ�ù�ˮ����"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ������ ��"} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"�������Ѿ��������ˣ�Ҫ����Ϣ������������","<"} },
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
	szName = "����ũ����ʥˮ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"���ĵȼ����������ܲμӻ",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2738,1,0,0},},1,"��û������ʥˮ"} },
		{"AddOneMaterial",	{"����ʥˮ",{tbProp={6,1,2738,1,0,0},},1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ�������"} },
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
	szName = "�������򿪽�����NPC",
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
