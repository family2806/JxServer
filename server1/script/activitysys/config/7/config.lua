Include("\\script\\activitysys\\g_activity.lua")
local tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "DailogOption",
	szName = "��������֦��ȡ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ѩ÷","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer1","��������ʲô������"} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ComposeDailogOption",
	szName = format("ʹ��g %s ��ȡ����", "С��֦", 4000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","������",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"С��֦","return {tbProp={6,1,2141,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"ʹ��С��֦������֦������֦�����ֻ�ܵõ�300.000.000 ����","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{18} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "ComposeDailogOption",
	szName = format("ʹ��%s ���� %u ����", "����֦", 6000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","������",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����֦","return {tbProp={6,1,2142,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"ʹ��С��֦, ����֦������֦�����ֻ�ܵ�300.000.000 ����","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{19} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "ComposeDailogOption",
	szName = format("ʹ�� %s ���� %u ����", "����֦", 10000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","������",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����֦","return {tbProp={6,1,2143,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"ʹ��С��֦,����֦������֦�����ֻ��300.000.000 ����","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{20} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "DailogOption",
	szName = format("�յ� %s", "װ�ε�"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ѩ÷","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer2","��������ʲô����ȡ?"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "ComposeDailogOption",
	szName = format("ʹ��%s �� %d %s", "С��֦", 1, "װ�ε�"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","��װ�ε�",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"С��֦","return {tbProp={6,1,2141,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"���»�û�а��"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{1} },
		{"G_ACTIVITY:ExecActivityDetail",	{18} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "ComposeDailogOption",
	szName = format("ʹ��%s ��%d %s", "����֦", 2, "װ�ε�"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","��װ�ε�",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����֦","return {tbProp={6,1,2142,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"������Ȼ��û�а��"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{2} },
		{"G_ACTIVITY:ExecActivityDetail",	{19} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "ComposeDailogOption",
	szName = format("ʹ��%s �� %d %s", "����֦", 3, "װ�ε�"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","��װ�ε�",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����֦","return {tbProp={6,1,2143,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"������Ȼ��û�а��"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{3} },
		{"G_ACTIVITY:ExecActivityDetail",	{20} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "DailogOption",
	szName = "�����װ�ε�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ѩ÷","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3","�����뿴ʲô��"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "DailogOption",
	szName = "������װ�ε����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3","",""},
	tbCondition = 
	{
		{"PlayerFunLib:IsHaveTong",	{"������Ȼû�а��"} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:TongInfo",	{nil} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "DailogOption",
	szName = "�����װ�ε����а����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1","ѡ��һ���������"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "DailogOption",
	szName = "ÿ�����а�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.1", format("<lua LadderFunLib:GetInfo(10263,\"%s\",\"%s\",\"%s\")/>", "���", "�������", "����" ) } },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "DailogOption",
	szName = "�����а�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.2",format("<lua LadderFunLib:GetInfo(10264,\"%s\",\"%s\",\"%s\")/>", "���", "�������", "����")} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "DailogOption",
	szName = "����������а�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.3",format("<lua LadderFunLib:GetInfo(10265,\"%s\",\"%s\",\"%s\")/>",  "���", "�������", "����" )} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "DailogOption",
	szName = "��ȡ��Ʒ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ѩ÷","",""},
	tbCondition = 
	{
		{"PlayerFunLib:IsHaveTong",	{"������Ȼ��û�а��"} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:GetAwardDailog",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "DailogOption",
	szName = "�i�ߵ���������ʥ�����ĵص�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"tbZhongQiu200909:FlyToTree",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "SetDailogTitle",
	szName = "����ѩ÷����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ѩ÷","<npc>".." ������ҪѰ����������֦��װ����Χ��ʥ��������������¡�ء��������԰���Ѱ����������֦��?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "nil",
	szName = "���ӹ��µ㣬ͬʱ���Ӿ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"ʹ��С��֦������֦������֦�����ֻ�ܵ�300.000.000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{4000000,0,"��֦������"} },
		{"PlayerFunLib:AddTask",	{2647,4} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "nil",
	szName = "���ӹ��µ㣬ͬʱ���Ӿ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"ʹ��С��֦������֦������֦�����ֻ�ܵ�300.000.000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{6000000,0,"��֦������"} },
		{"PlayerFunLib:AddTask",	{2647,6} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "nil",
	szName = "���ӹ��µ㣬ͬʱ���Ӿ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"ʹ��С��֦������֦������֦�����ֻ�ܵ�300.000.000 ����","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"��֦������"} },
		{"PlayerFunLib:AddTask",	{2647,10} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(7, tbConfig)
