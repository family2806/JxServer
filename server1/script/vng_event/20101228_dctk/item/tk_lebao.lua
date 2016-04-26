IncludeLib("ITEM")
function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("物品过期，自动丢弃.")
		return 0
	end
	if(CalcFreeItemCellCount() < 5) then
		Talk(1, "", "为保护财产安全，请整理好您的背包以防放不下(5个格!)")
		return 1
	end
	for i =1, 5 do
		local nItemIdx = AddItem(6,1,30083,1,0,0)		
		ITEM_SetExpiredTime(nItemIdx, 24*60)
		SyncItem(nItemIdx)
	end
	Msg2Player("你得到<color=yellow>5 ..宋金招兵令")
	return 0
end
