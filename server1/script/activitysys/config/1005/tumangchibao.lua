Include("\\script\\vng_feature\\getgoldequip.lua")
function main(nItemIdx)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET, nItem2Consume = nItemIdx, nBindState = -2}
	tb.tbLog = {"Phong V©n LÖnh Bµi ", "Sö dông Tõ M¶ng Chi B¶o"}
	--tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "Sö dông Tõ M¶ng Chi B¶o"}
	local nFaction = GetLastFactionNumber()	
	tbVNGetGoldEquip:ShowSpecItemDialog(5, tb)
	return 1
end