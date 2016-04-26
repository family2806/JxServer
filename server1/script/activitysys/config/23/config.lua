Include("\\script\\activitysys\\config\\23\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "FinishYesou",
	szName = "һ���������10��Ұ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_YeSou,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"һ���������ʮ��Ұ������"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_YeSou,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "LeagueResult",
	szName = "�����е�һ������ʤ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {2,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LeagueMatch,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"�����е�һ������ʤ"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LeagueMatch,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "���յ�һ�εõ�3000�ν����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_SongJin,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"���յ�һ�εõ�3000�ν����"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_SongJin,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "���յ�һ�������ʹ��֮��",
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
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "���յ�һ����ɷ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_FengLingDu,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"���յ�һ����ɷ����"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_FengLingDu,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "����ɱ��3�����ֵ�һ��95��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNpcPower",	{2} },
		{"NpcFunLib:CheckNpcLevel",	{"95"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LanGuai,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"����ɱ��3�����ֵ�һ��95��"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LanGuai,1} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "Chuanguan",
	szName = "���յ�һ����ɴ���1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28", 2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_ChuangGuan,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"���յ�һ����ɴ���1"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_ChuangGuan,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "ɱ������(����)",
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
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "�׵۱���(����)",
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
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "��������(����)",
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
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishCangBaoTu",
	szName = "����3�δ�����һ���ر�ͼ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_CangBaoTu,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"����3�δ�����һ���ر�ͼ��"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_CangBaoTu,1} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "nil",
	szName = "ɱ��BOSS(����)",
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
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "ÿ�������콱",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"��������",14} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_GetEveryDay,0,"���Ѿ�����!","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,format("ÿ�����ֻ����%d�����죬�������Ѿ��칺�ˣ�����������", 25),"<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"���װ��û�п�λ�ˣ��˴ν������ܻ��"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"ÿ�������콱"} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_GetEveryDay,2} },
		{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
