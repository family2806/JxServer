--�������
Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	["6,1,2527"] = {szName="�������쵤", tbProp={1, 8, 0, 4, 0, 0}},
}
	

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount >= 60 then
		Say("�Ѿ�ȡ�����������е�ҩ�ˣ����Զ���.", 0)
		return 0
	end
	
	SetTaskTemp(114, nItemIndex)
	AskClientForNumber("huitianjinlang_getpotion", 0,(60-nCount), "��������Ҫȡ����Ŀ")
	
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
		local nLastCount = 60 - nCount;
		if nPickCount > nLastCount then
			nPickCount = nLastCount
		end
		
		
		%tbItem[szItemId].nCount = nPickCount
		if tbAwardTemplet:GiveAwardByList(%tbItem[szItemId], "�����������") == 1 then
			nCount = nCount + nPickCount
			if nCount >= 60 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --ͬ���ͻ���
			end
		end
	else
		print("��Ʒ��������")
	end
end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("ϵͳ:  <color=yellow>%d<color>",(60 - nCount))
end