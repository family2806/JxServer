Include("\\script\\activitysys\\config\\41\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc named dazhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"����˧"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�Ͻ��պ�",3} },
		{"AddDialogOpt",	{"��ȡ��һ��˧�ƺ�",4} },
		{"AddDialogOpt",	{"��ȡ��һ��˧����",5} },
		{"AddDialogOpt",	{"�����һ��˧����",6} },
		{"AddDialogOpt",	{"������Ż���",7} },
		{"AddDialogOpt",	{"�����պ�",16} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "handin medal total",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"����",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_MEDAL,MAX_DAILY_HANDIN_MEDAL,"���������Ͻ���̫���ˣ�����������","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�Ͻ�1���պ�",24} },
		{"AddDialogOpt",	{"�Ͻ�2���պ�",25} },
		{"AddDialogOpt",	{"�Ͻ�3���պ�",26} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "get title named diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_GET_TITLE,1,"������ȡ�óƺ���","<"} },
		{"lib:CheckTimeAndWeekDay",	{1000,2400,"4","��ÿ��������10:00��24:00h������ȡ"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetTitle_1",	{nil} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "get diyizhushuai award",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_EXP_AWARD,1,"����������ȡ�ý����ˣ�����������","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetZhuShuaiAward_1",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "active diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin ch�o",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"������µļ�������Ѿ����꣬������������","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�������ȡЧ��2������",8} },
		{"AddDialogOpt",	{"�����׵���ȡЧ��2������",9} },
		{"AddDialogOpt",	{"�����ν���ȡЧ��2������",10} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "query mark",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:QueryMark_1",	{nil} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "active chuangguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"������µļ�������Ѿ����꣬������������","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_CHUANGGUAN} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "active YDBZ",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"������µļ�������Ѿ����꣬������������","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_YDBZ} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "active songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"������µļ�������Ѿ����꣬������������","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_SONGJIN} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"�ν�3000��պ�"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "songjin mark < 3000 and >= 1000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"�ν�1000��պ�"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "chuangguan 17",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"����17��պ�"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "chuangguan 28",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"����28��պ�"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ 6",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"�׵۴���6��պ�"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "level up medal",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"����",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"������2���պ�",17} },
		{"AddDialogOpt",	{"������3���պ�",18} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "nil",
	szName = "compse medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{1} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "nil",
	szName = "compse medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{2} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"�̷�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ʯ��",20} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"�÷�",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"����",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SHIJIN,1,EVENT_LOG_TITLE,"buy_shijin"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "click npc named caifengshi",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"�÷�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����콱",22} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LOGIN_MEDAL,MAX_DAILY_LOGIN_MEDAL,"������������ȡ�ˣ�����������.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "nil",
	szName = "hand in medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{1} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "nil",
	szName = "hand in medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{2} },
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "SignUpSongJin",
	szName = "sign up songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {3},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_SONGJIN} },
	},
}
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "SignUpYDBZ",
	szName = "sign up ydbz",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_YDBZ} },
	},
}
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
	szMessageType = "SignUpChuangguan",
	szName = "sign up chuanggguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {2},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_CHUANGGUAN} },
	},
}
