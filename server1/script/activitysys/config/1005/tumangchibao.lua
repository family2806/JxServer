Include("\\script\\vng_feature\\getgoldequip.lua")
function main(nItemIdx)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET, nItem2Consume = nItemIdx, nBindState = -2}
	tb.tbLog = {"��������", "ʹ����ç֮��"}
	--tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "ʹ����ç֮��"}
	local nFaction = GetLastFactionNumber()	
	tbVNGetGoldEquip:ShowSpecItemDialog(5, tb)
	return 1
end