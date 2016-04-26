

-------�ֲ��������� ��ʼ---------
local nTask_HuDie		= 1
local nTask_XinXin		= 2
local nTask_ZhuXin_YuanXin		= 3
local nTask_ChenDu		= 4
local nTask_DaLi		= 5
local nTask_FengXiang		= 6
local nTask_XiangYang		= 7
local nTask_BianJin		= 8
local nTask_LinAn		= 9
local nTask_YangZhou		= 10
local nTask_GiveCount		= 11
local nTask_Activi_Point		= 2794
-------�ֲ��������� ����---------

tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "��ֵ�����ź��",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"322,321,144,124,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2496,1,0,0},nExpiredTime=20101011,},1,"5"} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "��ֵ����̶���",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"225,226,227,224,340,75"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2497,1,0,0},nExpiredTime=20101011,},1,"5"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "��ֵ�����ͷ",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2498,1,0,0},nExpiredTime=20101011,},1,"1"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν��������Ŵ����⣨ʤ��",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[����] [�ν�����Ŵ�����]"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν��������Ŵ�����(��)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[����] [�ν�����Ŵ�����]"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν��������Ŵ����⣨�䣩",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[����] [�ν�����Ŵ�����]"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "ClickNpc",
	szName = "�̵������ڰ�",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"�̵�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����ڰ�",8} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "�����ڰ�",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"���ڰ�",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"30000 l��ng",{nJxb=30000,},1} },
		{"lib:CheckDay",	{20100920, 20101011, "��ȡʱ���ѽ���"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2500,1,0,0},nExpiredTime=20101011,},1,"[����] [�̷������ڰ�]"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "�϶�ϳ�",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"�ϳ�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳɵ���",10} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "�ϳɻ��ֵȼ�",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"<npc>������ϳ����ֵ���?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��������",11} },
		{"AddDialogOpt",	{"���ǵ�",12} },
		{"AddDialogOpt",	{"���ܵ���",13} },
		{"AddDialogOpt",	{"Բ����",14} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "�ϳɺ�������",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"��������",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��ź��",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"�̶���",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"��ͷ��",{tbProp={6,1,2498,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "��ȡʱ���ѽ���"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2502,1,0,0},nExpiredTime=20101018,},1,"[����] [�ϳɵ���]"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "�ϳ����ǵ���",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"���ǵ���",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��ź��",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"�̶���",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"��ͷ��",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"Ŵ�����",{tbProp={6,1,2499,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "��ȡʱ���ѽ���"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2503,1,0,0},nExpiredTime=20101018,},1,"[����] [�ϳɵ���]"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "�ϳɳ��ܵ���",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"���ܵ���",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��ź��",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"�̶���",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"��ͷ��",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"���ڱ�",{tbProp={6,1,2500,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "��ȡʱ���ѽ���"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2504,1,0,0},nExpiredTime=20101018,},1,"[����] [�ϳɵ���]"} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "�ϳ�Բ����",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"Բ����",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"��ź��",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"�̶���",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"��ͷ��",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"ʲ����",{tbProp={6,1,2501,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "��ȡʱ���ѽ���"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2505,1,0,0},nExpiredTime=20101018,},1,"[����] [�ϳɵ���]"} },
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","����һ�������"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "ʹ�ú�������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2502,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","�ڳ��л������ִ�ʹ��!"} },
		{"PlayerFunLib:IsFightState",	{1,"��ս������ʹ��!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"ThisActivity:CheckTask",	{nTask_HuDie,1000,"�ﵽ��߾��飬�����ٻ�ȡ����!","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AwardExp",	{1000000, nTask_HuDie, 1000000000, "ʹ�ú�������", "[����][ʹ�ú�������]"} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "ʹ�����ǵ���",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2503,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","���ڳ��л������ִ�ʹ��!"} },
		{"PlayerFunLib:IsFightState",	{1,"����ս������ʹ��!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"��������"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "ʹ�ó��ܵ���",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2504,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","���ڳ��л������ִ�ʹ��!"} },
		{"PlayerFunLib:IsFightState",	{1,"����ս������ʹ��!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"��ʤ����"} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "ʹ��Բ����",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2505,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","���ڳ��л������ִ�ʹ��!"} },
		{"PlayerFunLib:IsFightState",	{1,"����ս������ʹ��!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"�����ʿ"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "ʹ�óɶ������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2507,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_ChenDu,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ�óɶ������]"} },
		{"ThisActivity:AddTask",	{nTask_ChenDu,1} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "ʹ�ô��������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2508,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_DaLi,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ�ô��������"} },
		{"ThisActivity:AddTask",	{nTask_DaLi,1} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "ʹ�÷��������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2509,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FengXiang,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ�÷��������]"} },
		{"ThisActivity:AddTask",	{nTask_FengXiang,1} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "ʹ�����������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2510,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_XiangYang,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ�����������]"} },
		{"ThisActivity:AddTask",	{nTask_XiangYang,1} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "ʹ���꾩�����",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2511,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_BianJin,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ���꾩�����]"} },
		{"ThisActivity:AddTask",	{nTask_BianJin,1} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "ʹ���ٰ������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2512,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_LinAn,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ���ٰ������]"} },
		{"ThisActivity:AddTask",	{nTask_LinAn,1} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "ʹ�����������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2513,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_YangZhou,20,"�ڻʱ�䣬ÿ�ֱ�ֻ��ʹ��20��","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"50�����ϲ��ܲμӻ",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[����][ʹ�����������]"} },
		{"ThisActivity:AddTask",	{nTask_YangZhou,1} },
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddTaskNpc",	{nil} },
		{"tb2010ZhongQiu:AddDecorationNpc",	{nil} },
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "ClickNpc",
	szName = "���϶�Ի�",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"�϶�"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trong th�i gian 0 gi?20/09/2010 ��n 0 gi?11/10/2010, ��2010��09��20����2010��10��11�գ�ͬ�п���ͨ����֣��ν��̵꣬�������ȡ�����������ͬʱҲ���Ժϳɸ��ֵ�������10��18��ǰʹ�õ����������ٻ�����BOSS����ܺ��յ��ḻ�Ľ�����ͬʱ�����ɼƻ��յ������������������������϶��㣬���յ����齱������1000,2000,3000...���յ���ƽ������ľ��顣�϶�Ĵ�Ƚ������ѽɵ�������������������ÿ��20������϶�������״̬�������ַ��̻�ЧӦ����λվ����Χ��ͬ�п����յ����齱����ÿ��20��30�֣��϶𽫻ص���С״̬������������Ҳ�ص�0.�ڻʱ���ڣ�ÿ�������ֻ�ܽ�1999����"} },
		{"AddDialogOpt",	{"����������",28} },
		{"AddDialogOpt",	{"����ѽ�����",34} },
	},
}
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "����������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"����������",1,1,1,0.01},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "��ѽ���"} },
		{"lib:CheckTime",	{{{000000,200000},{203000,240000}}, "���ǻʱ��"} },
		{"AddOneMaterial",	{"��������",{tbProp={6,1,2506,1,0,0},},1} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
		{"ThisActivity:CheckTask",	{nTask_GiveCount,"1999 - <ComposeCount> ","�ڻʱ���ڣ�ÿ��ֻ�ܽ�1999��!","<="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:AddExp",	{500000,0,"[����][����������]"} },
		{"tb2010ZhongQiu:GiveItem2HengE",	{nil} },
		{"ThisActivity:AddTask",	{nTask_GiveCount,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","����һ���¼�����"} },
	},
}
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "�������",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"С��"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���������",33} },
		{"AddDialogOpt",	{"���������",35} },
		{"AddDialogOpt",	{"����Ӳ���",36} },
		{"AddDialogOpt",	{"����Ӱ���",30} },
		{"AddDialogOpt",	{"�������������",31} },
		{"AddDialogOpt",	{"��һ��Ǭ����",32} },
	},
}
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "����Ӱ���",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"��Ӱ���",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "��ȡʱ���ѽ���"} },
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[����][����Ӱ]"} },
	},
}
tbConfig[31] = --һ��ϸ��
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "�������������",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"�����������",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "��ȡʱ���ѽ���"} }
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},3} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0},nExpiredTime=20160, tbParam={60}},1,"[����][��ȡ�����������]"} },
	},
}
tbConfig[32] = --һ��ϸ��
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "��һ��Ǭ����",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"һ��Ǭ����",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "��ȡʱ���Ѿ�����"} }
		{"AddOneMaterial",	{"һ��Ǭ����",{tbProp={6,1,2125,1,0,0},},300} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=20160,},1,"[����][��һ��Ǭ����"} },
	},
}
tbConfig[33] = --һ��ϸ��
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "���������",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"�������",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "��ȡʱ���Ѿ�����"} }
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[����][���������]"} },
	},
}
tbConfig[34] = --һ��ϸ��
{
	nId = 34,
	szMessageType = "nil",
	szName = "����ѽ�������������",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "��ѽ���"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:ShowGiveCount",	{nTask_GiveCount} },
	},
}
tbConfig[35] = --һ��ϸ��
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "���������",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"�������",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "���������ʱ��"} }
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,479,1,0,0},nExpiredTime=10080,},1,"[����][���������]"} },
	},
}
tbConfig[36] = --һ��ϸ��
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "����Ӳ���",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"��Ӳ���",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "��ȡʱ���ѽ���"} }
		{"AddOneMaterial",	{"������ʯ",{tbProp={6,1,2125,1,0,0},},20} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,480,1,0,0},nExpiredTime=10080,},1,"[����][����Ӳ���]"} },
	},
}
