Include("\\script\\activitysys\\config\\1003\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "��nh qu�i r�t nguy�n li�u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,30131,1,0,0},nExpiredTime=nItemExpiredTime,},1,"5"} },
	},
}
tbConfig[3] = --TongKim1000��
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 1000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"EventVuLanBaoHieu\tTongKim1000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim1000", "20 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[4] = --TongKim3000��
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "T�ng kim cao c�p 3000 �i�m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},40,"EventVuLanBaoHieu\tTongKim3000"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TongKim3000", "40 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},15,"������Т�\tV��t qua �i 17"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V��t qua �i 17", "15 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V��t qua �i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},25,"������Т�\tV��t qua �i 28"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V��t qua �i 28", "25 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[7] = --ˮ��ͷ��
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Gi�t ch�t 1 th�y t�c ��u l�nh",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},10,"������Т�\tGi�t ch�t 1 th�y t�c ��u l�nh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Gi�t ch�t 1 th�y t�c ��u l�nh", "10 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[8] = --ˮ����ͷ��
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t thu� t�c ��i ��u l�nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},20,"������Т�\tTi�u di�t thu� t�c ��i ��u l�nh"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Ti�u di�t thu� t�c ��i ��u l�nh", "20 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[9] = --�׵ۮ�
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V��t qua �i Vi�m �� th� 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},30,"������Т�\tV��t qua �i Vi�m �� th� 10"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "V��t qua �i Vi�m �� th� 10", "30 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[10] = --����boss
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Ti�u di�t boss th� gi�i",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},50,"������Т�\tTi�u di�t boss th� gi�i"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "Ti�u di�t boss th� gi�i", "50 N� Hoa H�ng ��", 1}},
	},
}
tbConfig[11] = --ɱ��boss
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� s�t th� c�p 90",
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
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30132,1,0,0},nExpiredTime=nItemExpiredTime,},5,"EventVuLanBaoHieu\tTieuDietBossS�tTh�"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "TieuDietBossSatThu", "5 N� Hoa H�ng ��", 1}},
	},
}
----add �Ի�npc
tbConfig[12] = --Ch��ng ��ng Cung N��Ի�
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "B�m v�o Ch��ng ��ng Cung N�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n ��i C�u Ti�n Ng� Y�n",13} },		
	},
}
----�ϳ�ԭ��
tbConfig[13] = --��i C�u Ti�n Ng� Y�n
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "��i C�u Ti�n Ng� Y�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C�u Ti�n Ng� Y�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"N� Hoa H�ng ��",{tbProp={6,1,30132,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRoseBud", {nil}},		
	},
}
tbConfig[14] = --�Ի�M�c Ki�u Li�n
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "B�m v�o M�c Ki�u Li�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M�c Ki�u Li�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H�p th�nh Th�y T�u H� Ti�n",15} },
		{"AddDialogOpt",	{"��N� Hoa H�ng ��",16} },
		{"AddDialogOpt",	{"T�ng C�u Ti�n Ng� Y�n",18} },
	},
}
tbConfig[15] = --��i Th�y T�u H� Ti�n
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "��i Th�y T�u H� Ti�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Th�y T�u H� Ti�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"N� Hoa H�ng ��",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},5} },
		{"AddOneMaterial",	{"C�u Ti�n Ng� Y�n",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"H�i V� B�ng Lai",{tbProp={6,1,30129,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30130,1,0,0},nExpiredTime=nItemExpiredTime,},1,"������Т�\\tH�p th�nh Th�y T�u H� Ti�n"} },
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "H�p th�nh Th�y T�u H� Ti�n", "1 Th�y T�u H� Ti�n", 1}},
	},
}
tbConfig[16] = --��õ��
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "��N� Hoa H�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��N� Hoa H�ng ��",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"AddOneMaterial",	{"N� Hoa H�ng ��",{tbProp={6,1,30131,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },
		{"ThisActivity:CheckGiveRedRoseLimit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedRose", {nil}},
	},
}
tbConfig[17] = --S� d�ng Th�y T�u H� Ti�n
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "S� d�ng Th�y T�u H� Ti�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30130,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, kh�ng th� s� d�ng v�t ph�m",">="} },
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:TTHT_Limit", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:Use_TTHT", {nil}},		
	},
}
tbConfig[18] = --T�ng C�u Ti�n Ng� Y�n
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "T�ng C�u Ti�n Ng� Y�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>T�ng C�u Ti�n Ng� Y�n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i kh�ng ��, l�n sau h�y ��n nh�!",">="} },
		{"ThisActivity:GiveCuuTienLimit", {nil}},
		{"AddOneMaterial",	{"C�u Ti�n Ng� Y�n",{tbProp={6,1,30128,-1,-1,-1},nExpiredTime=nItemExpiredTime,},1} },		
	},
	tbActition = 
	{
		{"ThisActivity:GiveCuuTien", {nil}},
	},
}