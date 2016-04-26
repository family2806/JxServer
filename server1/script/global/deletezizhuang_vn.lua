-- 越南删除紫装，越南由于bug游戏世界出现了一些紫装；现在在上线的时候检查人身上有没有紫装，有则删除
-- 注意：本脚本在紫装开放的时候一定要删除；
IL("ITEM");

function vn_delete_zizhuang()
	local idx = 0;
	local nItemIdx;
	idx, nItemIdx = ITEM_FindNext( idx );
	local tab_Zizhuang = {};

	while (idx > 0)	do
		
		if (nItemIdx > 0) then
			if (GetItemQuality(nItemIdx) == 2) then
				tinsert(tab_Zizhuang, nItemIdx)
			end;
		end;
		idx, nItemIdx = ITEM_FindNext( idx );
	end;
	
	for i = 1, getn(tab_Zizhuang) do
		vn_addlog(tab_Zizhuang[i]);
		RemoveItemByIndex(tab_Zizhuang[i]);
	end;
	Msg2Player("异常状态已被删除");
end;

function vn_addlog(nItemIdx)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	local nQuality = GetItemQuality( nItemIdx );
	local arynMagLvl = GetItemAllParams( nItemIdx );
	local nStackCount = GetItemStackCount( nItemIdx );
	
	local str = format( "{%d, %d, %d, %d, %d, %d, %d, <%d, %d, %d, %d, %d, %d>}#%d\t", nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6], nStackCount );
	
	WriteLog("[delete exceptional equip]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." 's equip: "..GetItemName(nItemIdx).." is deleted from the game world system, which attibution is: "..str);
end;

if login_add then login_add(vn_delete_zizhuang, 0) end