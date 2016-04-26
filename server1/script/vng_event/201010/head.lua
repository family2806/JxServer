Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")
Include("\\script\\lib\\awardtemplet.lua")

Event201010 = {}

Event201010.END_DATE = 20101111

Event201010.tbBuyItem =
{
	["蓝冰晶"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10月活动\t交换 %s", "蓝冰晶"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "玄晶矿石", tbProp = {6,1,147,4,0,0}, nCount = 1},
					{szName = "蓝石", tbProp = {6,1,30056,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "蓝冰晶", tbProp = {6,1,30059,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},
	
	["黄冰晶"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10月活动\t交换 %s", "黄冰晶"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "玄晶矿石", tbProp = {6,1,147,3,0,0}, nCount = 1},
					{szName = "蓝石", tbProp = {6,1,30057,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "黄冰晶", tbProp = {6,1,30060,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},	
		
	["紫冰晶"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10月活动 \t交换 %s", "紫冰晶"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "玄晶矿石", tbProp = {6,1,147,2,0,0}, nCount = 1},
					{szName = "紫石", tbProp = {6,1,30058,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "紫冰晶", tbProp = {6,1,30061,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},		
		
	["黄石"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10月活动 \t购买 %s", "黄石"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = {{nJxb = 5e4, nCount=1}},
				tbProduct = {szName = "黄石", tbProp = {6,1,30057,1,0,0}, nExpiredTime = 20101111},
			},
			pCompos = nil;
		},
}

function Event201010:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE) then
		return 0;
	end
	return 1;
end

function Event201010:ShowDialog()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "客官要买什么?"
	if (now < self.END_DATE) then
		tinsert(tbSay, format("交换 [%s]/#Event201010:BuyItem('%s')","蓝冰晶","蓝冰晶"));
		tinsert(tbSay, format("交换 [%s]/#Event201010:BuyItem('%s')","黄冰晶","黄冰晶"));
		tinsert(tbSay, format("交换[%s]/#Event201010:BuyItem('%s')","紫冰晶","紫冰晶"));
	end
	
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyHoangThach()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "您要换什么?!";
	if (now < self.END_DATE) then
		tinsert(tbSay, format("买 [%s]/#Event201010:BuyItem('%s')","黄石","黄石"));
	end
	
	tinsert(tbSay, "离开/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("买 [%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end

 function Event201010:BuyLamThach()
 	if (Event201010:IsActive() ~= 1) then
 		Talk(1,"", "10月的活动已结束!")
 		return
 	end
 	AskClientForNumber("GetLamThach",1,50,"<#>输入购买数量")
 end
 
 function GetLamThach(nCount)
 	if CalcFreeItemCellCount() < 1 then
		Say("您的背包不够1个格!",0)
		return
	end
	
 	local nSum = nCount * 50
 	if (GetEnergy() < nSum) then
 		Talk(1,"", "您的精炼石不足，请检查")
 		return
 	end 
 	
 	ReduceEnergy(nSum)
	tbAwardTemplet:GiveAwardByList({tbProp={6,1,30056,1,0,0}, nExpiredTime=20101111, nCount = nCount} , "Event 10月 - 买蓝石");
 end
