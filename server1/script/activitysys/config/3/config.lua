

-------�ֲ��������� ��ʼ---------
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "ѡ��ѡ������",
	nStartDate = 200910150000,
	nEndDate  = 200911020000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2564,0,"ÿ��ֻ�������ȡ1<color=yellow>����<color> t?color=yellow>�Ϻ�����<color>","=="} },
		{"PlayerFunLib:CheckLevel",	{140,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{"return {tbProp={6,1,2157,1,0,0},nExpiredTime=10080,}",1,"wanbaoxiang,get from npc"} },
		{"PlayerFunLib:AddTaskDaily",	{2564,1} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "ʹ�� [�������]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2157,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"ÿ�����ֻ��ʹ��9�� <color=yellow> ����<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{16,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "ʹ�� [�շ�����]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2158,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"ÿ�����ֻ��ʹ��9��<color=yellow> ����<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{17,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "��������Ϻ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�Ϻ�����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������",1} },
	},
}
