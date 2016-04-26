Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\activitysys\\config\\1002\\variables.lua")
function main(nItemIdx)	
	local tbSay = {
		format("紫莽上戒指#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.UPPER_RING),
		format("紫莽下戒指#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.LOWER_RING),
		"сng/OnCancel",
	}
	Say("请选择奖励:", getn(tbSay), tbSay)
	return 1
end

function OnCancel()

end

function SilverChest_GetAward(nIdx, nSelectedOption)
	local tb = {nSpecificItem = nSelectedOption, nItem2Consume = nIdx}
	tb.tbLog = {"Event_NgoiSaoTuyet", "使用银宝箱"}
	tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "使用银宝箱"}
	tbVNGetGoldEquip:ShowEquipBranchDialog(5, tb)
end