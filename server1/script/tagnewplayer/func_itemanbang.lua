Include("\\script\\tagnewplayer\\func_check.lua");
function GetItemAnBang()
	if (CheckObject() < 1) then
		Talk(1, "", "����μ�����.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) ~= 1) then
			Talk(1, "", "�ý���ֻ����һ��!");
			return
	end
	if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang, 1)
	-- add chieu da ngoc su tu
		local ndx = AddItem(0,10,5,10,0,0)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("���� "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���AB "..strItem)
	-- An bang bang tinh thach h�ng li�n
		local ndx = AddGoldItem(0,164)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("���� "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���AB "..strItem)
	-- add item an bang cuc hoa thach chi hoan
		local ndx = AddGoldItem(0,165)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("���� "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���AB "..strItem)
	-- an bang dien hoang thach ngoc boi
		local ndx = AddGoldItem(0,166)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("���� "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���AB "..strItem)
	-- an bang ke huyet thach gioi chi
		local ndx = AddGoldItem(0,167)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("���� "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."���AB "..strItem)
end