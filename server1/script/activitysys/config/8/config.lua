

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "ת����Ľ�Ʒ�ﵽ160��Ϊ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{3,"ֻ���ڵ�190�����е�����������ͬʱ�ﵽ160��������ȡ��Ʒ","=="} },
		{"PlayerFunLib:CheckLevel",	{160,"ֻ���ڵ�190�����е�����������ͬʱ�ﵽ160��������ȡ��Ʒ","=="} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",1,1,"ֻ���ڵ�190�����е�����������ͬʱ�ﵽ160�������յ���Ʒ"} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",2,0,"�����Ѿ���ȡ�ý�Ʒ��."} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10,7,5,5,0},nExpiredTime=259200,},1,"3rdTransAward"} },
		{"PlayerFunLib:SetTaskBit",	{"2582",2,1} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "ת����Ľ�Ʒ�ﵽ160��Ϊ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"ת����Ľ�Ʒ�ﵽ160��Ϊ����",1} },
	},
}
