Include("\\script\\tagnewplayer\\func_check.lua");
function GetItemAnBang()
	if (CheckObject() < 1) then
		Talk(1, "", "请检查参加条件.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) ~= 1) then
			Talk(1, "", "该奖励只能领一次!");
			return
	end
	if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang, 1)
	-- add chieu da ngoc su tu
		local ndx = AddItem(0,10,5,10,0,0)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("你获得 "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."获得AB "..strItem)
	-- An bang bang tinh thach h筺g li猲
		local ndx = AddGoldItem(0,164)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("你获得 "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."获得AB "..strItem)
	-- add item an bang cuc hoa thach chi hoan
		local ndx = AddGoldItem(0,165)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("你获得 "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."获得AB "..strItem)
	-- an bang dien hoang thach ngoc boi
		local ndx = AddGoldItem(0,166)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("你获得 "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."获得AB "..strItem)
	-- an bang ke huyet thach gioi chi
		local ndx = AddGoldItem(0,167)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("你获得 "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."获得AB "..strItem)
end