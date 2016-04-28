Include("\\script\\vng_feature\\nangcapvodanh\\ringtable.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbVnRingUpgrade = {}--tbActivityCompose:new()
tbVnRingDowngrade = {}
tbVnRingRefine = {}
function tbVnRingUpgrade:SelectRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("N©ng c p %s", strRingName), tbVnRingUpgrade.UpgradeSelectedRing, {tbVnRingUpgrade, strRingType}},
		{format("Hπ c p %s", strRingName), tbVnRingDowngrade.SelectLevel, {tbVnRingDowngrade, strRingType}},
		{format("TrÔng luy÷n %s", strRingName), tbVnRingRefine.SelectLevel, {tbVnRingRefine, strRingType}},
		{"HÒy b·"},
	}
	CreateNewSayEx("C∏c hπ c«n g◊?", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("N©ng c p l™n %s c p 1", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 1}},
		{format("N©ng c p l™n %s c p 2", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 2}},
		{format("N©ng c p l™n %s c p 3", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 3}},
		{format("N©ng c p l™n %s c p 4", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 4}},
		{format("N©ng c p l™n %s c p 5", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 5}},
		{format("N©ng c p l™n %s c p 6", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 6}},
--		{format("N©ng c p l™n %s c p 7", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 7}},
--		{format("N©ng c p l™n %s c p 8", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 8}},
--		{format("N©ng c p l™n %s c p 9", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 9}},
--		{format("N©ng c p l™n %s c p 10", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 10}},
		{"HÒy b·"},
	}
	CreateNewSayEx("C∏c hπ c«n g◊?", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing1(strRingType, nLevel)
	if nLevel < 1 or nLevel > 3 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, 0, 0)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "NangCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"Kh∏ng H·a", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,1}},
		{"Kh∏ng B®ng", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,2}},
		{"Kh∏ng L´i", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,3}},
		{"Kh∏ng ßÈc", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,4}},
		{"Phﬂng ThÒ VÀt L˝", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,5}},
		{"HÒy b·"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("NangCapΩ‰÷∏ <color=yellow>%s<color> ≥… <color=yellow>%d<color>  ‘ –Ì±£¡ÙΩ‰÷∏µƒøπ–‘∫Õ–ß”¶£¨«Î∏Ûœ¬—°‘Òƒø«∞Ω‰÷∏“—”–µƒøπ–‘∫Õ–ß”¶°£", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("NangCapΩ‰÷∏ <color=yellow>%s<color> ≥… <color=yellow>%d<color> ‘ –Ì∏Ûœ¬ÀÊ“‚—°‘Ò◊‘º∫Ω‰÷∏µƒøπ–‘∫Õ–ß”¶£¨«Î—°‘Òøπ–‘:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:SelectOption2(strRingType, nLevel, nOption1)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"ThÍi Gian TrÛng ßÈc", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 1}},
		{"ThÍi Gian Cho∏ng", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 2}},
		{"ThÍi Gian Lµm ChÀm", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 3}},		
		{"HÒy b·"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("NangCapΩ‰÷∏ <color=yellow>%s<color> ≥… <color=yellow>%d<color>  ‘ –Ì±£¡ÙΩ‰÷∏µƒøπ–‘∫Õ–ß”¶£¨«Î∏Ûœ¬—°‘Òƒø«∞Ω‰÷∏“—”–µƒøπ–‘∫Õ–ß”¶ ", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("NangCapΩ‰÷∏ <color=yellow>%s<color> ≥… <color=yellow>%d<color>  ‘ –Ì∏Ûœ¬ÀÊ“‚—°‘Ò◊‘º∫Ω‰÷∏µƒøπ–‘∫Õ–ß”¶£¨«Î—°‘Òøπ–‘:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X∏c nhÀn ch’ tπo", tbVnRingUpgrade.UpgradeSelectedRing2, {tbVnRingUpgrade, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta muËn ch‰n lπi", tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, nLevel}},		
		{"HÒy b·"},
	}
	CreateNewSayEx(format("∏Ûœ¬“——°‘ÒNangCapŒ™Ω‰÷∏<color=yellow>%s<color>  º∂<color=yellow>%d<color>  <color=yellow>%s - %s<color>, ƒ„œÎ¬Ì…œ÷∆‘Ï¬?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing2(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 3 or nLevel > 6 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "NangCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local nOpt1, nOpt2
	if nLevel > 0 and nLevel <= 3 then
		nOpt1 = 0
		nOpt2 = 0
	else
		nOpt1 = nFirstOpt
		nOpt2 = nSecondOpt
	end
	if not tbUnnamedRing[strRingType] or not tbUnnamedRing[strRingType][nLevel] or not tbUnnamedRing[strRingType][nLevel][nOpt1] or not tbUnnamedRing[strRingType][nLevel][nOpt1][nOpt2] then
		error("upgrade ring - cannot get ring info")
		return
	end
	local tbRing = tbUnnamedRing[strRingType][nLevel]
	local tbRing1 = tbRing[nOpt1][nOpt2]	
	local tbMat = {}	
	for i =1, getn(tbRing.tbCommonMaterial) do
		tinsert(tbMat, tbRing.tbCommonMaterial[i])
	end
	for i = 1, getn(tbRing1.tbMaterial) do
		tinsert(tbMat, tbRing1.tbMaterial[i])
	end	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbRing1.tbProduct,	
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	return tbFormula
end

--Ωµº∂Ω‰÷∏
function tbVnRingDowngrade:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("Ta c„ nh…n c p %d", 4), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 4}},
		{format("Ta c„ nh…n c p %d", 5), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 5}},
		{format("Ta c„ nh…n c p %d", 6), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 6}},
--		{format("Ta c„ nh…n c p %d", 7), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 7}},
--		{format("Ta c„ nh…n c p %d", 8), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 8}},
--		{format("Ta c„ nh…n c p %d", 9), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 9}},
--		{format("Ta c„ nh…n c p %d", 10), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 10}},
		{"HÒy b·"},
	}
	CreateNewSayEx("Ωµº∂Ω‰÷∏π¶ƒ‹<color=yellow>[æ´÷¬] Œﬁ√˚<color> ∞Ô∏Ûœ¬»•≥˝À˘”–Ω‰÷∏µƒøπ–‘∫Õ–ß”¶<color=yellow>[æ´÷¬]<color> 4º∂“‘…œ◊ˆªÿ3º∂£¨¥”¥À∏Ûœ¬ø…“‘”√NangCapπ¶ƒ‹¿¥—°‘Ò◊‘º∫Ω‰÷∏µƒøπ–‘∫Õ–ß”¶°£ “™œÎΩµº∂≥…π¶£¨ ◊œ»Œ“–Ë“™÷™µ¿ƒ„Ω‰÷∏µƒ Ù–‘‘ı√¥—˘?", tbOpt)
