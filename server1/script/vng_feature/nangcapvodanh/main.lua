Include("\\script\\vng_feature\\nangcapvodanh\\ringtable.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbVnRingUpgrade = {}--tbActivityCompose:new()
tbVnRingDowngrade = {}
tbVnRingRefine = {}
function tbVnRingUpgrade:SelectRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("���� %s", strRingName), tbVnRingUpgrade.UpgradeSelectedRing, {tbVnRingUpgrade, strRingType}},
		{format("���� %s", strRingName), tbVnRingDowngrade.SelectLevel, {tbVnRingDowngrade, strRingType}},
		{format("���� %s", strRingName), tbVnRingRefine.SelectLevel, {tbVnRingRefine, strRingType}},
		{"����"},
	}
	CreateNewSayEx("������Ҫʲô ", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("����Ϊ %s 1��", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 1}},
		{format("����Ϊ %s 2��", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 2}},
		{format("����Ϊ %s 3��", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 3}},
		{format("����Ϊ %s 4��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 4}},
		{format("����Ϊ %s 5��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 5}},
		{format("����Ϊ %s 6��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 6}},
--		{format("����Ϊ %s 7��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 7}},
--		{format("����Ϊ %s 8��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 8}},
--		{format("����Ϊ %s 9��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 9}},
--		{format("����Ϊ %s 10��", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 10}},
		{"����"},
	}
	CreateNewSayEx("������Ҫʲô", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing1(strRingType, nLevel)
	if nLevel < 1 or nLevel > 3 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, 0, 0)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "����"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"����", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,1}},
		{"����", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,2}},
		{"����", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,3}},
		{"����", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,4}},
		{"�������", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,5}},
		{"����"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("������ָ <color=yellow>%s<color> �� <color=yellow>%d<color>  ��������ָ�Ŀ��Ժ�ЧӦ�������ѡ��Ŀǰ��ָ���еĿ��Ժ�ЧӦ��", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("������ָ <color=yellow>%s<color> �� <color=yellow>%d<color> �����������ѡ���Լ���ָ�Ŀ��Ժ�ЧӦ����ѡ����:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:SelectOption2(strRingType, nLevel, nOption1)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"�ж�ʱ��", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 1}},
		{"��ѣʱ��", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 2}},
		{"����ʱ��", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 3}},		
		{"����"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("������ָ <color=yellow>%s<color> �� <color=yellow>%d<color>  ��������ָ�Ŀ��Ժ�ЧӦ�������ѡ��Ŀǰ��ָ���еĿ��Ժ�ЧӦ ", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("������ָ <color=yellow>%s<color> �� <color=yellow>%d<color>  �����������ѡ���Լ���ָ�Ŀ��Ժ�ЧӦ����ѡ����:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"ȷ������", tbVnRingUpgrade.UpgradeSelectedRing2, {tbVnRingUpgrade, strRingType, nLevel, nOption1, nOption2}},	
		{"��������ѡ��", tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, nLevel}},		
		{"����"},
	}
	CreateNewSayEx(format("������ѡ������Ϊ��ָ<color=yellow>%s<color>  ��<color=yellow>%d<color>  <color=yellow>%s - %s<color>, ��������������?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing2(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 3 or nLevel > 6 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "����"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
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

--������ָ
function tbVnRingDowngrade:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("���еĽ�ָ����Ϊ%d", 4), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 4}},
		{format("���еĽ�ָ����Ϊ%d", 5), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 5}},
		{format("���еĽ�ָ����Ϊ%d", 6), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 6}},
--		{format("���еĽ�ָ����Ϊ%d", 7), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 7}},
--		{format("���еĽ�ָ����Ϊ%d", 8), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 8}},
--		{format("���еĽ�ָ����Ϊ%d", 9), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 9}},
--		{format("���еĽ�ָ����Ϊ%d", 10), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 10}},
		{"����"},
	}
	CreateNewSayEx("������ָ����<color=yellow>[����] ����<color> �����ȥ�����н�ָ�Ŀ��Ժ�ЧӦ<color=yellow>[����]<color> 4����������3�����Ӵ˸��¿���������������ѡ���Լ���ָ�Ŀ��Ժ�ЧӦ�� Ҫ�뽵���ɹ�����������Ҫ֪�����ָ��������ô��?", tbOpt)
end

function tbVnRingDowngrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 5}},
		{"����"},
	}
	CreateNewSayEx(format("������ָ <color=yellow>%s<color> ��<color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingDowngrade:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 3}},		
		{"����ѡ����", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},
		{"����"},
	}
	CreateNewSayEx(format("������ָ <color=yellow>%s<color> ��<color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingDowngrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"ȷ�Ͻ���", tbVnRingDowngrade.DowngradeSelectedRing, {tbVnRingDowngrade, strRingType, nLevel, nOption1, nOption2}},	
		{"��������ѡ��", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},		
		{"����"},
	}
	CreateNewSayEx(format("������ѡ�񽵼���ָ <color=yellow>%s<color>  ��<color=yellow>%d<color>  <color=yellow>%s - %s<color>, ��������������?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
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

--������ָ
function tbVnRingRefine:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("���еĽ�ָ����Ϊ%d", 4), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 4}},
		{format("���еĽ�ָ����Ϊ%d", 5), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 5}},
		{format("���еĽ�ָ����Ϊ%d", 6), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 6}},
--		{format("���еĽ�ָ����Ϊ%d", 7), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 7}},
--		{format("���еĽ�ָ����Ϊ%d", 8), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 8}},
--		{format("���еĽ�ָ����Ϊ%d", 9), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 9}},
--		{format("���еĽ�ָ����Ϊ%d", 10), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 10}},
		{"����"},
	}
	CreateNewSayEx("�ҿ��԰������ǿ��ָָ��<color=yellow>[����] ����<color>  ����ͨ���������ܣ����ܱ���Ŀǰ�Ŀ�����. Ҫ�뽵���ɹ�����������Ҫ֪�����ָ��������ô��?", tbOpt)
end

function tbVnRingRefine:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 5}},
		{"����"},
	}
	CreateNewSayEx(format("������ָ <color=yellow>%s<color> ��<color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingRefine:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 3}},		
		{"����ѡ����", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},
		{"����"},
	}
	CreateNewSayEx(format("������ָ <color=yellow>%s<color> ��<color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingRefine:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"ȷ������", tbVnRingRefine.RefineSelectedRing, {tbVnRingRefine, strRingType, nLevel, nOption1, nOption2}},	
		{"��������ѡ��", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},		
		{"����"},
	}
	CreateNewSayEx(format("������ѡ��������ָ <color=yellow>%s<color>  ��<color=yellow>%d<color>  <color=yellow>%s - %s<color>, ��������������?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
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
		{"[����] ����ָ��", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhChiHoan"}},
		{"[����] ������ָ", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhGioiChi"}},
		{"[����] Ǭ����ָ", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "CanKhonGioiChi"}},
		{"����"},
	}
	local msg = "�ҿ��԰��������, ����, ���� ���ֽ�ָ<color=yellow>[����]����<color>, ������Ҫѡ���ָ����?"
	CreateNewSayEx(msg, tbOpt)
end
pEventType:Reg("���ع���", "��ϵ��������ָ", tbVnRingUpgrade.MainDialog, {tbVnRingUpgrade});