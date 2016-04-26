Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")
Include("\\script\\lib\\awardtemplet.lua")

Event201010 = {}

Event201010.END_DATE = 20101111

Event201010.tbBuyItem =
{
	["������"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10�»\t���� %s", "������"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "������ʯ", tbProp = {6,1,147,4,0,0}, nCount = 1},
					{szName = "��ʯ", tbProp = {6,1,30056,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "������", tbProp = {6,1,30059,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},
	
	["�Ʊ���"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10�»\t���� %s", "�Ʊ���"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "������ʯ", tbProp = {6,1,147,3,0,0}, nCount = 1},
					{szName = "��ʯ", tbProp = {6,1,30057,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "�Ʊ���", tbProp = {6,1,30060,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},	
		
	["�ϱ���"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10�» \t���� %s", "�ϱ���"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "������ʯ", tbProp = {6,1,147,2,0,0}, nCount = 1},
					{szName = "��ʯ", tbProp = {6,1,30058,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "�ϱ���", tbProp = {6,1,30061,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},		
		
	["��ʯ"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("10�» \t���� %s", "��ʯ"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = {{nJxb = 5e4, nCount=1}},
				tbProduct = {szName = "��ʯ", tbProp = {6,1,30057,1,0,0}, nExpiredTime = 20101111},
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
	tbSay[1] = "�͹�Ҫ��ʲô?"
	if (now < self.END_DATE) then
		tinsert(tbSay, format("���� [%s]/#Event201010:BuyItem('%s')","������","������"));
		tinsert(tbSay, format("���� [%s]/#Event201010:BuyItem('%s')","�Ʊ���","�Ʊ���"));
		tinsert(tbSay, format("����[%s]/#Event201010:BuyItem('%s')","�ϱ���","�ϱ���"));
	end
	
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyHoangThach()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "��Ҫ��ʲô?!";
	if (now < self.END_DATE) then
		tinsert(tbSay, format("�� [%s]/#Event201010:BuyItem('%s')","��ʯ","��ʯ"));
	end
	
	tinsert(tbSay, "�뿪/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("�� [%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end

 function Event201010:BuyLamThach()
 	if (Event201010:IsActive() ~= 1) then
 		Talk(1,"", "10�µĻ�ѽ���!")
 		return
 	end
 	AskClientForNumber("GetLamThach",1,50,"<#>���빺������")
 end
 
 function GetLamThach(nCount)
 	if CalcFreeItemCellCount() < 1 then
		Say("���ı�������1����!",0)
		return
	end
	
 	local nSum = nCount * 50
 	if (GetEnergy() < nSum) then
 		Talk(1,"", "���ľ���ʯ���㣬����")
 		return
 	end 
 	
 	ReduceEnergy(nSum)
	tbAwardTemplet:GiveAwardByList({tbProp={6,1,30056,1,0,0}, nExpiredTime=20101111, nCount = nCount} , "Event 10�� - ����ʯ");
 end
