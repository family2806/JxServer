IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
tbVnGiaHanPhu = {}
tbVnGiaHanPhu.tbItem = {
	["3491"]="长生",
	["3492"]="渤海",
	["3493"]="武威",
	["3494"]="若水",
	["3495"]="镇岳",
	["3496"]="安波",
	["3497"]="神慧",
	["3498"]="追英",
	["3499"]="龙胆",
	["3500"]="硫磺",
	["3501"]="狂澜",
	["3502"]="翠玉冰玄",
	["3503"]="红缨",
	["3504"]="凝雪寒霜",
	["3505"]="妙解尘缘",
	["3506"]="力魄军星",
	["3880"]="武大和",
	["3881"]="清平乐",
	["3882"]="回春",
	["3883"]="枯木",
	["3884"]="流云",
	["3885"]="尼石",
	["3886"]="雷火劫",
	["3887"]="迷醉天香",
	["3888"]="蝶舞花飞",
}

tbVnGiaHanPhu.nExpiredTime = 10080

function tbVnGiaHanPhuGiveUIConfirm(nCount)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")	
	if not nCheckMap then
		return
	end
	if nCount ~= 1 then
		Talk(1, "", "放入物品不对，请检查!")
		return
	end
	local nIDX = GetGiveItemUnit(1)
	local nQuality = GetItemQuality(nIDX)
	if nQuality ~= 1 then
		Talk(1, "", "你放入的装备不是黄金装备")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nIDX)
	if not tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] then
		Talk(1, "", "你放入的装备不是装饰，请检查!")
		return
	end
	local nCurItemExpiredTime = ITEM_GetExpiredTime(nIDX)
	local nCurTime = GetCurServerTime()
	if (nCurItemExpiredTime - nCurTime < 0) then
		Talk(1, "", "装饰已过使用期，不能延期.")
		return
	end
	if (nCurItemExpiredTime <= 0) or (nCurItemExpiredTime - nCurTime > tbVnGiaHanPhu.nExpiredTime*60) then
		Talk(1, "", "只能延期使用期为7天以下的装饰.")
		return
	end
	if ConsumeEquiproomItem(1, 6,1,30225,1) ~= 1 then
		Talk(1, "", "没找到加限符物品，加限失败.")
		return
	end
	local strItemName = GetItemName(nIDX)
	ITEM_SetExpiredTime(nIDX, tbVnGiaHanPhu.nExpiredTime)
	SyncItem(nIDX)
	Msg2Player(format("加限物品 <color=yellow>%s<color> 成功，物品使用期限<color=yellow>7<color> 天，从现在还是算起.", strItemName))
	tbLog:PlayerActionLog("SuDungVatPhamGiaHanPhu", "加限物品 "..strItemName, "旧的使用期限还剩 "..(nCurItemExpiredTime - nCurTime).." 秒")
end

function main(nItemIDX)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")
	if not nCheckMap then
		return 1
	end
	GiveItemUI("加限符", "请放入一个有使用期限的装饰到下面的空位", "tbVnGiaHanPhuGiveUIConfirm", "onCancel")
	return 1
end