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
	["千岁核"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("培育幸福嫩芽活动 \t 购买 %s", "千岁核"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = {{nJxb = 1000000, nCount=1}},
			tbProduct = {szName = "千岁核",tbProp = {6,1,2294,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["肥料包"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("培育幸福嫩芽活动 \t 购买 %s", "肥料包"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "肥料包", tbProp = {6,1,2295,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["水桶"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("培育幸福嫩芽活动 \t 购买 %s", "水桶"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "水桶", tbProp = {6,1,2296,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["除虫剂"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("培育幸福嫩芽活动 \t 购买 %s", "除虫剂"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "除虫剂", tbProp = {6,1,2297,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["高级布料"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 购买%s", "高级布料"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 40000, nCount=1}},
			tbProduct = {szName = "高级布料", tbProp = {6,1,2302,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["战士帽"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "战士帽"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "金指盒", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "布匹", tbProp = {6,1,2301,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "战士帽", tbProp = {6,1,2304,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["部队鞋"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "部队鞋"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "金指盒",tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "高级布料", tbProp = {6,1,2302,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "部队鞋", tbProp = {6,1,2305,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["战士服"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "战士服"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "金指盒",tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "上等布料", tbProp = {6,1,2303,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "战士服", tbProp = {6,1,2306,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["常山网 1"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "常山网"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "玄晶矿石(5级)", tbProp = {6,1,147,5,0,0}, nCount = 5},
				tbVirtualItemClass:new(tbCrystalSet, 1, "水晶"),
				{szName = "三公斤蛤蟆", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "常山网", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["常山网 2"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "常山网"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "玄晶矿石(6级)", tbProp = {6,1,147,6,0,0}, nCount = 3},
				tbVirtualItemClass:new(tbCrystalSet, 1, "水晶"),
				{szName = "三公斤蛤蟆", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "常山网", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["常山网 3"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "常山网"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "玄晶矿石 (7级) ", tbProp = {6,1,147,7,0,0}, nCount = 2},
				tbVirtualItemClass:new(tbCrystalSet, 1, "水晶"),
				{szName = "三公斤蛤蟆", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "常山网", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["常山网 4"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("战士服活动\t 兑换 %s", "常山网"),

			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "玄晶矿石(8级) ", tbProp = {6,1,147,8,0,0}, nCount = 1},
				tbVirtualItemClass:new(tbCrystalSet, 1, "水晶"),
				{szName = "三公斤蛤蟆", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "常山网", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["一纪乾坤符"]=  
	{
		tbFormula = 
		{
			szComposeTitle = format("小龙\t兑换 %s", "一纪乾坤符"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "五行奇石", tbProp = {6,1,2125,-1,-1,0}, nCount = 300},
			},
			tbProduct = 
			{
				szName = "一纪乾坤符",
				[1]	= {szName = "一纪乾坤符", tbProp = {6,1,2126,1,0,0}, nExpiredTime = 30*24*60}, --change item expired time to 30days - Modified by DinhHQ - 20110428
				[2] = 
				{
					pFun = function (self, nCount, szLogTilte)
						szAllNews = format("高手<color=yellow>%s<color> 已得到 <color=green>%d<color> [<color=yellow>%s<color>], 江湖从此卷土重来", GetName(), 1, "一纪乾坤符");
						LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
					end
				},
			},
		},
		pCompos = nil;
	},
	["鬼影面具"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("小龙\t兑换 %s", "鬼影面具"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "五行奇石", tbProp = {6,1,2125,-1,-1,0}, nCount = 3},
			},
			tbProduct = {szName = "鬼影面具", tbProp = {0,11,455,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
	["救命面具"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("小龙\t兑换 %s", "救命面具"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "五行奇石", tbProp = {6,1,2125,-1,-1,0}, nCount = 5},
			},
			tbProduct = {szName = "救命面具", tbProp = {0,11,454,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
}

FreedomEvent2010.tbSongjinSoldier =
{
	{szName="肥料包", tbProp={6,1,2295,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="水桶", tbProp={6,1,2296,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="除虫剂", tbProp={6,1,2297,1,0,0}, nRate=34, nExpiredTime = 20100531},
}

FreedomEvent2010.tbMonsterDrop =
{
	{
		{szName="用具包", tbProp={6,1,2299,1,0,0}, nRate=1.2, nExpiredTime = 20100531},
	},
}

FreedomEvent2010.tbSoldierToolBag =
{
	{szName="金指盒",tbProp={6,1,2300,1,0,0}, nRate=70, nExpiredTime = 20100531},
	{szName="布匹", tbProp={6,1,2301,1,0,0}, nRate=30, nExpiredTime = 20100531},
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
	{szName="常山棍", tbProp={6,1,2298,1,0,0}, nRate=35.8, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜 <color=yellow>%s<color>得到 <color=yellow>%s<color>",GetName(),"常山棍") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜 <color=yellow>%s<color> 得到<color=yellow>%s<color>",GetName(),"常山棍")) end end},
	{szName="精炼铁(5级)", tbProp={6,1,2293,5,0,0}, nRate=20, nExpiredTime = 20100607},
	{szName="僧帽金牌", tbProp={6,1,2203,1,0,0}, nRate=3,},
	{szName="幽胧金牌", tbProp={6,1,2204,1,0,0}, nRate=2,},
	{szName="魔煞金牌", tbProp={6,1,2205,1,0,0}, nRate=2,},
	{szName="敌忾金牌", tbProp={6,1,2206,1,0,0}, nRate=3,},
	{szName="寒天金牌", tbProp={6,1,2237,1,0,0}, nRate=6,},
	{szName="天光金牌", tbProp={6,1,2238,1,0,0}, nRate=4,},
	{szName="新碧海金牌", tbProp={6,1,2239,1,0,0}, nRate=3,},
	{szName="伏魔金牌", tbProp={6,1,2240,1,0,0}, nRate=8,},
	{szName="凌岳金牌", tbProp={6,1,2241,1,0,0}, nRate=8,},
	{szName="霜晶金牌", tbProp={6,1,2242,1,0,0}, nRate=4,},
	{szName="金冠北京之梦", tbProp={0,197},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 已获得 <color=yellow>%s<color>",GetName(),"金冠北京之梦") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 已获得<color=yellow>%s<color>",GetName(),"金冠北京之梦")) end end},
	{szName="金冠雅典之魂", tbProp={0,202},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"金冠雅典之魂") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"金冠雅典之魂")) end end},
	{szName="神秘矿石", tbProp={6,1,398,1,0,0}, nRate=1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"神秘矿石") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"神秘矿石")) end end},

}

FreedomEvent2010.tbClothAwardNormal =
{
	{szName="三公斤蛤蟆", tbProp={6,1,2308,1,0,0}, nRate=18, nExpiredTime = 20100607},
	{szName="五行奇石", tbProp={6,1,2125,1,0,0}, nRate=20},
	{szName="常山棍", tbProp={6,1,2298,1,0,0}, nRate=10, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"常山棍") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"常山棍")) end end},
	{szName="特别仙草露", tbProp={6,1,1181,1,0,0}, nRate=2},
	{szName="铁罗汉", tbProp={6,1,23,1,0,0}, nRate=5},
	{szName="般若心经", tbProp={6,1,12,1,0,0}, nRate=2},
	{szName="精炼铁(3级)", tbProp={6,1,2293,3,0,0}, nRate=8, nExpiredTime = 20100607},
	{szName="精炼铁(4级)", tbProp={6,1,2293,4,0,0}, nRate=5, nExpiredTime = 20100607},
	{szName="精炼铁(5级)", tbProp={6,1,2293,5,0,0}, nRate=1, nExpiredTime = 20100607},
	{szName="僧帽金牌", tbProp={6,1,2203,1,0,0}, nRate=0.5,},
	{szName="幽胧金牌", tbProp={6,1,2204,1,0,0}, nRate=0.3,},
	{szName="魔煞金牌", tbProp={6,1,2205,1,0,0}, nRate=0.3,},
	{szName="敌忾金牌", tbProp={6,1,2206,1,0,0}, nRate=0.5,},
	{szName="寒天金牌", tbProp={6,1,2237,1,0,0}, nRate=1,},
	{szName="天光金牌", tbProp={6,1,2238,1,0,0}, nRate=1,},
	{szName="新碧海金牌", tbProp={6,1,2239,1,0,0}, nRate=0.6,},
	{szName="伏魔金牌", tbProp={6,1,2240,1,0,0}, nRate=1.2,},
	{szName="凌岳金牌", tbProp={6,1,2241,1,0,0}, nRate=1.2,},
	{szName="霜晶金牌", tbProp={6,1,2242,1,0,0}, nRate=0.8,},
	{szName="挑战礼包", tbProp={6,1,2006,1,0,0}, nRate=11.26},
	{szName="金冠北京之梦", tbProp={0,197},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"金冠北京之梦") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"金冠北京之梦")) end end},
	{szName="金冠雅典之魂", tbProp={0,202},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"金冠雅典之魂") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"金冠雅典之魂")) end end},
	{szName="神秘矿石", tbProp={6,1,398,1,0,0}, nRate=0.3,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"神秘矿石") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("恭喜<color=yellow>%s<color> 获得了 <color=yellow>%s<color>",GetName(),"神秘矿石")) end end},
	{szName="玄晶矿石 (6级) ", tbProp={6,1,147,6,0,0}, nRate=5},
	{szName="玄晶矿石 (7级) ", tbProp={6,1,147,7,0,0}, nRate=3},
	{szName="玄晶矿石 (8级) ", tbProp={6,1,147,8,0,0}, nRate=2},
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
	tbSay[1] = "庆祝解放日!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("购买[%s]/#FreedomEvent2010:BuyItem('%s')","高级布匹","高级布匹"));
	end
	tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyCotDlg()","常山网"));
	
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LingFanPlantItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "庆祝解放日!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("购买[%s]/#FreedomEvent2010:BuyItem('%s')","千岁核","千岁核"));
		tinsert(tbSay, format("购买[%s]/#FreedomEvent2010:BuyItem('%s')","肥料包","肥料包"));
		tinsert(tbSay, format("购买[%s]/#FreedomEvent2010:BuyItem('%s')","水桶","水桶"));
		tinsert(tbSay, format("购买[%s]/#FreedomEvent2010:BuyItem('%s')","除虫剂","除虫剂"));
	end
	
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LiGuanEventItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "庆祝解放日!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyItem('%s')","战士帽","战士帽"));
		tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyItem('%s')","部队鞋","部队鞋"));
		tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyItem('%s')","战士服","战士服"));
	end
	
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyCotDlg()
	local tbSay = {};
	tbSay[1] = "有4种兑换方法 <enter>5玄晶矿石(5级)+1水晶+1三公斤蛤蟆<enter>3玄晶矿石(6级)+1水晶+1三公斤蛤蟆<enter>2玄晶矿石(7级)+1水晶+1三公斤蛤蟆<enter>1玄晶矿石(8级)+1水晶+1三公斤蛤蟆";
	tinsert(tbSay, format("兑换方法1/#FreedomEvent2010:BuyItem('%s')","常山网 1"));
	tinsert(tbSay, format("兑换方法2/#FreedomEvent2010:BuyItem('%s')","常山网 2"));
	tinsert(tbSay, format("兑换方法3/#FreedomEvent2010:BuyItem('%s')","常山网 3"));
	tinsert(tbSay, format("兑换方法4/#FreedomEvent2010:BuyItem('%s')","常山网 4"));
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LongerEventItemDlg()
	local tbSay = {};
	tbSay[1] = "<#><npc>小龙: 大侠看我可爱吗? 这些石头好漂亮，大侠想换走我家宝物库里的什么东西";
	tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyItem('%s')","一纪乾坤符","一纪乾坤符"));
	tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyItem('%s')","鬼影面具","鬼影面具"));
	tinsert(tbSay, format("兑换 [%s]/#FreedomEvent2010:BuyItem('%s')","救命面具","救命面具"));
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("购买[%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end
