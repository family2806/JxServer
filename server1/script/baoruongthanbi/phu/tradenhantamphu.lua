function TradeNhanTamPhu_main()
	 AskClientForNumber("DoTaskYes_main",1,20,"<#>������Ҫ���������")
end

function DoTaskYes_main(nCount)
	if (nCount == 0 or nCount == nil) then
		nCount = 1
	end
	local nSumMoney = nCount * 200000
	if (CalcFreeItemCellCount() < nCount +2) then
		Talk(1,"",format("װ������ %d �ո�", nCount + 2))
		return
	end
	if (GetCash() < nSumMoney ) then
		Talk(1,"","��������, ������ټ��һ��!")
		return
	end
	if (Pay(nSumMoney)==1) then
		for i=1, nCount do
			local ItemIndex = AddItem(6,1,30040,1,0,0)
			ITEM_SetExpiredTime(ItemIndex, 10080);
			SyncItem(ItemIndex);
			Msg2Player("���յ������ķ�")
		end
		WriteLog(date("%Y%m%d %H%M%S").."\t".."���ر���"..GetAccount().."\t"..GetName().."\t".."�������ķ�����"..nCount)
	else
		WriteLog(date("%Y%m%d %H%M%S").."\t".."���ر���"..GetAccount().."\t"..GetName().."\t".."�������ķ�ʧ�ܣ����� "..nCount)
	end
end