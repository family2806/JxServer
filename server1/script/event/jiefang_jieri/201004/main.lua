Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")

if (FreedomEvent2010 == nil) then
	FreedomEvent2010 = {}
end

FreedomEvent2010.START_DATE = 20100426
FreedomEvent2010.END_DATE = 20100607
FreedomEvent2010.END_DATE1 = 20100531

FreedomEvent2010.tbBuyItem = 
{
	["ǧ���"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("�����Ҹ���ѿ� \t ���� %s", "ǧ���"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = {{nJxb = 1000000, nCount=1}},
			tbProduct = {szName = "ǧ���",tbProp = {6,1,2294,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["���ϰ�"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("�����Ҹ���ѿ� \t ���� %s", "���ϰ�"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "���ϰ�", tbProp = {6,1,2295,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["ˮͰ"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("�����Ҹ���ѿ� \t ���� %s", "ˮͰ"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "ˮͰ", tbProp = {6,1,2296,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["�����"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("�����Ҹ���ѿ� \t ���� %s", "�����"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "�����", tbProp = {6,1,2297,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["�߼�����"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t ����%s", "�߼�����"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 40000, nCount=1}},
			tbProduct = {szName = "�߼�����", tbProp = {6,1,2302,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["սʿñ"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "սʿñ"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "��ָ��", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "��ƥ", tbProp = {6,1,2301,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "սʿñ", tbProp = {6,1,2304,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["����Ь"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "����Ь"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "��ָ��",tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "�߼�����", tbProp = {6,1,2302,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "����Ь", tbProp = {6,1,2305,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["սʿ��"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "սʿ��"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "��ָ��",tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "�ϵȲ���", tbProp = {6,1,2303,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "սʿ��", tbProp = {6,1,2306,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["��ɽ�� 1"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "��ɽ��"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "������ʯ(5��)", tbProp = {6,1,147,5,0,0}, nCount = 5},
				tbVirtualItemClass:new(tbCrystalSet, 1, "ˮ��"),
				{szName = "��������", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "��ɽ��", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["��ɽ�� 2"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "��ɽ��"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "������ʯ(6��)", tbProp = {6,1,147,6,0,0}, nCount = 3},
				tbVirtualItemClass:new(tbCrystalSet, 1, "ˮ��"),
				{szName = "��������", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "��ɽ��", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["��ɽ�� 3"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "��ɽ��"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "������ʯ (7��) ", tbProp = {6,1,147,7,0,0}, nCount = 2},
				tbVirtualItemClass:new(tbCrystalSet, 1, "ˮ��"),
				{szName = "��������", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "��ɽ��", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["��ɽ�� 4"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("սʿ���\t �һ� %s", "��ɽ��"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "������ʯ(8��) ", tbProp = {6,1,147,8,0,0}, nCount = 1},
				tbVirtualItemClass:new(tbCrystalSet, 1, "ˮ��"),
				{szName = "��������", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "��ɽ��", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["һ��Ǭ����"]=  
	{
		tbFormula = 
		{
			szComposeTitle = format("С��\t�һ� %s", "һ��Ǭ����"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "������ʯ", tbProp = {6,1,2125,-1,-1,0}, nCount = 300},
			},
			tbProduct = 
			{
				szName = "һ��Ǭ����",
				[1]	= {szName = "һ��Ǭ����", tbProp = {6,1,2126,1,0,0}, nExpiredTime = 30*24*60}, --change item expired time to 30days - Modified by DinhHQ - 20110428
				[2] = 
				{
					pFun = function (self, nCount, szLogTilte)
						szAllNews = format("����<color=yellow>%s<color> �ѵõ� <color=green>%d<color> [<color=yellow>%s<color>], �����Ӵ˾�������", GetName(), 1, "һ��Ǭ����");
						LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
					end
				},
			},
		},
		pCompos = nil;
	},
	["��Ӱ���"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("С��\t�һ� %s", "��Ӱ���"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "������ʯ", tbProp = {6,1,2125,-1,-1,0}, nCount = 3},
			},
			tbProduct = {szName = "��Ӱ���", tbProp = {0,11,455,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
	["�������"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("С��\t�һ� %s", "�������"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "������ʯ", tbProp = {6,1,2125,-1,-1,0}, nCount = 5},
			},
			tbProduct = {szName = "�������", tbProp = {0,11,454,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
}

FreedomEvent2010.tbSongjinSoldier =
{
	{szName="���ϰ�", tbProp={6,1,2295,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="ˮͰ", tbProp={6,1,2296,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="�����", tbProp={6,1,2297,1,0,0}, nRate=34, nExpiredTime = 20100531},
}

FreedomEvent2010.tbMonsterDrop =
{
	{
		{szName="�þ߰�", tbProp={6,1,2299,1,0,0}, nRate=1.2, nExpiredTime = 20100531},
	},
}

FreedomEvent2010.tbSoldierToolBag =
{
	{szName="��ָ��",tbProp={6,1,2300,1,0,0}, nRate=70, nExpiredTime = 20100531},
	{szName="��ƥ", tbProp={6,1,2301,1,0,0}, nRate=30, nExpiredTime = 20100531},
}

FreedomEvent2010.tbClothExp =
{
	exp=
	{
		30,
		40,
		60,
		80,
		200,
	},
	rate=
	{
		24,
		67,
		5,
		3,
		1,
	},
}

FreedomEvent2010.tbClothAwardSpecial =
{
	{szName="��ɽ��", tbProp={6,1,2298,1,0,0}, nRate=35.8, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ <color=yellow>%s<color>�õ� <color=yellow>%s<color>",GetName(),"��ɽ��") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ <color=yellow>%s<color> �õ�<color=yellow>%s<color>",GetName(),"��ɽ��")) end end},
	{szName="������(5��)", tbProp={6,1,2293,5,0,0}, nRate=20, nExpiredTime = 20100607},
	{szName="ɮñ����", tbProp={6,1,2203,1,0,0}, nRate=3,},
	{szName="���ʽ���", tbProp={6,1,2204,1,0,0}, nRate=2,},
	{szName="ħɷ����", tbProp={6,1,2205,1,0,0}, nRate=2,},
	{szName="�������", tbProp={6,1,2206,1,0,0}, nRate=3,},
	{szName="�������", tbProp={6,1,2237,1,0,0}, nRate=6,},
	{szName="������", tbProp={6,1,2238,1,0,0}, nRate=4,},
	{szName="�±̺�����", tbProp={6,1,2239,1,0,0}, nRate=3,},
	{szName="��ħ����", tbProp={6,1,2240,1,0,0}, nRate=8,},
	{szName="��������", tbProp={6,1,2241,1,0,0}, nRate=8,},
	{szName="˪������", tbProp={6,1,2242,1,0,0}, nRate=4,},
	{szName="��ڱ���֮��", tbProp={0,197},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> �ѻ�� <color=yellow>%s<color>",GetName(),"��ڱ���֮��") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> �ѻ��<color=yellow>%s<color>",GetName(),"��ڱ���֮��")) end end},
	{szName="����ŵ�֮��", tbProp={0,202},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"����ŵ�֮��") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"����ŵ�֮��")) end end},
	{szName="���ؿ�ʯ", tbProp={6,1,398,1,0,0}, nRate=1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"���ؿ�ʯ") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"���ؿ�ʯ")) end end},

}

FreedomEvent2010.tbClothAwardNormal =
{
	{szName="��������", tbProp={6,1,2308,1,0,0}, nRate=18, nExpiredTime = 20100607},
	{szName="������ʯ", tbProp={6,1,2125,1,0,0}, nRate=20},
	{szName="��ɽ��", tbProp={6,1,2298,1,0,0}, nRate=10, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"��ɽ��") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"��ɽ��")) end end},
	{szName="�ر��ɲ�¶", tbProp={6,1,1181,1,0,0}, nRate=2},
	{szName="���޺�", tbProp={6,1,23,1,0,0}, nRate=5},
	{szName="�����ľ�", tbProp={6,1,12,1,0,0}, nRate=2},
	{szName="������(3��)", tbProp={6,1,2293,3,0,0}, nRate=8, nExpiredTime = 20100607},
	{szName="������(4��)", tbProp={6,1,2293,4,0,0}, nRate=5, nExpiredTime = 20100607},
	{szName="������(5��)", tbProp={6,1,2293,5,0,0}, nRate=1, nExpiredTime = 20100607},
	{szName="ɮñ����", tbProp={6,1,2203,1,0,0}, nRate=0.5,},
	{szName="���ʽ���", tbProp={6,1,2204,1,0,0}, nRate=0.3,},
	{szName="ħɷ����", tbProp={6,1,2205,1,0,0}, nRate=0.3,},
	{szName="�������", tbProp={6,1,2206,1,0,0}, nRate=0.5,},
	{szName="�������", tbProp={6,1,2237,1,0,0}, nRate=1,},
	{szName="������", tbProp={6,1,2238,1,0,0}, nRate=1,},
	{szName="�±̺�����", tbProp={6,1,2239,1,0,0}, nRate=0.6,},
	{szName="��ħ����", tbProp={6,1,2240,1,0,0}, nRate=1.2,},
	{szName="��������", tbProp={6,1,2241,1,0,0}, nRate=1.2,},
	{szName="˪������", tbProp={6,1,2242,1,0,0}, nRate=0.8,},
	{szName="��ս���", tbProp={6,1,2006,1,0,0}, nRate=11.26},
	{szName="��ڱ���֮��", tbProp={0,197},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"��ڱ���֮��") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"��ڱ���֮��")) end end},
	{szName="����ŵ�֮��", tbProp={0,202},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"����ŵ�֮��") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"����ŵ�֮��")) end end},
	{szName="���ؿ�ʯ", tbProp={6,1,398,1,0,0}, nRate=0.3,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"���ؿ�ʯ") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("��ϲ<color=yellow>%s<color> ����� <color=yellow>%s<color>",GetName(),"���ؿ�ʯ")) end end},
	{szName="������ʯ (6��) ", tbProp={6,1,147,6,0,0}, nRate=5},
	{szName="������ʯ (7��) ", tbProp={6,1,147,7,0,0}, nRate=3},
	{szName="������ʯ (8��) ", tbProp={6,1,147,8,0,0}, nRate=2},
}

function FreedomEvent2010:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE or now < self.START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomEvent2010:IsActive1()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE1 or now < self.START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomEvent2010:LingFanSoldierItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "��ף�����!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("����[%s]/#FreedomEvent2010:BuyItem('%s')","�߼���ƥ","�߼���ƥ"));
	end
	tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyCotDlg()","��ɽ��"));
	
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LingFanPlantItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "��ף�����!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("����[%s]/#FreedomEvent2010:BuyItem('%s')","ǧ���","ǧ���"));
		tinsert(tbSay, format("����[%s]/#FreedomEvent2010:BuyItem('%s')","���ϰ�","���ϰ�"));
		tinsert(tbSay, format("����[%s]/#FreedomEvent2010:BuyItem('%s')","ˮͰ","ˮͰ"));
		tinsert(tbSay, format("����[%s]/#FreedomEvent2010:BuyItem('%s')","�����","�����"));
	end
	
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LiGuanEventItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "��ף�����!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyItem('%s')","սʿñ","սʿñ"));
		tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyItem('%s')","����Ь","����Ь"));
		tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyItem('%s')","սʿ��","սʿ��"));
	end
	
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyCotDlg()
	local tbSay = {};
	tbSay[1] = "��4�ֶһ����� <enter>5������ʯ(5��)+1ˮ��+1��������<enter>3������ʯ(6��)+1ˮ��+1��������<enter>2������ʯ(7��)+1ˮ��+1��������<enter>1������ʯ(8��)+1ˮ��+1��������";
	tinsert(tbSay, format("�һ�����1/#FreedomEvent2010:BuyItem('%s')","��ɽ�� 1"));
	tinsert(tbSay, format("�һ�����2/#FreedomEvent2010:BuyItem('%s')","��ɽ�� 2"));
	tinsert(tbSay, format("�һ�����3/#FreedomEvent2010:BuyItem('%s')","��ɽ�� 3"));
	tinsert(tbSay, format("�һ�����4/#FreedomEvent2010:BuyItem('%s')","��ɽ�� 4"));
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LongerEventItemDlg()
	local tbSay = {};
	tbSay[1] = "<#><npc>С��: �������ҿɰ���? ��Щʯͷ��Ư���������뻻���Ҽұ�������ʲô����";
	tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyItem('%s')","һ��Ǭ����","һ��Ǭ����"));
	tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyItem('%s')","��Ӱ���","��Ӱ���"));
	tinsert(tbSay, format("�һ� [%s]/#FreedomEvent2010:BuyItem('%s')","�������","�������"));
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("����[%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end
