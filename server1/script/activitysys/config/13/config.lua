

-------�ֲ��������� ��ʼ---------
local TASK_TIME_LEFT_A		= 2662
local TASK_TIME_LEFT_B		= 2663
local TASK_ITEM_USED_A		= 2664
local TASK_ITEM_USED_B		= 2665
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "nil",
	szName = "��Ѫ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{917,1816,3392} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "nil",
	szName = "���˹�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{918,1816,3392} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "ʴ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ�գ�",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{919,1608,3168} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "��ľ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{920,1608,3168} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "�츽ɽ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{921,1560,3104} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "����ɽ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{922,1560,3104} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "��ĸɽ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{923,2008,4080} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "���ɽ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"�ȼ����ͣ����¶Դ���̫Σ��!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"����������ʱ��������!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{924,2008,4080} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "ʹ�ð׹���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2255,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"���ǳ�ֵ��Ҽ�130�����ϲ���ʹ��",">="} },
		{"PlayerFunLib:IsCharged",	{"���ǳ�ֵ��Ҽ�130�����ϲ���ʹ��"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,1020,"�׹�������ʱ�����ֻ�ܻ���1080����!","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_A,3,"�˵���ÿ��ֻ��ʹ��3��!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_A,1} },
		{"dostring",	{"local nLeftTime = GetTask(2662); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2662, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[�׹��������۵�ʱ��Ϊ%d ����]], GetTask(2662)))"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "ʹ��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2256,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"���ǳ�ֵ��Ҽ�130�����ϲ���ʹ��",">="} },
		{"PlayerFunLib:IsCharged",	{"���ǳ�ֵ��Ҽ�130�����ϲ���ʹ��"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,1020,"�׹�������ʱ�����ֻ�ܻ���1080����","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_B,3,"�˵���ÿ��ֻ��ʹ��3��!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_B,1} },
		{"dostring",	{"local nLeftTime = GetTask(2663); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2663, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[�����������۵�ʱ��Ϊ%d ����]], GetTask(2663)))"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
--		{"AddDialogOpt",	{"�ߵ��µĵ�ͼ",13} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "ѡ���ͼ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�͹���ȥ��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��Ѫ��",2} },
		{"AddDialogOpt",	{"���˹�",3} },
		{"AddDialogOpt",	{"ʴ����",4} },
		{"AddDialogOpt",	{"��ľ��",5} },
		{"AddDialogOpt",	{"�츽ɽ",6} },
		{"AddDialogOpt",	{"����ɽ",7} },
		{"AddDialogOpt",	{"��ĸɽ",8} },
		{"AddDialogOpt",	{"���ɽ",9} },
	},
}
