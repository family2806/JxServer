Include("\\script\\activitysys\\config\\26\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click NPC����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"����"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����Բ�",2} },
		{"AddDialogOpt",	{"���붷��",3} },
		{"SetDialogTitle",	{"ף������!"} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "nil",
	szName = "����Բ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"ֻ��150����150�����ϵ���ʿ�����Ѿ���������ʿ���ܲμӸû.",">="} },
		{"ThisActivity:CheckTask",	{TSK_TotalEatExp,nTotalEatUpExp,"�����Բ˻�õľ����Ѵ������ˣ������ٶ����","<"} },
		{"ThisActivity:CheckTaskA",	{TSK_EatExp, TSK_EatExpDate, nEatUpExp,"�Բ�����������Ե�̫���ˣ���������Ŷ",nNumber} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveEatAward",	{TSK_EatExp, TSK_EatExpDate, TSK_TotalEatExp, nNumber} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "���붷��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"���ƣ��������ǻۺ�����"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"ֻ��150����150�����ϵ���ʿ�����Ѿ���������ʿ���ܲμӸû.",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"���ܶ��ƹ���",4} },
		{"AddDialogOpt",	{"���뿪ʼ����",5} },
		{"AddDialogOpt",	{"�����鶷�ƽ��",12} },
		{"AddDialogOpt",	{"������ȡ���ƽ���",23} },
		{"AddDialogOpt",	{"�����ٿ��ǿ���",0} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "���ܶ��ƹ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" ��������ÿ����Բμ�3�����ƣ�ÿ�������ܹ���12�֣����������ʤ1���ɹ����ƣ�����Ҫ����12�ֶ���������ÿ�ֶ��ƣ���������ѡ���С���ƣ��б��ƣ��󱭾ƣ��Ȳ�ͬ�ľƽ�����Ӳ�ͬ����;�����������Ҫȷ������С��100��ͬʱ�������Լ��ľ���������㲻���أ�����ﵽ100����100���ϣ�����ͺ����ˣ��˴ζ����������ˡ�����������12�־ƣ�������ȻС��100���Ǵ˴ζ�����ͳɹ��ˣ��ҽ��ñ������еĳɹ����ƻ�õľ����������������У�����ǰʮ�Ľ���÷ḻ�������ڶ��ƹ����У�С�Ʊ���3-6�����⣬3���������б��Ƽ�2-12�����⣬7���������󱭾Ƽ�3-18�����⣬11��������."},
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
	szMessageType = "nil",
	szName = "���뿪ʼ����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:BeginDrink",	{nil} },
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "��һС����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"small",5} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "nil",
	szName = "��һ�б���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"middle",5} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "��һ�󱭾�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"big",5} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Lose",	{TSK_DrinkTimes,TSK_DrinkRound,TSK_ZuiYi,TSK_AnWei,TSK_JiuLiang} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "ServerStart",
	szName = "���򿪷������ͼ�������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"����", 1658, tbDeskPos} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ServerStart",
	szName = "���򿪷������ͼ�����Ա��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"��԰��", 1659, tbYuanWaiPos} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "��鶷�ƽ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��鶷�ƽ��",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����ҽ����õľ���.",13} },
		{"AddDialogOpt",	{"������վ���ʮ������",15} },
		{"AddDialogOpt",	{"��������յľ�������.",16} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "����ҽ����õľ���.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurJiuLiang",	{nil} },
	},
}
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
	szMessageType = "nil",
	szName = "���Ŀǰ����ʮ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurTopTen",	{nil} },
	},
}
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
	szMessageType = "nil",
	szName = "������վ���ʮ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYTopTen",	{nil} },
	},
}
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
	szMessageType = "nil",
	szName = "��������յľ�������.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYPlayerPaiMing",	{nil} },
	},
}
tbConfig[17] = --һ��ϸ��
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "�����Ա��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��Ա��"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>��λ���ֺ��ܣ��������Ѿ��ں���ϯ�ˣ�����Ҳ�쵽�ˣ��������Ѱ���ɽ�亣ζ�д���λ�����λ����ã����ÿ������Ա��Ⱥ�Ŷ!"} },
		{"AddDialogOpt",	{"���ܴ���Ⱥ���",18} },
		{"AddDialogOpt",	{"����",19} },
		{"AddDialogOpt",	{"��ȡ�����",20} },
	},
}
tbConfig[18] = --һ��ϸ��
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "���ܴ���Ⱥ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>��0h/23/01/2011��24h/20/02/2011, ���������������⣬���Ѿ��ں�ɽ�亣ζ�ˣ�Ҫ�Ժú���Ŷ����02��09�յ�02��11�գ�Ϊ�˸���Զ������Ķ����󸣣����������Ե�������ȡһ����������԰�����ⲻ��С�����ˣ����Ѿ�Ͷ����300.000.000���飬������Ҫ��������ȡ���Ŷ.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[19] = --һ��ϸ��
{
	nId = 19,
	szMessageType = "nil",
	szName = "��ȡ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_LiBao,1,"�������Ѿ���������ȡ����ˣ�ÿ��ֻ����������ȡһ��Ŷ!","<"} },
		{"lib:CheckDay",	{nGetLiBaoStartDate, nGetLiBaoEndDate, "��2��10�գ��ҵĶ���Ҫ��·Ѱ���µ�������Ϊ�˸����󸣣���2��9�յ�11�գ��������Ե�������ȡһ����������԰�����ⲻ��С�����ˣ����Ѿ�Ͷ����300.000.000���飬������Ҫ��������ȡ���Ŷ."} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"װ�������λ��������Ҫһ��1*1װ����λ"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2694,1,0,0},nBindState = -2,nExpiredTime=20110221,},1,"2011�����Ⱥ��,��԰����"} },
		{"ThisActivity:AddTask",	{TSK_LiBao,1} },
	},
}
tbConfig[20] = --һ��ϸ��
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "��ȡ�����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�����",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"����",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2695,1,0,0},nExpiredTime=20110221,},1,"2011����Ⱥ������ý����"} },
	},
}
tbConfig[21] = --һ��ϸ��
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "ʹ�ý����",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2695,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckGetDrunk",	{1020,"����Ͳ���Ҫ�ý����"} },
	},
	tbActition = 
	{
		{"ThisActivity:JieJiu",	{1020} },
	},
}
tbConfig[22] = --һ��ϸ��
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "ʹ����Ա��ĺ��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2694,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_UseLiBao,0,"","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{nLiBaoExp,1,"2011����Ⱥ����ʹ����Ա������þ���"} },
		{"ThisActivity:SetTask",	{TSK_UseLiBao,1} },
	},
}
tbConfig[23] = --һ��ϸ��
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "��ȡ���ƽ���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��ȡ���ƽ���",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"��ȡ�������н���",24} },
		{"AddDialogOpt",	{"��ȡ���ƽ����ɹ�",29} },
		{"AddDialogOpt",	{"��ȡ��ο��",30} },
	},
}
tbConfig[24] = --һ��ϸ��
{
	nId = 24,
	szMessageType = "nil",
	szName = "��ȡ�������н���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetPaiMingAward",	{nil} },
	},
}
tbConfig[25] = --һ��ϸ��
{
	nId = 25,
	szMessageType = "nil",
	szName = "��ȡ���е�1���ƽ���",
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
tbConfig[26] = --һ��ϸ��
{
	nId = 26,
	szMessageType = "nil",
	szName = "��ȡ���е�2���ƽ���",
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
tbConfig[27] = --һ��ϸ��
{
	nId = 27,
	szMessageType = "nil",
	szName = "��ȡ���е�3���ƽ���",
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
tbConfig[28] = --һ��ϸ��
{
	nId = 28,
	szMessageType = "nil",
	szName = "��ȡ���е�4-10���ƽ���",
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
tbConfig[29] = --һ��ϸ��
{
	nId = 29,
	szMessageType = "nil",
	szName = "��ȡ���ƽ����ɹ�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_WinDrink,1,"����û�гɹ����ƽ���������ȡ","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nWinDrinkExp, "�����μӶ��ƻ�õľ����Ѵ����ޣ����ܼ�����ȡ�붷����صĽ�����", "<", nNumber,"2011�����Ⱥ������ȡ���ƽ����ɹ�."} },
		{"ThisActivity:SetTask",	{TSK_WinDrink,0} },
	},
}
tbConfig[30] = --һ��ϸ��
{
	nId = 30,
	szMessageType = "nil",
	szName = "��ȡ��ο��",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_AnWei,1,"����û�а�ο��Ҫ��","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nAnWeiExp, "�����μӶ��ƻ�õľ����Ѵ����ޣ����ܼ�����ȡ�붷����صĽ�����", "<", nNumber,"2011�����Ⱥ������ȡ��ο��"} },
		{"ThisActivity:SetTask",	{TSK_AnWei,0} },
	},
}
tbConfig[31] = --һ��ϸ��
{
	nId = 31,
	szMessageType = "ServerStart",
	szName = "���򿪷�����ʱ�ͼ��ص���",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddMulNpc",	{tbNpcs,"����",1592} },
	},
}
tbConfig[32] = --һ��ϸ��
{
	nId = 32,
	szMessageType = "ServerStart",
	szName = "���򿪷�����ʱ�ͼ��ش�ͷ������",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"�ع�ͷ", 1660, "\\settings\\maps\\dayanqunxia\\datouwawa.txt",176} },
	},
}
tbConfig[33] = --һ��ϸ��
{
	nId = 33,
	szMessageType = "ServerStart",
	szName = "�򿪷������ͼ�������ʦ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"��ʦ", 1661, "\\settings\\maps\\dayanqunxia\\wunanshi.txt",176} },
	},
}
tbConfig[34] = --һ��ϸ��
{
	nId = 34,
	szMessageType = "ServerStart",
	szName = "�򿪷����������䱱ʦ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"��ʦ", 1662, "\\settings\\maps\\dayanqunxia\\wubeishi.txt",176} },
	},
}
