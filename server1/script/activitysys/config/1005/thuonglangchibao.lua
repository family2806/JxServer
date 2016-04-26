Include("\\script\\vng_feature\\getgoldequip.lua")
function main(nItemIdx)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET, nItem2Consume = nItemIdx, nBindState = -2}
	tb.tbLog = {"PhongVanLenhBai", "SuDungThuongLangChiBao"}
	--tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "使用紫莽宝珠"}
	local nFaction = GetLastFactionNumber()
	if nFaction < 0 or nFaction > 9 then
		Talk(1, "", "请加入门派后使用该物品")
		return 1
	end
	tbVNGetGoldEquip:ShowEquipBranchByFaction(3, tb, nFaction)
	return 1
end