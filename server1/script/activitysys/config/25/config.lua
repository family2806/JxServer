Include("\\script\\activitysys\\config\\25\\variables.lua")
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
	szMessageType = "ClickNpc",
	szName = "Click v�o Nguy�n ��n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguy�n ��n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng ��p tr�ng vui v�",3} },
		{"AddDialogOpt",	{"��Nguy�n ��n���ҵ�",21} },
		{"AddDialogOpt",	{"��Nguy�n ��n�����ҵ�",22} },
		{"AddDialogOpt",	{"��Nguy�n ��nͭ���ҵ�g",23} },
		{"AddDialogOpt",	{"ʹ��Nguy�n ��n�����ͽ𴸻�ý��������ﵽ200��",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ �au ]] or [[ ��i hi�p xin ��ng �]]/>"} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Gi�i thi�u ho�t ��ng ��p tr�ng vui v�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��2010��12��21��0h��2011��1��10��24h�� ������������Nguy�n ��nͭ����Nguy�n ��n������Nguy�n ��n�𴸵�'Nguy�n ��n'���ҵ����㽫������⾪ϲ�������������Nguy�n ��n������Nguy�n ��nͭ���ҵ���������Ҫ����Ҫ�Ĵ��⣬����Ҫ����������������<enter>1����Ҫ��3����ӣ�3�������Ҫ�����꾩�����������ٰ�L� Quan����ȡ���������<enter>2��3�������Ҫ����ɫ��ͬ�����β�ͬ���������<enter> ��Nguy�n ��n������Ҫ�κ����������У�Nguy�n ��nͭ��������L� Quan����ȡ��Nguy�n ��n���������ڲμ�ϵͳ��Ϸ����ȡ��Nguy�n ��n�𴸿������������ȡ��"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "nil",
	szName = "��Nguy�n ��n���ҵ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"�˴λʹ�õ�Nguy�n ��n�����ͽ����Ϊ200��","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("Kh�ng c� <color=yellow>%s<color> kh�ng th� ��p tr�ng","Nguy�n ��n��")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Nguy�n ��n��")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Nguy�n ��n��"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "nil",
	szName = "��Nguy�n ��n�����ҵ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"�˴λʹ�õ�Nguy�n ��n�����ͽ����Ϊ200��","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("Kh�ng c� <color=yellow>%s<color> kh�ng th� ��p tr�ng","Nguy�n ��n����")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Nguy�n ��n����")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Nguy�n ��n����")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "��Nguy�n ��nͭ���ҵ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"Nguy�n ��nͭ��ÿ�����ֻ����5��","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("Kh�ng c� <color=yellow>%s<color> kh�ng th� ��p tr�ng","Nguy�n ��nͭ��")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Nguy�n ��nͭ��")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("Ph�n th��ng s� d�ng %s ��p tr�ng","Nguy�n ��nͭ��")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "ʹ��Nguy�n ��n�����ͽ𴸻�ȡ�����Ѵ�200��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"����û��ʹ�ù�200��Nguy�n ��n�����ͽ𴸣���������Ŷ",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"B�n ��  l�nh th��ng r�i","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"ʹ��Nguy�n ��n�����ͽ𴸻�ȡ�����Ѵ�200�� "} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("Ph�n th��ng v��t �i ��t ��n %d �i",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("Ph�n th��ng v��t �i ��t ��n %d �i",17)} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("Ph�n th��ng �i�m t�ch l�y T�ng Kim cao c�p ��t ��n %d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("Ph�n th��ng �i�m t�ch l�y T�ng Kim cao c�p ��t ��n %d",3000)} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "B�m v�o th� luy�n ���ng tr��ng l�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr��ng l�o Th� Luy�n ���ng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng ��p Tr�ng vui v�",25} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Phong L�ng ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},10,"100"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "Nhi�m v� S�t th� ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s ph�n th��ng","Nhi�m v� S�t th� ")} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "Nh�t qu� huy ho�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s ph�n th��ng","Nh�t qu� huy ho�ng")} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "Boss Th� Gi�i r�i ra",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},15,"100"} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "��ȡNguy�n ��n����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("H�m nay ng��i �� nh�n � ch� c�a ta %s r�i","Nguy�n ��n����"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"Nh�n � Th� Luy�n ���ng"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("Ph�n th��ng v��t �i ��t ��n %d �i",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("Ph�n th��ng v��t �i ��t ��n %d �i",28)} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "B�m v�o L� Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L� Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho�t ��ng ��p Tr�ng vui v�",24} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "nil",
	szName = "Nh�n M�t N� D� Dung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("H�m nay ng��i �� nh�n � ch� c�a ta %s r�i","Nguy�n ��n�������"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"��L� Quan����ȡ"} },
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "nil",
	szName = "��ȡNguy�n ��nͭ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("H�m nay ng��i �� nh�n � ch� c�a ta %s r�i","Nguy�n ��nͭ��"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"��L� Quan����ȡ"} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "Kh�i ��ng sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddYuanDanDialogNpc",	{nil} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "Ph�i ch�ng s� d�ng Ch�y V�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng��i x�c ��nh mu�n s� d�ng <color=yellow>%s<color> kh�ng?","Nguy�n ��n��")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X�c nh�n",4} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "Ph�i ch�ng s� d�ng Ch�y B�c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("��X�c nh�nʹ��<color=yellow>%s<color> ��","Nguy�n ��n����")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X�c nh�n",5} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Ph�i ch�ng s� d�ng Ch�y ��ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("��X�c nh�n��ʹ�� <color=yellow>%s<color> ��?","Nguy�n ��nͭ��")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X�c nh�n",6} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "L� Quan�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ӭ�μ�Ho�t ��ng ��p Tr�ng vui v�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nh�n M�t N� D� Dung",18} },
		{"AddDialogOpt",	{"��ȡNguy�n ��nͭ��",19} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "Tr��ng l�o Th� Luy�n ���ng�Ի�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��ӭ�μ�Ho�t ��ng ��p Tr�ng vui v�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ȡNguy�n ��n����",15} },
	},
}
