IncludeLib("ITEM")
function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("��Ʒ���ڣ��Զ�����.")
		return 0
	end
	if(CalcFreeItemCellCount() < 5) then
		Talk(1, "", "Ϊ�����Ʋ���ȫ������������ı����Է��Ų���(5����!)")
		return 1
	end
	for i =1, 5 do
		local nItemIdx = AddItem(6,1,30083,1,0,0)		
		ITEM_SetExpiredTime(nItemIdx, 24*60)
		SyncItem(nItemIdx)
	end
	Msg2Player("��õ�<color=yellow>5 ..�ν��б���")
	return 0
end
