function DisposeItem()
	GiveItemUI("������Ʒ", "������Ʒʱ������ҪС��!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "ÿ��ֻ�ܷ���һ����Ʒ!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState ~= -2) then
		Talk(1, "", "��Ҫ��������Ʒ��������ס����Ʒ!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "����������������������!");
	Msg2Player("�����ոշ�����Ʒ�ɹ�")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." ����item ABHKLB "..GetAccount().."\t"..GetName().."\t".." ����item "..strItem)
end

function OnCancel()

end

