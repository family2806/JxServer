Include("\\script\\vng_feature\\getgoldequip.lua")
function main(nItemIdx)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET, nItem2Consume = nItemIdx, nBindState = -2}
	tb.tbLog = {"风云令牌", "使用紫莽之宝"}
	--tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "使用紫莽之宝"}
	local nFaction = GetLastFactionNumber()	
	tbVNGetGoldEquip:ShowSpecItemDialog(5, tb)
	return 1
end