Include("\\script\\vng_feature\\getgoldequip.lua")
function main(nItemIdx)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET, nItem2Consume = nItemIdx, nBindState = -2}
	tb.tbLog = {"Phong V©n LÖnh Bµi ", "SuDungTuMangBaoChau"}
	--tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "SuDungTuMangBaoChau"}
	local nFaction = GetLastFactionNumber()	
	tbVNGetGoldEquip:ShowSpecItemDialog(5, tb)
	return 1
end