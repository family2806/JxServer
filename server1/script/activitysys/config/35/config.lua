Include("\\script\\activitysys\\config\\35\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,40,EVENT_LOG_TITLE,"�ν��3000����ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "�ν��3000����ȡ����", "40������", 1}},
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"����17��ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "����17��ȡ����", "10 ������", 1}},
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"����28��ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "����28��ȡ����", "10������", 1}},
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "fengling_leader",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"����ˮ��ͷ����ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "����ˮ��ͷ����ȡ����", "10������", 1}},
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "fengling_bigleader",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"����ˮ����ͷ����ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "����ˮ����ͷ����ȡ����", "20 ������", 1}},
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"�׵۹�10����ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "�׵۹�10����ȡ����", "20������", 1}},
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "worldboss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,50,EVENT_LOG_TITLE,"����ƽ�BOSS��ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "����ƽ�BOSS��ȡ����", "50������", 1}},
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "FinishKillerBoss",
	szName = "killer",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,3,EVENT_LOG_TITLE,"����ɱ��BOSS��ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "����ɱ��BOSS��ȡ����", "3 ������", 1}},
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "killer monster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{szName="����",tbProp={6,1,3103,1,0,0},nExpiredTime=20120201,},1,"5"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 1000 and mark < 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"�ν��1000����ȡ����"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "�ν��1000����ȡ����", "20������", 1}},
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click npc named plutus",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"�������ů�Ĵ��죬��λ�������Ե��������ø���ˮ���ϳ�<color=yellow> ������̺��������<color>. �����ʹ��<color=yellow> ������̺��������<color> ���з������������˿��Ի��<color=yellow> �������������������������С�� <color> �Լ�10���͸����Ľ����ң��ҽ��͸���ḻ�Ľ�������������ڼ䣬�ҽ�������ʱ�����λ�Ĵ�ݹ���!"} },
		{"AddDialogOpt",	{"�ϳ��������",12} },
		{"AddDialogOpt",	{"�ϳ��������",15} },
		{"AddDialogOpt",	{"�Ͻ������� (С)",18} },
		{"AddDialogOpt",	{"�����",22} },
		{"AddDialogOpt",	{"����쾭��",28} },
		{"AddDialogOpt",	{"�Ͻ���״���",30} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "wuguobaiyinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ϳ�������������ַ�������һ��: 1 ���㽶+ 1����+ 1����+ 1����+ 1 ����+ 1 ����; �ڶ��ַ����ǣ�1 Ҭ��+ 1 ľ��+1 ����֦+ 1 �޻���+ 1 â��+ 1����. ������ʹ������. ",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��һ��",13} },
		{"AddDialogOpt",	{"�ڶ���",14} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"�㽶",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="�������",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"�ϳ��������"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"â��",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"Ҭ��",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"ľ��",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"����֦",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"�޻���",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="�������",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"�ϳ��������"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "wuguohuangjinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ϳ�������������ַ��ڣ���һ��: 1�㽶+ 1 ����+ 1 ����+ 1 ����+ 1����+ 1 ���̣��ڶ��ַ���: 1 Ҭ�� + 1ľ��+ 1����֦+ 1 �޻���+ 1â��+����. ������������.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��һ��",16} },
		{"AddDialogOpt",	{"�ڶ���",17} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"�㽶",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"�ϳ��������"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"â��",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"Ҭ��",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"ľ��",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"����֦",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"�޻���",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"�ϳ��������"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "handin redbag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",0,0,0,0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������(С)",{tbProp={6,1,3108,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{nJxb=1},100000} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDBAG_DAILY,MAX_REDBAG_DAILY,"��������ѽ����ˣ��������ټ���Ŷ","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,1,EVENT_LOG_TITLE,"NopBaoLiXiNamMoiTaiNPCDaiThanTai"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "NopBaoLiXiNamMoiTaiNPCDaiThanTai", "1000000 ����ֵ", 1}},
		{"ThisActivity:AddTaskDaily",	{TSK_REDBAG_DAILY,1} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "use wuguodebaiyinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3105,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м�������ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOBAIYINPAN,MAX_USED_WUGUOBAIYINPAN,"��������ȡ̫�ཱ���ˣ�Ҫ��������������ô��!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguobaiyinpan",	{nil} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use wuguodehuangjinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3106,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м�������ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOHUANGJINPAN,MAX_USED_WUGUOHUANGJINPAN,"��������ȡ̫�ཱ���ˣ�Ҫ��������������ô��!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguohuangjinpan",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use zhongzi",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3107,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:IsFightState",	{1, "ֻ����ս������ʹ��."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"ThisActivity:CheckUseZhongzi",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhongzi",	{nil} },
	},
}
tbConfig[22] = --һ��ϸ�ڮ�
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "bao li xi do select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���������ʹ�����±�ʯ�е�һ��:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{2918,2,"��������Ѿ������ˣ�����������Ŷ","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�þ��챦ʯ",23} },
		{"AddDialogOpt",	{"����ˮ��",24} },
		{"AddDialogOpt",	{"����ˮ��",25} },
		{"AddDialogOpt",	{"����ˮ��",26} },
	},
}
tbConfig[23] = --�þ��컻�����
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"���챦ʯ",{tbProp={4,353,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{		
		{"ThisActivity:ComposeRedEvelop",	{"�þ��챦ʯ�����"} },
	},
}
tbConfig[24] = --����ˮ���������
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"��ˮ��",{tbProp={4,238,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:ComposeRedEvelop",	{"����ˮ�������"} },
	},
}
tbConfig[25] = --����ˮ�������
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"��ˮ��",{tbProp={4,239,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"����ˮ�������"} },		
	},
}
tbConfig[26] = --����ˮ���������
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"��ˮ��",{tbProp={4,240,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"����ˮ�������"} },		
	},
}
tbConfig[27] = --ʹ�ú����
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "use red evelop",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30169,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2500000,1,EVENT_LOG_TITLE,"ʹ�ú��"} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "��ȡ�����Ի�free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��0:00-16-1-2012 �� 24:00-17-1-2012, 150����150�����ϵĴ���(����������) ������������ȡ����Ϊ�����ӵ�һ�ھ���ֵ, ÿ����ֻ����ȡΨһ��һ��.",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����콱",29} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "�콱free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 0, "ÿ����ֻ����ȡһ��", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"MienPhiNhanThuongDiemKinhNghiem"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "�����ȡ���齱��", "100000000 ����ֵ", 1}},
	},
}
tbConfig[30] = --�������
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "give dragon mask",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>������ֵ",1,1,1,0.02},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"���-����",{tbProp={0,11,75,1,0,0},},1} },
		{"AddOneMaterial",	{"���- ��ͷ",{tbProp={0,11,76,1,0,0},},1} },
		{"AddOneMaterial",	{"���- ����",{tbProp={0,11,77,1,0,0},},1} },
		{"AddOneMaterial",	{"���- ��β",{tbProp={0,11,78,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeDragonMask",	{nil} },		
	},
	tbActition = 
	{
		{"ThisActivity:ComposeDragonMask",	{nil} },		
	},
}