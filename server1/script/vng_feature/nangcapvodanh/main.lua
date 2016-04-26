Include("\\script\\vng_feature\\nangcapvodanh\\ringtable.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbVnRingUpgrade = {}--tbActivityCompose:new()
tbVnRingDowngrade = {}
tbVnRingRefine = {}
function tbVnRingUpgrade:SelectRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("升级 %s", strRingName), tbVnRingUpgrade.UpgradeSelectedRing, {tbVnRingUpgrade, strRingType}},
		{format("降级 %s", strRingName), tbVnRingDowngrade.SelectLevel, {tbVnRingDowngrade, strRingType}},
		{format("重练 %s", strRingName), tbVnRingRefine.SelectLevel, {tbVnRingRefine, strRingType}},
		{"放弃"},
	}
	CreateNewSayEx("阁下需要什么 ", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("升级为 %s 1级", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 1}},
		{format("升级为 %s 2级", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 2}},
		{format("升级为 %s 3级", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 3}},
		{format("升级为 %s 4级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 4}},
		{format("升级为 %s 5级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 5}},
		{format("升级为 %s 6级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 6}},
--		{format("升级为 %s 7级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 7}},
--		{format("升级为 %s 8级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 8}},
--		{format("升级为 %s 9级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 9}},
--		{format("升级为 %s 10级", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 10}},
		{"放弃"},
	}
	CreateNewSayEx("阁下需要什么", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing1(strRingType, nLevel)
	if nLevel < 1 or nLevel > 3 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, 0, 0)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "升级"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"抗火", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,1}},
		{"抗冰", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,2}},
		{"抗雷", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,3}},
		{"抗毒", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,4}},
		{"物理防守", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,5}},
		{"放弃"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("升级戒指 <color=yellow>%s<color> 成 <color=yellow>%d<color>  允许保留戒指的抗性和效应，请阁下选择目前戒指已有的抗性和效应。", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("升级戒指 <color=yellow>%s<color> 成 <color=yellow>%d<color> 允许阁下随意选择自己戒指的抗性和效应，请选择抗性:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:SelectOption2(strRingType, nLevel, nOption1)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"中毒时间", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 1}},
		{"晕眩时间", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 2}},
		{"变慢时间", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 3}},		
		{"放弃"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("升级戒指 <color=yellow>%s<color> 成 <color=yellow>%d<color>  允许保留戒指的抗性和效应，请阁下选择目前戒指已有的抗性和效应 ", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("升级戒指 <color=yellow>%s<color> 成 <color=yellow>%d<color>  允许阁下随意选择自己戒指的抗性和效应，请选择抗性:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"确定制造", tbVnRingUpgrade.UpgradeSelectedRing2, {tbVnRingUpgrade, strRingType, nLevel, nOption1, nOption2}},	
		{"我想重新选择", tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, nLevel}},		
		{"放弃"},
	}
	CreateNewSayEx(format("阁下已选择升级为戒指<color=yellow>%s<color>  级<color=yellow>%d<color>  <color=yellow>%s - %s<color>, 你想马上制造吗?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing2(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 3 or nLevel > 6 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "升级"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
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

--降级戒指
function tbVnRingDowngrade:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("我有的戒指级别为%d", 4), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 4}},
		{format("我有的戒指级别为%d", 5), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 5}},
		{format("我有的戒指级别为%d", 6), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 6}},
--		{format("我有的戒指级别为%d", 7), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 7}},
--		{format("我有的戒指级别为%d", 8), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 8}},
--		{format("我有的戒指级别为%d", 9), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 9}},
--		{format("我有的戒指级别为%d", 10), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 10}},
		{"放弃"},
	}
	CreateNewSayEx("降级戒指功能<color=yellow>[精致] 无名<color> 帮阁下去除所有戒指的抗性和效应<color=yellow>[精致]<color> 4级以上做回3级，从此阁下可以用升级功能来选择自己戒指的抗性和效应。 要想降级成功，首先我需要知道你戒指的属性怎么样?", tbOpt)
end

function tbVnRingDowngrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 5}},
		{"放弃"},
	}
	CreateNewSayEx(format("降级戒指 <color=yellow>%s<color> 级<color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingDowngrade:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 3}},		
		{"重新选择抗性", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},
		{"放弃"},
	}
	CreateNewSayEx(format("降级戒指 <color=yellow>%s<color> 级<color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingDowngrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"确认降级", tbVnRingDowngrade.DowngradeSelectedRing, {tbVnRingDowngrade, strRingType, nLevel, nOption1, nOption2}},	
		{"我想重新选择", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},		
		{"放弃"},
	}
	CreateNewSayEx(format("阁下已选择降级戒指 <color=yellow>%s<color>  级<color=yellow>%d<color>  <color=yellow>%s - %s<color>, 你想我马上做吗?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
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

--重练戒指
function tbVnRingRefine:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("我有的戒指级别为%d", 4), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 4}},
		{format("我有的戒指级别为%d", 5), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 5}},
		{format("我有的戒指级别为%d", 6), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 6}},
--		{format("我有的戒指级别为%d", 7), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 7}},
--		{format("我有的戒指级别为%d", 8), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 8}},
--		{format("我有的戒指级别为%d", 9), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 9}},
--		{format("我有的戒指级别为%d", 10), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 10}},
		{"放弃"},
	}
	CreateNewSayEx("我可以帮阁下增强戒指指数<color=yellow>[精致] 无名<color>  而且通过重练功能，还能保持目前的抗属性. 要想降级成功，首先我需要知道你戒指的属性怎么样?", tbOpt)
end

function tbVnRingRefine:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 5}},
		{"放弃"},
	}
	CreateNewSayEx(format("重练戒指 <color=yellow>%s<color> 级<color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingRefine:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 3}},		
		{"重新选择抗性", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},
		{"放弃"},
	}
	CreateNewSayEx(format("重练戒指 <color=yellow>%s<color> 级<color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingRefine:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"确认重练", tbVnRingRefine.RefineSelectedRing, {tbVnRingRefine, strRingType, nLevel, nOption1, nOption2}},	
		{"我想重新选择", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},		
		{"放弃"},
	}
	CreateNewSayEx(format("阁下已选择重练戒指 <color=yellow>%s<color>  级<color=yellow>%d<color>  <color=yellow>%s - %s<color>, 你想我马上做吗?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
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
		{"[精致] 无名指环", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhChiHoan"}},
		{"[精致] 无名戒指", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhGioiChi"}},
		{"[精致] 乾坤戒指", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "CanKhonGioiChi"}},
		{"放弃"},
	}
	local msg = "我可以帮阁下升级, 降级, 重练 各种戒指<color=yellow>[精致]无名<color>, 首先你要选择戒指种类?"
	CreateNewSayEx(msg, tbOpt)
end
pEventType:Reg("神秘工匠", "关系到无名戒指", tbVnRingUpgrade.MainDialog, {tbVnRingUpgrade});