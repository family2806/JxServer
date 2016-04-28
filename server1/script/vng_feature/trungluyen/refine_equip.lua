--×ÏòþTrang bÞÖØÁ·¼¼ÄÜ - Created by DinhHQ - 20110517

Include("\\script\\vng_feature\\trungluyen\\globalvar.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbVNG_RefineEquip = {}


function tbVNG_RefineEquip:ShowDialog()
	local strDesc = "§Ó trïng luyÖn cÇn 1 <color=yellow>trang bÞ Tö M·ng<color> bÊt kú vµ sè l­îng <color=yellow>Ngäc Trïng LuyÖn<color> tïy theo lo¹i trang bÞ nh­ sau:"	
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "Trang bÞ", "Ngäc cÇn")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Kh«i", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Y", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Hµi", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Yªu §¸i", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Hé UyÓn", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng H¹ng Liªn", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "×ÏÃ§Ngäc cÇnÅå", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Giíi ChØ", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng KhÝ Giíi", 3)
	Describe(strDesc, 2, "Ta muèn trïng luyÖn/#tbVNG_RefineEquip:main()", "§ãng/OnCancel")
end

function tbVNG_RefineEquip:main()	
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(nTSK_DAILY_REFINE_LIMIT)
	if nTaskVal >= nDAILY_REFINE_MAX_COUNT then
		Talk(1, "", format("Ã¿ÌìÖ»ÄÜÖØÁ·Trang bÞ <color=red>%d<color> ´Î£¬Ã÷ÌìÔÙÀ´°É!", nDAILY_REFINE_MAX_COUNT))
		return
	end
	
	local strDesc = format("%-22s%s\n", "Trang bÞ", "Ngäc cÇn")
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Kh«i", 1)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Y", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Hµi", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Yªu §¸i", 1)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Hé UyÓn", 1)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng H¹ng Liªn", 2)
	strDesc = strDesc..format("\n%-29s%d", "×ÏÃ§Ngäc cÇnÅå", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Giíi ChØ", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng KhÝ Giíi", 3)
	GiveItemUI("Trïng luyÖn Tö M·ng", strDesc, "RefineUIConfirm", "OnCancel")
end

function RefineUIConfirm(nCount)	
	local tbGoldEquip = {}
	local tbStoneList = {}
	local nTempIdx = 0
	local nItemQuality = -1
	for i = 1, nCount do
		nTempIdx = GetGiveItemUnit(i)
		if nTempIdx < 0 then
			Talk(1, "", "VËt phÈm kh«ng hîp lÖ")
			return
		end
		nItemQuality = GetItemQuality(nTempIdx)
		--item hoµng kim
		if nItemQuality == 1 then
			tinsert(tbGoldEquip, getn(tbGoldEquip) + 1 ,nTempIdx)
		else --item th­êng
			tinsert(tbStoneList, getn(tbStoneList) + 1, nTempIdx)		
		end	
	end
	
	--¼ì²éitem ºÏÀíÂð
	local nResult, strFailMessage = tbVNG_RefineEquip:CheckItems(tbGoldEquip, tbStoneList)
	if nResult ~= 1 and strFailMessage then
		Talk(1, "", strFailMessage)
		return
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGoldEquip[1]) 
	
	--É¾³ýÔ­ÁÏ
	local nConsumeResult, strConsumeFailMessage = tbVNG_RefineEquip:ConsumeItems(tbGoldEquip, tbStoneList)
	if nConsumeResult ~= 1 and strConsumeFailMessage then
		Talk(1, "", strConsumeFailMessage)
		return
	end
	PlayerFunLib:AddTaskDaily(nTSK_DAILY_REFINE_LIMIT, 1)
	local nNextEquipIdx = AddGoldItem(0, nGoldEquipID)
	if nNextEquipIdx <= 0 then
		Msg2Player("Trïng luyÖn Tö M·ngÊ§°Ü£¬Ê§È¥Ò»Ð©Ô­ÁÏ!")
		tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","AddTrangBiThatBai", "", "", "", SubWorld)
		return
	end
	Msg2Player("<color=green>Trïng luyÖn Tö M·ng³É¹¦£¬Çë¼ì²éTrang bÞ")
	tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","AddTrang bÞ³É¹¦", GetItemName(nNextEquipIdx), GetGlodEqIndex(nNextEquipIdx), 1, SubWorld)
end

