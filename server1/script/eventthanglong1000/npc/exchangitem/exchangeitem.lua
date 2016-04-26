Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="��ͷ", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="����", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="��β", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="������(С)", tbProp={6, 1, 30049, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="Сǧ������",  tbProp={6, 1, 30052, 1, 0, 0}, nExpiredTime = 20101025,nCount = 1 },
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="��ͷ", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="����", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="��β", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="��������", tbProp={6, 1, 30050, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="��ǧ������",  tbProp={6, 1, 30053, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="��ͷ", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="����", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="��β", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="��������", tbProp={6, 1, 30051, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="��ǧ������",  tbProp={6, 1, 30054, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
}


function Event1000_ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> �����뻻ʲô��Ʒ?";
	tinsert(tbOpp,"Сǧ������/#SelectExChangeItem(1)");
	tinsert(tbOpp,"��ǧ������/#SelectExChangeItem(2)");
	tinsert(tbOpp,"��ǧ������/#SelectExChangeItem(3)");
	tinsert(tbOpp, "<#>�˳�/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

 function SelectExChangeItem(nSelect)
 	SetTask(Task_nSelect_Exchange, nSelect)
 	AskClientForNumber("DoExChangeItem",1,50,"<#>����Ҫ��������")
 	
 end


function DoExChangeItem(nCount)
	local nSelect = GetTask(Task_nSelect_Exchange)
	if (CheckMaterial(nSelect, nCount)~=1) then
		Talk(1, "", "����ԭ�ϻ�ȥ��Ʒ��������ټ��һ��");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "׼������5����λ.");
		return
	end
	ConsumeMaterial(nSelect, nCount)--�����׼���е�ԭ��
	AddItemExchange(nSelect, nCount)
end

function ConsumeMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000������"..GetAccount().."\t"..GetName().."\t".."��ȡ��Ʒʧ��!")	
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
		tbAwardTemplet:GiveAwardByList(tbProduct, "Event 1000 ������,�ϳ���Ʒ");
	end
end


function OnCancel()
end 