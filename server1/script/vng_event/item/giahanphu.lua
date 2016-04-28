IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
tbVnGiaHanPhu = {}
tbVnGiaHanPhu.tbItem = {
	["3491"]="Tr­êng sinh",
	["3492"]="Bét H¶i",
	["3493"]="Vò Uy",
	["3494"]="Nh­îc Thñy",
	["3495"]="TrÊn Nh¹c",
	["3496"]="Yªn Ba",
	["3497"]="ThÇn TuÖ",
	["3498"]="Truy Anh ",
	["3499"]="Long §¶m",
	["3500"]="L­u Huúnh",
	["3501"]="Cuång Lan",
	["3502"]="Thóy Ngäc B¨ng HuyÒn",
	["3503"]="Hång Anh",
	["3504"]="Ng­ng TuyÕt Hµn S­¬ng",
	["3505"]="DiÖu Gi¶i TrÇn Duyªn",
	["3506"]="Lùc Ph¸ Qu©n Tinh",
	["3880"]="Vò §· Hµ",
	["3881"]="Thanh B×nh L¹c",
	["3882"]="Håi Xu©n",
	["3883"]="Kh« Méc",
	["3884"]="L­u V©n",
	["3885"]="Nª Tr¹ch",
	["3886"]="L«i Háa KiÕp",
	["3887"]="Mª Tóy Thiªn H­¬ng",
	["3888"]="§iÖp Vò Hoa Phi",
}

tbVnGiaHanPhu.nExpiredTime = 10080

function tbVnGiaHanPhuGiveUIConfirm(nCount)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")	
	if not nCheckMap then
		return
	end
	if nCount ~= 1 then
		Talk(1, "", "VËt phÈm bá vµo kh«ng ®óng, xin h·y kiÓm tra l¹i!")
		return
	end
	local nIDX = GetGiveItemUnit(1)
	local nQuality = GetItemQuality(nIDX)
	if nQuality ~= 1 then
		Talk(1, "", "Trang bÞ ng­¬i ®Æt vµo kh«ng ph¶i lµ trang bÞ hoµng kim")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nIDX)
	if not tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] then
		Talk(1, "", "Trang bÞ ng­¬i ®Æt vµo kh«ng ph¶i lµ trang søc, xin h·y kiÓm tra l¹i!")
		return
	end
	local nCurItemExpiredTime = ITEM_GetExpiredTime(nIDX)
	local nCurTime = GetCurServerTime()
	if (nCurItemExpiredTime - nCurTime < 0) then
		Talk(1, "", "Trang søc ®· hÕt h¹n sö dông, kh«ng thÓ gia h¹n.")
		return
	end
	if (nCurItemExpiredTime <= 0) or (nCurItemExpiredTime - nCurTime > tbVnGiaHanPhu.nExpiredTime*60) then
		Talk(1, "", "ChØ cã thÓ gia h¹n trang søc cã h¹n sö dông d­íi 7 ngµy.")
		return
	end
	if ConsumeEquiproomItem(1, 6,1,30225,1) ~= 1 then
		Talk(1, "", "Kh«ng t×m thÊy vËt phÈm Gia H¹n Phï, gia h¹n thÊt b¹i.")
		return
	end
	local strItemName = GetItemName(nIDX)
	ITEM_SetExpiredTime(nIDX, tbVnGiaHanPhu.nExpiredTime)
	SyncItem(nIDX)
	Msg2Player(format("Gia h¹n vËt phÈm <color=yellow>%s<color> thµnh c«ng, vËt phÈm cã h¹n sö dông <color=yellow>7<color> ngµy tÝnh tõ thêi ®iÓm hiÖn t¹i.", strItemName))
	tbLog:PlayerActionLog("SuDungVatPhamGiaHanPhu", "Gia h¹n vËt phÈm "..strItemName, "H¹n sö dông cò cßn "..(nCurItemExpiredTime - nCurTime).." gi©y")
end

function main(nItemIDX)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")
	if not nCheckMap then
		return 1
	end
	GiveItemUI("Gia H¹n Phï", "Xin h·y bá 1 mãn trang søc cã h¹n sö dông vµo « bªn d­íi", "tbVnGiaHanPhuGiveUIConfirm", "onCancel")
	return 1
end