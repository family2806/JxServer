Include("\\script\\activitysys\\config\\19\\variables.lua")
tbConfig = {}
tbConfig[1] = --һ��ϸ��
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click Nguy�t L�o",
	nStartDate = nil,
	nEndDate  = nil,
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
	szName = "B�m v�o ch��ng ��ng cung n�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch��ng ��ng Cung N�"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T� H�ng Thi�n L� Nh�n Duy�n",4} },
	},
}
tbConfig[3] = --һ��ϸ��
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "���ϵ�T� H�ng Thi�n L� Nh�n Duy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B�ch Ni�n Tu ��c ��ng Thuy�n ��, Thi�n Ni�n Tu Lai C�ng Ch�m Mi�n, Ta s� d�ng D�y H�ng n�y �� r�ng bu�c nh�n duy�n tr�n th� gian n�y"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a Ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Gi�i thi�u ho�t ��ng'T� H�ng Thi�n L� Nh�n Duy�n'",5} },
		{"AddDialogOpt",	{"Nh�n 'D�y H�ng'",6} },
	},
}
tbConfig[4] = --һ��ϸ��
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Ch��ng ��ng Cung N���T� H�ng Thi�n L� Nh�n Duy�n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H�t Gi�ng C�y Hoa H�ng v� ��u T��ng T� ng��i ch� ��oc nh�n m�t trong 2 lo�i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a Ng��i kh�ng ��, kh�ng th� tham gia ho�t ��ng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"����'T� H�ng Thi�n L� Nh�n Duy�n'",5} },
		{"AddDialogOpt",	{"Nh�n H�t Gi�ng Hoa H�ng",7} },
		{"AddDialogOpt",	{"Nh�n ��u T��ng T�",8} },
	},
}
tbConfig[5] = --һ��ϸ��
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "����T� H�ng Thi�n L� Nh�n Duy�n�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"�� 0h/13/02/2011 �� 24h/23/02/2011, ������һ�����ߣ���ÿ�������϶���һ����Ե�ţ�����������ߺ󣬾Ϳ��Ե�Ch��ng ��ng Cung N�����Nh�n ��u T��ng T�������õ�����ӣ�ÿ����ʿ�����λ���Nh�n H�t Gi�ng Hoa H�ng������˼����ÿ�λ��������ѡ����ȡһ��õ�����ӻ�����˼��������ڵ���Nh�n H�t Gi�ng Hoa H�ng������˼���Ļ���δ���꣬�����ۻ���ȡ���ᵽ��һ�ռ�����ȡ��ÿλ��ʿNh�n H�t Gi�ng Hoa H�ng������˼���Ļ������ֻ���ۻ�6�Σ�����6�ξͲ��ܼ����ۻ��ˣ�����ʯ�̵�����������Ʒ���԰�������һ��Nh�n H�t Gi�ng Hoa H�ng������˼���Ļ�����ȡ������˼�������ƣ���ȡ����õ������Ҫ��������������һ������\n1.�������������ӣ����˺����ϵ���Ե��Ҫ�ɶԣ������ţ���\n2.�����������\��ʿ��������������һ���ߴ�������߰˴����ִ�����õ�����ӣ���������һ������չ˱������µ�õ����ѿ����õ����ѿ����õ�����������Ĺ����У���ʿ��Ҫ��ʱ���н�ˮ��ʩ�ʣ����棬�βݣ����潽ˮ���β�ʩ��Խ��ʱ���٣�������ڱ��չ˵�õ�����ϵ�õ����о�Խ�࣬��õ��������ɿ���õ�廨��õ����������Բ�ժ���ֵ�õ�����ϵ�õ����У�����˼������Ҫ��ӣ�����˼��Ҳ��Ҫ��ˮ�����棬�βݣ�ʩ�ʣ����ԣ���Щ��������Խ��ʱ������յ��Ľ�Ʒ��Խ�ḻ����˼���ɳ�����ʿ���Բ�ժ��Ӧ��������˼��С�"},
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
	szName = "Nh�n D�y H�ng � ch� Nguy�t L�o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{GetHongXian,0,"H�m nay ng��i �� nh�n D�y H�ng r�i","=="} },
		{"ThisActivity:CheckHongXian",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��, kh�ng th� nh�n ��o c�"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHongXian",	{nil} },
		{"ThisActivity:SetValentineRandNumber",	{ValentineNumber} },
		{"ThisActivity:AddTaskDaily",	{GetHongXian,1} },
	},
}
tbConfig[7] = --һ��ϸ��
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "��Ch��ng ��ng Cung N���Nh�n H�t Gi�ng Hoa H�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��u T��ng T� v� H�t Gi�ng C�y Hoa H�ng ti�u hi�p ng��i ch� ���c nh�n 1 trong hai lo�i, ti�u hi�p n�u ng��i mu�n nh�n H�t Gi�ng C�y Hoa H�ng, c�n ph�i th�a m�n 1 trong 2 �i�u ki�n d��i ��y<enter>1. Hai ng��i ch�i kh�c gi�i t�nh t� ��i v�i nhau, S� Nh�n Duy�n c�a 2 ng��i ch�i c�ng t� ��i ph�i l� s� ch�n ( s� c�p ch�n )<enter>2. Phu th� 2 ng��i t� ��i v�i nhau"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n nh�n H�t Gi�ng Hoa H�ng",9} },
		{"AddDialogOpt",	{"�� ta suy ngh� k� l�i xem",4} },
	},
}
tbConfig[8] = --һ��ϸ��
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "��Ch��ng ��ng Cung N���Nh�n ��u T��ng T�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"��u T��ng T� v� H�t Gi�ng C�y Hoa H�ng ti�u hi�p ng��i ch� c� th� nh�n 1 trong 2 lo�i n�y, ti�u hi�p ng��i ch�a t�m ���c nh�n duy�n c�a m�nh �, ng��i c� th� nh�n 1 ��u T��ng T� � ch� c�a ta r�i �i tr�ng, ch� c� �i�u ph�n th��ng tr�ng ��u T��ng T� kh�ng phong ph� b�ng tr�ng C�y Hoa H�ng, ti�u hi�p hay l� ng��i nhanh ch�ng �i t�m nh�n duy�n c�a m�nh �i."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta mu�n nh�n ��u T��ng T�",10} },
		{"AddDialogOpt",	{"�� ta suy ngh� k� l�i xem",4} },
	},
}
tbConfig[9] = --һ��ϸ��
{
	nId = 9,
	szMessageType = "nil",
	szName = "Nh�n H�t Gi�ng Hoa H�ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckGetMeiGuiHuaZiCondition",	{nil} },
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"S� l�n nh�n �� d�ng h�t",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��, kh�ng th� nh�n ��o c�"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2697,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"L� T�nh Nh�n n�m 2011, nh�n ���c H�t Gi�ng Hoa H�ng"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[10] = --һ��ϸ��
{
	nId = 10,
	szMessageType = "nil",
	szName = "Nh�n ��u T��ng T�",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"S� l�n nh�n �� d�ng h�t",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H�nh trang kh�ng ��, kh�ng th� nh�n ��o c�"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2698,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"L� T�nh Nh�n n�m 2011, nh�n ���c ��u T��ng T�"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[11] = --һ��ϸ��
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "S� d�ng Qu�nh T��ng Ng�c Di�p",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2703,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckQJYYTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"��ng c�p c�a ng��i ch�a ��",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{QJYY_ExGetSeedTime,1} },
	},
}
tbConfig[12] = --һ��ϸ��
{
	nId = 12,
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
tbConfig[13] = --һ��ϸ��
{
	nId = 13,
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
tbConfig[14] = --һ��ϸ��
{
	nId = 14,
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
tbConfig[15] = --һ��ϸ��
{
	nId = 15,
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
tbConfig[16] = --һ��ϸ��
{
	nId = 16,
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
