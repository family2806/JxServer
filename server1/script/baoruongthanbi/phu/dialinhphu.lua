Include("\\script\\lib\\awardtemplet.lua")
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("��Ʒ��ʹ���ڣ��Զ���ʧ.")
		return 0;
	end
	if (CalcFreeItemCellCount() < 3) then
		Talk(1,"","װ������3���ո�")
		return 1
	end
	for i=1, 2 do
		local ItemIndex = AddItem(6,1,30041,1,0,0)
		ITEM_SetExpiredTime(ItemIndex, 10080);
		SyncItem(ItemIndex);
	end
	Msg2Player("���յ�2�������")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."���ر���"..GetAccount().."\t"..GetName().."\t".."�򿪵��������յ����������")
	
end