--�������
Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	["6,1,1781"] = {szName="�����������", tbProp={1, 8, 0, 4, 0, 0},tbParam={60}},
}
	

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount == 0 then
		Say("�Ѿ�ȡ�������ҩƷ�ˣ����Զ����ˡ�", 0)
		return 0
	end
	
	SetTaskTemp(114, nItemIndex)
	AskClientForNumber("huitianjinlang_getpotion", 0,nCount, "������ȡ���ĸ���")
	
	return 1
end


function huitianjinlang_getpotion(nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount then
		nPickCount = nFreeItemCellCount
	end
	local nItemIndex = GetTaskTemp(114)
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
		if not %tbItem[szItemId] then  --�ǲ����������
			return
		end
		
		local nCount = GetItemParam(nItemIndex, 1);
		if nPickCount > nCount then
			nPickCount = nCount
		end
		
		
		%tbItem[szItemId].nCount = nPickCount
		if tbAwardTemplet:GiveAwardByList(%tbItem[szItemId], "�����������") == 1 then
			nCount = nCount - nPickCount
			if nCount <= 0 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --ͬ���ͻ���
			end
		end
	else
		print("��Ʒ���������ˡ�")
	end
end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("ʣ������� <color=yellow>%d<color>", nCount)
end