function TradeNhanTamPhu_main()
	 AskClientForNumber("DoTaskYes_main",1,20,"<#>输入需要购买的数量")
end

function DoTaskYes_main(nCount)
	if (nCount == 0 or nCount == nil) then
		nCount = 1
	end
	local nSumMoney = nCount * 200000
	if (CalcFreeItemCellCount() < nCount +2) then
		Talk(1,"",format("装备不足 %d 空格", nCount + 2))
		return
	end
	if (GetCash() < nSumMoney ) then
		Talk(1,"","不足银两, 请大侠再检查一下!")
		return
	end
	if (Pay(nSumMoney)==1) then
		for i=1, nCount do
			local ItemIndex = AddItem(6,1,30040,1,0,0)
			ITEM_SetExpiredTime(ItemIndex, 10080);
			SyncItem(ItemIndex);
			Msg2Player("您收到了仁心符")
		end
		WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."购买仁心符数量"..nCount)
	else
		WriteLog(date("%Y%m%d %H%M%S").."\t".."神秘宝箱"..GetAccount().."\t"..GetName().."\t".."购买仁心符失败，数量 "..nCount)
	end
end