end

function tbVnRingDowngrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 5}},
		{"HÒy b·"},
	}
	CreateNewSayEx(format("Hπ c p nh…n <color=yellow>%s<color> c p <color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingDowngrade:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 3}},		
		{"Ch‰n lπi kh∏ng t›nh", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},
		{"HÒy b·"},
	}
	CreateNewSayEx(format("Hπ c p nh…n <color=yellow>%s<color> c p <color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingDowngrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X∏c nhÀn hπ c p", tbVnRingDowngrade.DowngradeSelectedRing, {tbVnRingDowngrade, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta muËn ch‰n lπi", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},		
		{"HÒy b·"},
	}
	CreateNewSayEx(format("C∏c hπ Æ∑ l˘a ch‰n hπ c p nh…n <color=yellow>%s<color>  c p <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng≠¨i c„ muËn ta lµm ngay kh´ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingDowngrade:DowngradeSelectedRing(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 4 or nLevel > 6 then
		error("downgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "HaCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingDowngrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbFormula = tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)	
	local tbMat = {}
	--ring material	
	tinsert(tbMat, tbFormula.tbProduct)		
	
	--other material
	local tbRing = tbUnnamedRing[strRingType]
	for i =1, getn(tbRing.tbDowngradeMaterial) do
		tinsert(tbMat, tbRing.tbDowngradeMaterial[i])
	end
	local tbFormula2 = {		
		tbMaterial = tbMat,
		tbProduct = tbRing[3][0][0].tbProduct,
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}	
	return tbFormula2
end

--÷ÿ¡∑Ω‰÷∏
function tbVnRingRefine:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("Ta c„ nh…n c p %d", 4), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 4}},
		{format("Ta c„ nh…n c p %d", 5), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 5}},
		{format("Ta c„ nh…n c p %d", 6), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 6}},
--		{format("Ta c„ nh…n c p %d", 7), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 7}},
--		{format("Ta c„ nh…n c p %d", 8), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 8}},
--		{format("Ta c„ nh…n c p %d", 9), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 9}},
--		{format("Ta c„ nh…n c p %d", 10), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 10}},
		{"HÒy b·"},
	}
	CreateNewSayEx("Ta c„ th” giÛp c∏c hπ t®ng c≠Íng c∏c chÿ sË cÒa nh…n <color=yellow>[Tinh X∂o] V´ Danh<color>  mµ v…n gi˜ nguy™n kh∏ng vµ thuÈc t›nh hi÷n c„ th´ng qua ch¯c n®ng trÔng luy÷n . ß” vi÷c hπ c p Æ≠Óc thµnh c´ng, tr≠Ìc ti™n ta c«n bi’t thuÈc t›nh cÒa nh…n c∏c hπ nh≠ th’ nµo?", tbOpt)
