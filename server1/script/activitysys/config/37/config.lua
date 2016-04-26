Include("\\script\\activitysys\\config\\37\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "����������������ʥ������",
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
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "��ֵ�ͼ���ʥ����",
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
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CLOTHING,1,"6"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "�i�߼��ν���ָ���1000����3000���ʥ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"�ν�1000��ȡʥ����"} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "�i�߼��ν����3000���ʥ����",
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
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,30,EVENT_LOG_TITLE,"�ν�3000���ʥ����"} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "������17�ػ��ʥ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"������17�ػ��ʥ����"} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "������28�ػ��ʥ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"������28�ػ��ʥ����"} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "ˮ��ͷ�����ɻ��ʥ����",
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
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"����ˮ��ͷ����ʥ����"} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "ˮ����ͷ����ʥ����",
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
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,20,EVENT_LOG_TITLE,"����ˮ����ͷ����ʥ����"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴��ع���10�ػ��ʥ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,15,EVENT_LOG_TITLE,"�׵۴��ع���10�ػ��ʥ����"} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "����ƽ�BOSS",
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
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,50,EVENT_LOG_TITLE,"����ƽ�BOSS���ʥ����"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "����ɱ��BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,3,EVENT_LOG_TITLE,"����ɱ��BOSS���ʥ����"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "��������Boss ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"30"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_STAR,1,EVENT_LOG_TITLE,"chuangguan30"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "�׵��������BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:YDBZ_GiveStar",	{nil} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "���ʥ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online �콱",15} },
		{"AddDialogOpt",	{"�ϳ���Ʒ",17} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "��ʥ����Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��0:00-01-12-2011 �� 24:00-31-12-2011,150���Լ�150�����ϵĴ���(����������) ���Բμ�ʥ�����ֻҪ����һ��Сʱ�����10��ʥ�����Ӻ�40���Ϲϱ���ÿ�����ֻ�ܻ5��",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online�콱",16} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "nil",
	szName = "������ʥ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_XMAS_TROUSERS_DAILY,50,"�����㲻�����ˣ�����������.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveXmasTrousers",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "�ϳ���Ʒ�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�ڻʱ���ڣ��������Ե�����ϳ�ʥ����У�ʥ������(С), ʥ������ (��), ʥ������(��), ʥ����, ����ʥ����гɹ��ϳɵı���Ϊ70%, Сʥ�����˳ɹ��ϳɵı���Ϊ60%, ������Ʒ�ɹ��ϳɵı���Ϊ100%,����ϳ���",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�ϳ�ʥ�����",18} },
		{"AddDialogOpt",	{"�ϳ�ʥ������(С)",19} },
		--��ʱ�ر�- Modified By DinhHQ - 20111129
	--	{"AddDialogOpt",	{"�ϳ�ʥ������(��)",20} },
		{"AddDialogOpt",	{"�ϳ�ʥ������(��)",21} },
		{"AddDialogOpt",	{"�ϳ�ʥ����",22} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "�ϳ�ʥ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���ʥ�����",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ʥ���·�",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"ʥ������",ITEM_XMAS_TROUSERS,1} },
		--Change request Event Noel - Modified by DinhHQ - 20111129
		{"AddOneMaterial",	{"����",{nJxb=1},50000} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeXmasGift",	{nil} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "�ϳ�ʥ������(С)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ������(С)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ʥ���·�",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"ʥ������",ITEM_XMAS_TROUSERS,1} },
		{"AddOneMaterial",	{"ʥ����",ITEM_XMAS_BAG,1} },
		--Change request Event Noel - Modified by DinhHQ - 20111129
		{"AddOneMaterial",	{"����",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeXmasPerson_S",	{nil} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "�ϳ�ʥ������(��)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ������(��)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ʥ���·�",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"ʥ��ñ��",{tbProp={6,1,3072,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3078,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"�ϳ�ʥ������(��)"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "�ϳ�ʥ������(��)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ������(��)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ʥ���·�",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"ʥ������",ITEM_XMAS_TROUSERS,1} },
		{"AddOneMaterial",	{"ʥ������",ITEM_XMAS_BAG,1} },
		{"AddOneMaterial",	{"ʥ��ñ��",{tbProp={6,1,3072,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3079,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"�ϳ�ʥ������(��)"} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "�ϳ�ʥ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ����",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"ʥ���·�",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"ʥ������",ITEM_XMAS_BAG,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3082,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"composeXmasCake"} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "���ʥ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ������"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"�� 0:00-01-12-2011 �� 24:00-31-12-2011, 150���Լ�150�����ϵĴ���(����������)���Ե���ʹ��300, 400, 500����������ȡ����BOSS����������Ľ��ȫ�л����ƣ����뻻����?"} },		
		{"AddDialogOpt",	{"����BOSS�л�����",24} },
		{"AddDialogOpt",	{"�������л�����",25} },
		{"AddDialogOpt",	{"Ľ��ȫ�л�����",26} },
		--��n b?exp - Modified by DinhHQ - 20111201
		--{"AddDialogOpt",	{"��ȡ����ֵ����",33} },
		--Ho�t ��ng th?3 - Modified By DinhHQ -20111215
		{"AddDialogOpt",	{"ʥ��ҹ����",34} },
		{"AddDialogOpt",	{"�ϳ�ʥ������",38} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "����BOSS�л�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����BOSS����",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"����",ITEM_XMAS_STAR,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3083,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "�������л�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" Boss���� - ������",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"����",ITEM_XMAS_STAR,400} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3084,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "Ľ��ȫ�л�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Boss���� - Ľ��ȫ",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"����",ITEM_XMAS_STAR,500} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3085,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "ʹ��ʥ������ (С)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3077,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_S_LIMIT,MAX_USED_XMAS_PERSON_S_LIMIT,"����ʹ�ù���ʥ������(С), ������ʹ����!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_S",	{nil} },
	},
}
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "ʹ��ʥ������(��)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3078,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_M_LIMIT,MAX_USED_XMAS_PERSON_M_LIMIT,"����ʹ�ù���ʥ������(��), ������ʹ����!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_M",	{nil} },
	},
}
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "ItemScript",
	szName = "ʹ��ʥ������(��)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3079,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_L_LIMIT,MAX_USED_XMAS_PERSON_L_LIMIT,"����ʹ�ù���ʥ������(��), ������ʹ����!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_L",	{nil} },
	},
}
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
	szMessageType = "ItemScript",
	szName = "ʹ��ʥ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3080,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_GIFT_LIMIT,MAX_USED_XMAS_GIFT_LIMIT,"����ʹ�ù���ʥ�����, ������ʹ����!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasGift",	{nil} },
	},
}
tbConfig[31] = --һ��ϸ��
{
	nId = 31,
	szMessageType = "ItemScript",
	szName = "ʹ��ʥ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3082,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_CAKE_LIMIT,MAX_USED_XMAS_CAKE_LIMIT,"����ʹ�ù���ʥ����, ������ʹ����!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasCake",	{nil} },
	},
}
tbConfig[32] = --һ��ϸ��
{
	nId = 32,
	szMessageType = "OnLogin",
	szName = "�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[33] = 
{
	nId = 33,
	szMessageType = "nil",
	szName = "��ȡʥ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetCompensation",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2911,nStartBit = 29,nBitCount = 1,nMaxValue = 1}, 0, "ÿ��ֻ���콱һ��", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2911,nStartBit = 29,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{18e6,0,"Event_Noel","��ȡ������������"} },
	},
}
tbConfig[34] =
{
	nId = 34,
	szMessageType = "CreateDialog",
	szName = "ʥ��ҹ�콱�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�� 0:00-24-12-2011 �� 24:00-25-12-2011,150���Լ�150�����ϵĴ���(����������)���Ե�������ȡʥ����ƷΪ2�ڲ����Ӿ���ֵ��ÿ����ֻ����ȡΨһ��һ�Ρ�",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�����콱",35} },
	},
}
tbConfig[35] = 
{
	nId = 35,
	szMessageType = "nil",
	szName = "��ȡʥ��ҹ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 20,nBitCount = 1,nMaxValue = 1}, 0, "ÿ��ֻ����ȡһ�ν���", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 20,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{200e6,0,"Event_Noel","NhanThuongDiemKinhNghiemDemGiangSinh"} },
	},
}
tbConfig[36] =--�̷��򿾼�
{
	nId = 36,
	szMessageType = "ClickNpc",
	szName = "����̷�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�̷�"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"�򿾼�",37} },
	},
}
tbConfig[37] =
{
	nId = 37,
	szMessageType = "CreateCompose",
	szName = "�򿾼�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����",1,1,1,0.02,0,50},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"����",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="G?quay",tbProp={6,1,30167,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"�򿾼�"} },
	},
}
tbConfig[38] =
{
	nId = 38,
	szMessageType = "CreateCompose",
	szName = "�ϳ�ʥ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ʥ������",1,1,1,0.02,0,50},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"����",{tbProp={6,1,30167,1,0,0},nExpiredTime=20120101,},1} },		
		{"AddOneMaterial",	{"�Ϲϱ�",{tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,},1} },
		{"AddOneMaterial",	{"ʥ��ñ��",ITEM_XMAS_HAT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30168,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "�ϳ�ʥ������"} },
	},
}
tbConfig[39] = 
{
	nId = 39,
	szMessageType = "ItemScript",
	szName = "ʹ��ʥ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30168,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{3, 3, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ֻ���ڸ����м����ִ�ʹ��."} },
		{"PlayerFunLib:CheckTask",	{2916,1500,"ÿ�����ֻ��ʹ��1500��ʥ��������Ʒ","<"} },		
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_Pink",	{nil} },
	},
}
