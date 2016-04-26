Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------�ֲ��������� ��ʼ---------
local nCloseDate		= 20100816
local nCloseTime		= 201008160000
local nItemUseDate		= 20100823
local nTask_LittleWord		= 1
local nTask_MiddleWord		= 2
local nTask_FightToken_ChenDu		= 3
local nTask_FightToken_DaLi		= 4
local nTask_FightToken_FengXiang		= 5
local nTask_FightToken_XiangYang		= 6
local nTask_FightToken_BianJin		= 7
local nTask_FightToken_LinAn		= 8
local nTask_FightToken_YangZhou		= 9
-------�ֲ��������� ����---------

local tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\seven_city_war\\themeactivities\\support.lua"} },
	},
	tbActition = 
	{
		{"tbSevenCityWar_Theme:AddNpc",	{nCloseDate} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "��ֵ����ϲ����",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80,90"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2403,1,0,0},nExpiredTime=nCloseDate,},1,"1.5"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν��ô󼪱���_ʤ",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[���PBM][�߼��ν��ô󼪱���]"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν��ô󼪱���_��",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[���PBM][�߼��ν��ô󼪱���]"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν��ô󼪱���_��",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[���PBM][�߼��ν��ô󼪱���]"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "�߼����ػ�ô󼪱���",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"20"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{90,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},100,"[���PBM][�߼����ػ�ô󼪱���]"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "����ɻ�ô󼪱���",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},150,"[���PBM][����ɻ�ô󼪱���]"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "ɱ�������ô󼪱���",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2404,1,0,0},nExpiredTime=nCloseDate,},120,"[���PBM][ɱ�������ô󼪱���]"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "ʹ�ô�ϲ����",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2403,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{76,1,"[���PBM][ʹ�ô�ϲ����]"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "ʹ�ô󼪱���",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {{tbProp={6,1,2404,1,0,0},}},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{77,1,"[���PBM][ʹ�ô󼪱���]"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "���������",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>���ף���°����������λ���������ռ����ֱ���ԭ������ȡ�ҵ���ϡ����!"} },
		{"AddDialogOpt",	{"��С���",12} },
		{"AddDialogOpt",	{"�������(����)",13} },
		{"AddDialogOpt",	{"�������(��Ե¶)",14} },
		{"AddDialogOpt",	{"���°�װ��",15} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "��С���",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"С���",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ս",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{nJxb=10000},1} },
		{"AddOneMaterial",	{"С��Ե¶",{tbProp={6,1,122,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2418,1,0,0},nExpiredTime=nItemUseDate,},1,"[���PBM][��С���]"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "������",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"����",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ս",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{nJxb=60000},1} },
		{"AddOneMaterial",	{"4������",{tbProp={6,1,147,4,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[���PBM][������]"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "����Ե¶",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"��Ե¶",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ս",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{nJxb=40000},1} },
		{"AddOneMaterial",	{"��Ե¶",{tbProp={6,1,124,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2419,1,0,0},nExpiredTime=nItemUseDate,},1,"[���PBM][��Ե¶]"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "���°�װ��",
	nStartDate = nil,
	nEndDate  = nCloseTime,
	tbMessageParam = {"�°�װ��",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��",{tbProp={6,1,2405,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2406,1,0,0},},1} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,2407,1,0,0},},1} },
		{"AddOneMaterial",	{"ս",{tbProp={6,1,2408,1,0,0},},1} },
		{"AddOneMaterial",	{"����",{tbProp={6,1,2409,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{78,1,"[���PBM][���°�װ��]"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "ʹ��С���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2418,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�������������ʹ��",">="} },
		{"ThisActivity:CheckTask",	{nTask_LittleWord,999,"ÿ���������ֻ��ʹ��999��С���","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_LittleWord,1} },
		{"PlayerFunLib:AddExp",	{1000000,0,"[���PBM][ʹ��С���]"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "ʹ��С���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2419,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�������������ʹ��",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"ÿ���������ֻ��ʹ������񷣬�����壬����������ʥ�ף�ս��ѥ�ܹ�999��","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{2500000,0,"[���PBM][ʹ�������]"} },
		{"PlayerFunLib:GetAward",	{79,1,"[���PBM][ʹ�������]"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "ʹ��������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2420,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�������������ʹ��",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"ÿ���������ֻ��ʹ������񷣬�����壬����������ʥ�ף�ս��ѥ�ܹ�999��","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"��Ҫ���������Ͽ�λ����ʹ�������壬����������ʥ�ף�ս��ѥ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{4000000,0,"[���PBM][ʹ��������]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[���PBM][ʹ��������]"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "ʹ�ó�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2421,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�������������ʹ��",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"ÿ���������ֻ��ʹ������񷣬�����壬����������ʥ�ף�ս��ѥ�ܹ�999��","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"��Ҫ���������Ͽ�λ����ʹ�������壬����������ʥ�ף�ս��ѥ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{6000000,0,"[���PBM][ʹ�ó�����]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[���PBM][ʹ�ó�����]"} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "ʹ�ô�ʥ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2422,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�������������ʹ��",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"ÿ���������ֻ��ʹ������񷣬�����壬����������ʥ�ף�ս��ѥ�ܹ�999��","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"��Ҫ���������Ͽ�λ����ʹ�������壬����������ʥ�ף�ս��ѥ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{8000000,0,"[���PBM][ʹ�ô�ʥ��]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[���PBM][ʹ�ô�ʥ��]"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "ʹ��ս��ѥ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2423,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"50�������������ʹ��",">="} },
		{"ThisActivity:CheckTask",	{nTask_MiddleWord,999,"ÿ���������ֻ��ʹ������񷣬�����壬����������ʥ�ף�ս��ѥ�ܹ�999��","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"��Ҫ���������Ͽ�λ����ʹ�������壬����������ʥ�ף�ս��ѥ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_MiddleWord,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[���PBM][ʹ��ս��ѥ]"} },
		{"PlayerFunLib:GetAward",	{80,1,"[���PBM][ʹ��ս��ѥ]"} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "ʹ�óɶ�Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2411,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_ChenDu,20,"ͬһ������Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_ChenDu,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[��� PBM][ʹ�óɶ�Ѫս��]"} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "ʹ�ô���Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2412,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_DaLi,20,"ͬһ������Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_DaLi,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[��� PBM][ʹ�ô���Ѫս��]"} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "ʹ�÷���Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2413,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_FengXiang,20,"ͬһ������Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_FengXiang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[���PBM][ʹ�÷���Ѫս��]"} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "ʹ�÷���Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2414,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_XiangYang,20,"ͬһ������Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_XiangYang,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[��� PBM][ʹ�÷���Ѫս��]"} },
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "ʹ���꾩Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2415,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_BianJin,20,"ͬһ������Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_BianJin,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[���PBM][ʹ���꾩Ѫս��]"} },
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "ʹ���ٰ�Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2416,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_LinAn,20,"ͬһ�����Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_LinAn,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[���PBM][ʹ���ٰ�Ѫս��]"} },
	},
}
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "ʹ������Ѫս��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2417,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FightToken_YangZhou,20,"ͬһ�����Ѫս��ֻ��ʹ��20��.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{nTask_FightToken_YangZhou,1} },
		{"PlayerFunLib:AddExp",	{10000000,0,"[���PBM][ʹ������Ѫս��]"} },
	},
}
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��һ��Ǭ����",30} },
		{"AddDialogOpt",	{"���Ŵ����",31} },
		{"AddDialogOpt",	{"���������",32} },
		{"AddDialogOpt",	{"����Ӱ���",33} },
		{"AddDialogOpt",	{"���������",34} },
	},
}
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "��һ��Ǭ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"һ��Ǭ����",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=43200,},1,"[���PBM][��1��һ��Ǭ����"} },
	},
}
tbConfig[31] = --һ��ϸ��
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "���Ŵ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�Ŵ����",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,469,1,0,0},nExpiredTime=10080,},1,"[���PBM][���Ŵ����]"} },
	},
}
tbConfig[32] = --һ��ϸ��
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "���������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},30} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,470,1,0,0},nExpiredTime=10080,},1,"[���PBM][���������]"} },
	},
}
tbConfig[33] = --һ��ϸ��
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "����Ӱ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��Ӱ���",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[���PBM][����Ӱ���]"} },
	},
}
tbConfig[34] = --һ��ϸ��
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "���������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�������",0,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[���PBM][���������]"} },
	},
}
tbConfig[35] = --һ��ϸ��
{
	nId = 35,
	szMessageType = "ClickNpc",
	szName = "������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����",36} },
	},
}
tbConfig[36] = --һ��ϸ��
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��",0,2,3,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"������Ƭ",{tbProp={6,1,2410,1,0,0},},81} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{81,1,"[���PBM][����]"} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(18, tbConfig)