end

function tbVnRingRefine:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 5}},
		{"HÒy b·"},
	}
	CreateNewSayEx(format("TrÔng luy÷n nh…n <color=yellow>%s<color> c p <color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingRefine:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 3}},		
		{"Ch‰n lπi kh∏ng t›nh", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},
		{"HÒy b·"},
	}
	CreateNewSayEx(format("TrÔng luy÷n nh…n <color=yellow>%s<color> c p <color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingRefine:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X∏c nhÀn trÔng luy÷n", tbVnRingRefine.RefineSelectedRing, {tbVnRingRefine, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta muËn ch‰n lπi", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},		
		{"HÒy b·"},
	}
	CreateNewSayEx(format("C∏c hπ Æ∑ l˘a ch‰n trÔng luy÷n nh…n <color=yellow>%s<color>  c p <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng≠¨i c„ muËn ta lµm ngay kh´ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingRefine:RefineSelectedRing(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 4 or nLevel > 6 then
		error("refine ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "TrungLuyen"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingRefine:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbFormula = tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)	
	local tbMat = {}
	--ring material	
	tinsert(tbMat, tbFormula.tbProduct)		
	
	--other material
	local tbRing = tbUnnamedRing[strRingType]
	for i =1, getn(tbRing.tbRefineMaterial) do
		tinsert(tbMat, tbRing.tbRefineMaterial[i])
	end
	local tbFormula2 = {		
		tbMaterial = tbMat,
		tbProduct = tbFormula.tbProduct,
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}	
	return tbFormula2
end

function tbVnRingUpgrade:MainDialog()
	local tbOpt = {
		{"[Tinh X∂o] V´ Danh Chÿ Hoµn", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhChiHoan"}},
		{"[Tinh X∂o] V´ Danh GiÌi Chÿ", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhGioiChi"}},
		{"[Tinh X∂o] Cµn Kh´n GiÌi Chÿ", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "CanKhonGioiChi"}},
		{"HÒy b·"},
	}
	local msg = "Œ“ø…“‘∞Ô∏Ûœ¬NangCap, Ωµº∂, ÷ÿ¡∑ ∏˜÷÷Ω‰÷∏<color=yellow>[æ´÷¬]Œﬁ√˚<color>,  ◊œ»ƒ„“™—°‘ÒΩ‰÷∏÷÷¿‡?"
	CreateNewSayEx(msg, tbOpt)
end
pEventType:Reg("ThÓ rÃn th«n b›", "Li™n quan Æ’n nh…n V´ Danh", tbVnRingUpgrade.MainDialog, {tbVnRingUpgrade});