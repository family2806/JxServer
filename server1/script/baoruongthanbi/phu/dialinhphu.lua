Include("\\script\\lib\\awardtemplet.lua")
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("物品过使用期，自动消失.")
		return 0;
	end
	if (CalcFreeItemCellCount() < 3) then
		Talk(1,"","装备不足3个空格")
		return 1
	end
	for i=1, 2 do
		local ItemIndex = AddItem(6,1,30041,1,0,0)
		ITEM_SetExpiredTime(ItemIndex, 10080);
		SyncItem(ItemIndex);
	end
	Msg2Player("您收到2个地灵符")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."打开地灵符礼包收到两个地灵符")
	
end