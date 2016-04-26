Include("\\script\\task\\system\\task_string.lua");

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="��ջ�", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="�׾ջ�", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="�Ͼջ�", tbProp={6, 1, 1066, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="���컨Ȧ",  tbProp={6, 1, 30033, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="��ջ�", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="�׾ջ�", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="�Ͼջ�", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="õ��", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="������Ȧ",  tbProp={6, 1, 30034, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="��ջ�", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="�׾ջ�", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="�Ͼջ�", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="õ��", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="���ɻ�Ȧ",  tbProp={6, 1, 30035, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
}


function ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> �����뻻���ֽ��� ?";
	tinsert(tbOpp,"���뻻���컨Ȧ(1 ��ջ� + 1 �׾ջ� + 1 �Ͼջ� + 2 ��)/#DoExChangeItem(1)");
	tinsert(tbOpp,"���뻻������Ȧ(1 ��ջ� + 1 �׾ջ� + 1 �Ͼջ� + 1 ��õ��)/#DoExChangeItem(2)");
	tinsert(tbOpp,"���뻻���ɻ�Ȧ((1 ��ջ� + 1 �׾ջ� + 1 �Ͼջ� + 1 ��õ��)/#DoExChangeItem(3)");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end



function DoExChangeItem(numIndexExchange)
	if (CheckMaterial(numIndexExchange)~=1) then
		Talk(1, "", "����ԭ�ϻ���Ʒ������");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "װ������5��λ.");
		return
	end
	if (numIndexExchange == 1) then
		if (GetCash() < 20000 ) then
			Talk(1, "", "�����컨Ȧ��Ҫ2 ���� !");
			return
		end
		if Pay(20000) ~= 1 then
			Msg2Player("������ʧ�� !")
			return
		end
	end
	
	
	ConsumeMaterial(numIndexExchange)--�����׼�����ԭ��
	AddItemExchange(numIndexExchange)
end

function ConsumeMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����Ȧ"..GetAccount().."\t"..GetName().."\t".."����Ʒʧ��!")	
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
		Msg2Player("����"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����Ȧ"..GetAccount().."\t"..GetName().."\t".."����Ʒ "..strItem)
	end
end


function OnCancel()
end 