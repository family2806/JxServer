Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\activitysys\\config\\1002\\variables.lua")
function main(nItemIdx)	
	local tbSay = {
		format("��ç�Ͻ�ָ#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.UPPER_RING),
		format("��ç�½�ָ#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.LOWER_RING),
		"��ng/OnCancel",
	}
	Say("��ѡ����:", getn(tbSay), tbSay)
	return 1
end

function OnCancel()

end

function SilverChest_GetAward(nIdx, nSelectedOption)
	local tb = {nSpecificItem = nSelectedOption, nItem2Consume = nIdx}
	tb.tbLog = {"Event_NgoiSaoTuyet", "ʹ��������"}
	tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "ʹ��������"}
	tbVNGetGoldEquip:ShowEquipBranchDialog(5, tb)
end