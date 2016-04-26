Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="龙头", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="龙身", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="龙尾", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="升天令(小)", tbProp={6, 1, 30049, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="小千年升龙",  tbProp={6, 1, 30052, 1, 0, 0}, nExpiredTime = 20101025,nCount = 1 },
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="龙头", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="龙身", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="龙尾", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="中升龙令", tbProp={6, 1, 30050, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="中千年升龙",  tbProp={6, 1, 30053, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="龙头", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="龙身", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="龙尾", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="大升天令", tbProp={6, 1, 30051, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="大千年升龙",  tbProp={6, 1, 30054, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
}


function Event1000_ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> 大侠想换什么奖品?";
	tinsert(tbOpp,"小千年升龙/#SelectExChangeItem(1)");
	tinsert(tbOpp,"中千年升龙/#SelectExChangeItem(2)");
	tinsert(tbOpp,"大千年升龙/#SelectExChangeItem(3)");
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

 function SelectExChangeItem(nSelect)
 	SetTask(Task_nSelect_Exchange, nSelect)
 	AskClientForNumber("DoExChangeItem",1,50,"<#>输入要换的数量")
 	
 end


function DoExChangeItem(nCount)
	local nSelect = GetTask(Task_nSelect_Exchange)
	if (CheckMaterial(nSelect, nCount)~=1) then
		Talk(1, "", "不足原料换去物品，请大侠再检查一下");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "准备不足5个空位.");
		return
	end
	ConsumeMaterial(nSelect, nCount)--除玩家准备中的原料
	AddItemExchange(nSelect, nCount)
end

function ConsumeMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000年升龙"..GetAccount().."\t"..GetName().."\t".."换取物品失败!")	
			return
		end
	end
end


function CheckMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
		if (nCurCount < numItem) then
			return 0
		end
	end
	return 1
end

function AddItemExchange(nSelect, nCount)
	local tbProduct = tbFormulaList[nSelect].tbProduct
	for i = 1, nCount do
		tbAwardTemplet:GiveAwardByList(tbProduct, "Event 1000 年升龙,合成物品");
	end
end


function OnCancel()
end 