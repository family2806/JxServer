Include("\\script\\task\\system\\task_string.lua");

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="金菊花", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="白菊花", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="紫菊花", tbProp={6, 1, 1066, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="国庆花圈",  tbProp={6, 1, 30033, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="金菊花", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="白菊花", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="紫菊花", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="玫瑰", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="独立花圈",  tbProp={6, 1, 30034, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="金菊花", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="白菊花", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="紫菊花", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="玫瑰", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="自由花圈",  tbProp={6, 1, 30035, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
}


function ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> 大侠想换哪种奖励 ?";
	tinsert(tbOpp,"我想换国庆花圈(1 金菊花 + 1 白菊花 + 1 紫菊花 + 2 万)/#DoExChangeItem(1)");
	tinsert(tbOpp,"我想换独立花圈(1 金菊花 + 1 白菊花 + 1 紫菊花 + 1 红玫瑰)/#DoExChangeItem(2)");
	tinsert(tbOpp,"我想换自由花圈((1 金菊花 + 1 白菊花 + 1 紫菊花 + 1 红玫瑰)/#DoExChangeItem(3)");
	tinsert(tbOpp, "<#>Tho竧/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end



function DoExChangeItem(numIndexExchange)
	if (CheckMaterial(numIndexExchange)~=1) then
		Talk(1, "", "不够原料换物品，请检查");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "装备不足5空位.");
		return
	end
	if (numIndexExchange == 1) then
		if (GetCash() < 20000 ) then
			Talk(1, "", "换国庆花圈需要2 万两 !");
			return
		end
		if Pay(20000) ~= 1 then
			Msg2Player("扣银两失败 !")
			return
		end
	end
	
	
	ConsumeMaterial(numIndexExchange)--扣玩家准备里的原料
	AddItemExchange(numIndexExchange)
end

function ConsumeMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."换花圈"..GetAccount().."\t"..GetName().."\t".."换物品失败!")	
			return
		end
	end
end


function CheckMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
		if (nCurCount < numItem) then
			return 0
		end
	end
	return 1
end

function AddItemExchange(numtbMaterial)
	local tbProduct = tbFormulaList[numtbMaterial].tbProduct
	for i=1,getn(tbProduct) do
		local tbItem = tbProduct[i]
		local tbProp = tbItem.tbProp
		local nExpiredTime = tbItem.nExpiredTime
		local nIndex = AddItem(tbProp[1], tbProp[2], tbProp[3], tbProp[4],tbProp[5],tbProp[6])
		ITEM_SetExpiredTime(nIndex, 20100919);
		SyncItem(nIndex)
		local strItem = GetItemName(nIndex)
		Msg2Player("你获得"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."换花圈"..GetAccount().."\t"..GetName().."\t".."换物品 "..strItem)
	end
end


function OnCancel()
end 