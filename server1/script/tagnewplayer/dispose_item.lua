function DisposeItem()
	GiveItemUI("放弃物品", "放弃物品时，大侠要小心!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "每次只能放弃一个物品!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState ~= -2) then
		Talk(1, "", "需要放弃的物品是永久锁住的物品!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "大侠可以重新整理储物箱了!");
	Msg2Player("大侠刚刚放弃物品成功")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." 放弃item ABHKLB "..GetAccount().."\t"..GetName().."\t".." 放弃item "..strItem)
end

function OnCancel()

end

