Include("\\script\\activitysys\\config\\39\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click yuexialaoren",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"Nguy�t H� l�o nh�n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T� H�ng Thi�n L� Nh�n Duy�n",3} },
	},
}
tbConfig[2] = --һ��ϸ��
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click zhangdenggongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T� H�ng Thi�n L� Nh�n Duy�n",4} },
		{"AddDialogOpt",	{"Ch��ng ��ng Cung N�",13} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "yuelao_yinyuan",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"B�ch Ni�n Tu ��c ��ng Thuy�n ��, Thi�n Ni�n Tu Lai C�ng Ch�m Mi�n, Ta s� d�ng D�y H�ng n�y �� r�ng bu�c nh�n duy�n tr�n th� gian n�y",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ngL� T�nh Nh�n",5} },
		{"AddDialogOpt",	{"Nh�n T� H�ng",6} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "gongnv_yinyuan",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"H�t Gi�ng Hoa H�ng v� ��u H�ng m�t l�n ng��i ch� c� th� nh�n 1 trong hai lo�i",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ngL� T�nh Nh�n",5} },
		{"AddDialogOpt",	{"Nh�n H�t Gi�ng Hoa H�ng",7} },
		{"AddDialogOpt",	{"Nh�n ��u H�ng",9} },
--By: NgaVN - ���Ƶƹ�ŮNPCѡ��Ǭ����į��
		--{"AddDialogOpt",	{"Giao n�p Di Hoa H�a M�ng",12} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "yinyuan introduction",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"�ڻʱ���ڣ���λ120�����ϵĴ���ÿ�ն����Ե�Nguy�t H� l�o nh�n����ȡһ�����ߣ�Ҳ���Ե��Ƶƹ�Ů��Nh�n ��u H�ng�����������ӣ���ȡ���ֺ춹��Ҫ������������ȡ����õ��������Ҫ�������������κ�һ������<enter> 1. 2���������һ����ӣ�2�˺����ϵ���Ե�źͳ�ż��һ�����<enter> 2. ����˫��һ�����<enter>��һ����õ�����ӵ�ʱ��ͬһ�����д���������������Ҫ�����Է���õ�����ӣ���õ��ɳ���������ռ��Լ����ϵ�����õ�壬�����춹������ӣ�ֻ��Ҫ�����Լ������Ӿ��У�����õ������/�춹��Ҫ��ʱ���棬�βݵȣ��������ܻ�ø��ཱ���� <enter> �ڻ�ڼ䣬���������Di Hoa H�a M�ng������������Di Hoa H�a M�ng�����Ƶƹ�Ů���Ƶƹ�Ů������Ǭ������������������ʹ��Ǭ�������������ǹ����������ʹ����ܶ�����ʹ����úཱܶ����",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --һ��ϸ��
{
	nId = 6,
	szMessageType = "nil",
	szName = "get redline from yuelao",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
--By: NgaVN	
		--{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,0,"��������Nh�n T� H�ng��","=="} },
		{"ThisActivity:CheckRedline",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		--{"ThisActivity:AddTaskDaily",	{TSK_GET_REDLINE,1} },
		{"ThisActivity:GiveRedline",	{nil} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "get rose see from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {format("�춹��õ������ÿ��ֻ����ȡ����һ�֣�����ڵ��ղ���ȡ�������ӵ��ڶ�����ȡ�����ֻ�ܵ���3��. <enter> ��ʿ��Nh�n H�t Gi�ng Hoa H�ng����Ҫ��Ӧ�����κ�����<enter> 1. 2�������һ�����<enter> 2. ����","C�a h�ng tinh l�c"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����Nh�n H�t Gi�ng Hoa H�ng",8} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "nil",
	szName = "surely get rose see from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckTeamConfig",	{nil} },
		{"ThisActivity:CheckSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:SubSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3109,1,0,0},nBindState = -2,nExpiredTime=20120301,},1,"EVENT_LOG_TITLE","get rose seed"} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "CreateDialog",
	szName = "get redbean from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {format("�춹��õ������ÿ��ֻ����ȡ����һ�֣�����ڵ��ղ���ȡ�������ӵ��ڶ�����ȡ�����ֻ�ܵ���3��. <enter>%s ��������¶��������¶��������һ����ȡһõ�����ӻ���1�ź춹 <enter>��������û���ҵ��Լ�����Ե�������Nh�n ��u H�ng��ȥ�֣���һ���Ǻ춹�Ľ���û��õ��ķḻŶ��Ҫ���������ȥ���Լ�����Ե�ɣ�����������ȥ��������ȤЩ","C�a h�ng tinh l�c"),0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n nh�n ��u H�ng",10} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "surely get redbean from gongnv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:SubSeedTime",	{TSK_SEEDTIME,TSK_SEEDTIME_EX} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3110,1,0,0},nBindState = -2,nExpiredTime=20120301,},1,EVENT_LOG_TITLE,"get redbean"} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "use xiuyueninglv",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {{tbProp={6,1,3115,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckDateEx",	{nil} },
--By: NgaVN
		{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,2,"H�m nay ng��i �� s� d�ng 2 l�n T� Nguy�t Ng�ng L�, mai h�y s� d�ng ti�p","<"} },		
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSK_SEEDTIME_EX,1} },
		{"ThisActivity:AddTaskDaily",	{TSK_GET_REDLINE,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","�����һ�λ���Nh�n H�t Gi�ng Hoa H�ng���ߺ춹"} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "handin yihuahemeng",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {"C�n Kh�n Ph�ch L�ch ��n",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Di Hoa H�a M�ng",{tbProp={6,1,3112,1,0,0},},1} },
	},
	tbActition = 
	{
--By: NgaVN - ���Ƶƹ�ŮNPCѡ��Ǭ����į��
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,3116,1,0,0},nExpiredTime=20120301,},1,EVENT_LOG_TITLE,"handin yihuahemeng get pilidan"} },
	},
}
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
	szMessageType = "nil",
	szName = "Ch��ng ��ng Cung N�",
	nStartDate = 201202090000,
	nEndDate  = 201203010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDLINE_NUM,0,"��i Hi�p �� nh�n r�i, Hay mai nh�n n�a","=="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_GET_REDLINE,2,"H�m nay ch�a s� d�ng 2 T� Nguy�t Ng�ng L�","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSK_REDLINE_NUM,1} },
		{"PlayerFunLib:AddExp",	{60000000,1,EVENT_LOG_TITLE,"Ch��ng ��ng Cung N�"} },
	},
}