function tbVNG_RefineEquip:CheckItems(tbGold, tbStone)
	--¼ì²é·ÅÈëµÄ»Æ½ðTrang bÞ
	if getn(tbGold) > 1 or getn(tbGold) <= 0 then
		return 0, "Ã¿´ÎÖ»ÄÜÖØÁ·Ò»´Î×ÏòþTrang bÞ"
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGold[1])
	
	--·ÅÈëµÄ²»ÊÇ×ÏòþTrang bÞ
	if not tbRE_Formula[nGoldEquipID] then
		return 0, "Trang bÞ·ÅÈë²»ºÏÀí£¬Çë´óÏÀ¼ì²é."
	end
	
	--¼ì²éËøµÄ×´Ì¬
	local nBindState = GetItemBindState(tbGold[1])
	if nBindState ~= 0 then
		return 0, "Trang bÞÕý´¦ÓÚÓÀ¾ÃËø×¡×´Ì¬£¬²»ÄÜÖØÁ·!."
	end
	
	--¼ì²é
	local nG, _, _ = GetItemProp(tbGold[1])
	if nG == 7 then
		return 0, "Trang bÞ»µÁË£¬²»ÄÜÖØÁ·!."
	end
	
	--¼ì²éNgäc cÇnµÄÊýÁ¿
	local nStoneRequire = tbRE_Formula[nGoldEquipID].nStoneRequire
	if getn(tbStone) ~= nStoneRequire then
		return 0, "Kh«ng ®ñ nguyªn liÖu, kh«ng thÓ trïng luyÖn!"
	end	
	
	--¼ì²é·ÅÈëµÄNgäc cÇnµÄºÏÀíÐÔ
	for i = 1, getn(tbStone) do
		if self:CheckStone(tbStone[i]) ~= 1 then
			return 0, "·ÅÈëµÄVËt phÈm kh«ng hîp lÖ£¬Çë¼ì²é!"
		end
	end	
	
	return 1
end

function tbVNG_RefineEquip:CheckStone(nStoneIdx)
	local nG, nD, nP = GetItemProp(nStoneIdx)
	if nG ~= tbSTONE_GDP.nG or nD ~= tbSTONE_GDP.nD or nP ~= tbSTONE_GDP.nP then
		return 0
	end
	return 1
end

function tbVNG_RefineEquip:ConsumeItems(tbGold, tbStone)
	--consume stones
	local nStoneIdx = 0
	local nStoneRemoved = 0
	for i = 1, getn(tbStone) do
		nStoneIdx = tbStone[i]
		local nG, nD, nP = GetItemProp(nStoneIdx)
		local strItemCode = nG..", "..nD..", "..nP
		local strStoneName = GetItemName(nStoneIdx)
		if IsMyItem(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","NgocTrungLuyenKhongConTrenNguoi", strStoneName, strItemCode, 1, SubWorld)
			return 0, "NgocTrungLuyenKhongConTrenNguoi£¬TrungLuyenThatBai£¬Ê§È¥Ò»Ð©ÎïÆ·!!"
		end
		if RemoveItemByIndex(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","XoaNguyenLieuThatBai", strStoneName, strItemCode, 1, SubWorld)
			return 0, "Trïng luyÖn Tö M·ngÊ§°Ü£¬Ê§È¥Ò»Ð©Ô­ÁÏ!"
		else			
			tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","XoaNguyenLieuThanhCong", strStoneName, strItemCode, 1, SubWorld)
			nStoneRemoved = nStoneRemoved + 1
		end
	end
	if nStoneRemoved ~= getn(tbStone) then
		tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","TrungLuyenThatBai", "·ÅÈëNgäc cÇnµÄÊýÁ¿²»Í¬²½")
		return 0, "Trïng luyÖn Tö M·ngÊ§°Ü£¬Ê§È¥Ò»Ð©Ô­ÁÏ!"
	end
	--consume gold equip
	local nGoldEquipIdx = tbGold[1]
	local strEquipName = GetItemName(nGoldEquipIdx)
	local nEquipID = GetGlodEqIndex(nGoldEquipIdx)
	if IsMyItem(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","Trang bÞ²»ÔÚÉíÉÏ", strEquipName, nEquipID, 1, SubWorld)
		return 0, "NgocTrungLuyenKhongConTrenNguoi£¬TrungLuyenThatBai£¬Ê§È¥Ò»Ð©ÎïÆ·!!"
	end
	
	if RemoveItemByIndex(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","É¾³ýTrang bÞÊ§°Ü", strEquipName, nEquipID, 1, SubWorld)
		return 0, "TrungLuyenThatBai£¬Ê§È¥Ò»Ð©ÎïÆ·!!"
	else	
		tbLog:PlayerActionLog("Trïng luyÖn Tö M·ng","³É¹¦É¾³ýTrang bÞ", strEquipName, nEquipID, 1, SubWorld)
		return 1
	end	
end

function OnCancel()
end