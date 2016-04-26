Include("\\script\\activitysys\\config\\30\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν���ִ���1000��С��3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveSongjinAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Խ�Ͻ�ʦ�ڻ", "�ν�1000���"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "�ν�1000", "��", 1}},
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "�߼��ν���ִ���3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveSongjinAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "TongKim3000NhanCayBut"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TongKim3000", "��", 1}},
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "�߼����ع�17��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{17} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Խ�Ͻ�ʦ�ڻ", "����17��ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAi17", "��", 1}},
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "�߼����ع�28��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{28} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "����28��ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "����28", "��", 1}},
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "FinishKillerBoss",
	szName = "�߼�ɱ��boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveShashouAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},2,"Խ�Ͻ�ʦ�ڻ", "����ɱ��BossSat��ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossSatThu", "��", 1}},
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "�׵۴���10��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveYDBZAward",	{10} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},15,"Խ�Ͻ�ʦ�ڻ", "�׵۴���10�ػ�ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "�׵۴���10��", "��", 1}},
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Ұ���ֵ����ֽ",
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
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,3039,1,0,0},nExpiredTime=20111201,},1,"5"} },		
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "ServerStart",
	szName = "����������ʱ����npc",
	nStartDate = 201111010000,
	nEndDate  = 201112010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "�����ˮ��ͷ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveFenglinduAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},5,"Խ�Ͻ�ʦ��", "����ˮ��ͷ���ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "����ˮ��ͷ��", "��", 1}},
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "�����ˮ����ͷ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveFenglinduAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "����ˮ����ͷ���ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "����ˮ����ͷ��", "��", 1}},
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "�ƽ�boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveGoldBossAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "��������Boss��ñ�"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossTheGioi", "��", 1}},
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "�������ʦ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����ʦ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"�Ͻ���",13} },
		{"AddDialogOpt",	{"��ȡ��ʦ�ڽ���",14} },
		--{"AddDialogOpt",	{"��ȡ����ͼ��",15} },
		{"SetDialogTitle",	{"ÿ���ʦ���ֵ��ˣ���λ��������ͨ���Ͻ�<color=yellow> �鼮 <color> ���ҽ���ý���������Ͻ������ﵽ700�Σ���Ȼ�����յ�һЩ����ͼ�ס�ͬʱ����2011��11��20�գ����Ե���������ȡԽ�Ͻ�ʦ����Ʒ��ÿ��ֻ����ȡһ�Σ���Ҫ��������Ŷ��"} },
	},
}
--tbConfig[13] = --һ��ϸ��
--{
--	nId = 13,
--	szMessageType = "nil",
--	szName = "�Ͻ��鼮",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {nil},
--	tbCondition = 
--	{
--		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
--	},
--	tbActition = 
--	{
--		{"ThisActivity:HandInBook",	{nil} },
--	},
--}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "ʹ���鼮",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3042,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"ThisActivity:CheckBookLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBook",	{nil} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "��ȡ��ʦ�ڽ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_TeacherAward,0,"���Ѿ���ȡ�ý����ˣ�����������","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:TeacherAward",	{nil} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "��ȡ����ͼ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_JinwuAward,0,"������ȡ�ý���������������","=="} },
		{"ThisActivity:CheckTask",	{TSK_HandInBook,700,"�������Ͻ����鼮��������700�Σ������콱��.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:JinwuAward",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "�����ͯ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ͯ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"�Ͻ���ֽ",17} },
		{"AddDialogOpt",	{"�ϳ��鼮",18} },
		{"SetDialogTitle",	{"����! ��<color=yellow> ��ֽ<color> ��, ���Ұɣ��ҽ�������Ӧ�Ľ���������˵һ�����ܣ�ʹ��<color=yellow> 5 �Ű�ֽ��һ֧�ʣ�һƿīˮ <color> juice���Ժϳ�һ�� <color=yellow> �� <color>, ���鼮�Ͻ���<color=yellow> ���ԱߵĴ���ʦ<color> ���յ�������������С��˵�ɣ���ֽ���Ե� <color=yellow> ����ɽ�ϣ�����ɽ�������Ƕ���ɳĮɽ��3��Ī�߿ߣ����ն� <color> ��ֵ��䣬���������ͨ���μӸ������ܻ��ã�īˮ������ <color=yellow> ������ҵ�<color>, ��ҪŪ����Ŷ"} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "nil",
	szName = "����ֽ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandInPaper",	{nil} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "�ϳ��鼮",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�鼮",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"��ֽ",{tbProp={6,1,3039,1,0,0},},5} },
		{"AddOneMaterial",	{"��",{tbProp={6,1,3040,1,0,0},},1} },
		{"AddOneMaterial",	{"īˮ",{tbProp={6,1,3041,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3042,1,0,0},nExpiredTime=20111201,},1,"Event_NhaGiaoVN","GhepCuonSach"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "ʹ�û�֮���n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3043,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedZhienhua,nMaxZhienhua,"�����ź���Ŀǰʹ������������������ʹ����","<"} },
		{"ThisActivity:CheckTask",	{TSK_HandInPaper,nMaxPaperCount,format("Ŀǰ�Ͻ���ֽ����δ�ﵽ%s, ����ʹ��",nMaxPaperCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhienhua",	{nil} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "ʹ�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3044,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedTianyuhun,nMaxTianyuhun,"�����ź���Ŀǰʹ������������������ʹ����","<"} },
		--{"ThisActivity:CheckTask",	{TSK_HandInBook,nMaxBookCount,format("Ŀǰ�Ͻ��鼮����δ�ﵽ%s, ����ʹ��",nMaxBookCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseTianyuhun",	{nil} },
	},
}
