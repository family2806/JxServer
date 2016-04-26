Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
Include("\\script\\event\\equip_publish\\jinwu\\zimang_name.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
tbItem2Jinwu = tbActivityCompose:new()

function tbItem2Jinwu:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	
	-- ��ȡ�ɹ���
	local nSuccessRate = 0	
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		if nSR > v.nMaxSuccessRate then
			nSR = v.nMaxSuccessRate
		end
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2Jinwu:Compose(nComposeCount, nProductId)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbAdditive = self.tbFormula.tbAdditive
	if not tbProduct then
		return 
	end
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- ��鱳���ռ�
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ���������ĲƲ���ȫ, ������� %d %dx%d ����", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- ����ɹ���
	local nSuccessRate = self:GetSuccessRate()	
	
	-- �������Ƿ����
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>�������Ĳ��ϲ���!<color>"
		Talk(1, "", szMsg)
		print("CheckMaterial value ~= 1")
		return 0;
	end	
	
	--��������ʯ = ����װ��
	local nMatId = tbProduct.tbProp[2] - 230
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{szName = strZimangName, tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>����<color=yellow>%s<color=red>Ҫ��<color=yellow>%s<color=red> ��������!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- ��Ϻϳɱ������ĵ���Ʒ
	local tbBMaterial = self.tbFormula.tbBMaterial
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  ÿ�ζ����»�ȡ���Է�ֹ�б仯
	local nMapCount = 0;
	tbMaterialEx = {}
	for i = 1, getn(tbAdditive) do
		local nn = self:CalcItemCount(tbRoomItems, tbAdditive[i])
		if nn * tbAdditive[i].nSuccessRate > tbAdditive[i].nMaxSuccessRate then
			nn = tbAdditive[i].nMaxSuccessRate / tbAdditive[i].nSuccessRate
		end 
		if i == 1 then
			nMapCount = nn
			if nn == 0 then
				local szMsg = self.tbFormula.szFailMsg or "<color=red>�������Ĳ��ϲ���!<color>"
				Talk(1, "", szMsg)
				print("CalcItemCount")
				return 0;			
			end
			nn = floor((nn+1)/2)
			nMapCount = nMapCount - nn 
		end
		
		if nn > 0 then
			local tbM = {szName = tbAdditive[i].szName, tbProp = tbAdditive[i].tbProp, nCount = nn}
			tinsert(tbMaterialEx, tbM)	
		end		
	end	
	
	-- �۳��ϳɱ������ĵ���Ʒ
	if self:ConsumeMaterial(tbBMaterial, nComposeCount, self.szLogTitle) ~= 1 or 
			self:ConsumeMaterial(tbMaterialEx, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("����ʧ��, һ���ֲ��϶�ʧ��.")
		return 0;
	end	
	
		-- �۳��ϳɳɹ���۳�����Ʒ
	local tbMEx = self.tbFormula.tbAdditiveEx
	if tbMEx[1] then 
		tbMEx[1].nCount = nMapCount
	end
	
	self:ConsumeMaterial(tbMEx, nComposeCount, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("���ϧ����ʧ��")
		%tbVngTransLog:Write("201110_CheTaoKimO/", 15, "CheTaoKimO", "N/A", 0)
		return 0
	end

	if self:ConsumeMaterial(tbVnMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("����ʧ��, һ���ֲ��϶�ʧ��.")
		return 0;
	end

	if type(tbProduct) == "table" then
	--	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		local tbTranslog = {strFolder = "201110_CheTaoKimO/", nPromID = 15, nResult = 1}
		tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle, "CheTaoKimO", tbTranslog})
	--	AddStatData("zimang_jx1hechengzongshu", 1)	--��������һ��
	end

	return 1;
end

function tbItem2Jinwu:GiveUIOk(nComposeCount, nProductId, nCount)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	--��������ʯ = ����װ��
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local nMatId = tbProduct.tbProp[2] - 230	
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>����<color=yellow>%s<color=red>Ҫ��<color=yellow>%s<color=red> ��������!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- �������Ƿ����
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>�������Ĳ��ϲ���!<color>"
		Talk(1, "", szMsg)
		print("GiveUIOk check material fail")
		return 0;
	end	
	
	local nSuccessRate = self:GetSuccessRate()
	local msg = "�ϳɽ���װ����Ҫ��1��������, 5�����ʯ, 4����¶ʯ, 3�Ų���ʯ, 2����Գʯ, 1���������1��������װ��������������ϵ���Ӧ����çװ��, Ҫ������Ҫ��1����Ӧ�Ľ���ͼ��, 5ǧ������, ������Ҫ��Ҫ���ӳɹ��ʵĲ���."
	local szMsg = format("%s, ����������ԭ�������ɹ�����%d%%, ��Ҫ����������?", msg, nSuccessRate)
	local tbOpt = 
	{
		{"��������", self.Compose, {self, nComposeCount, nProductId}},
		{"�ٷ�һ��", self.ComposeGiveUI, {self, nComposeCount, nProductId}},
		{"ȡ��"},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Jinwu:ComposeGiveUI(nComposeCount, nProductId)
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("����%s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self, nComposeCount, nProductId}}, nil, self.bAccessBindItem)
end

function tbItem2Jinwu:SelectEquip(nId, nCount)
	
	local tbProduct = self.tbFormula.tbProduct
	local msg = "�ϳɽ���װ����Ҫ��1��������, 5�����ʯ, 4����¶ʯ, 3�Ų���ʯ, 2����Գʯ, 1��������,��1��������װ��������������ϵ���Ӧ����çװ��, Ҫ������Ҫ��1����Ӧ�Ľ���ͼ��, 5ǧ������, ������Ҫ��Ҫ���ӳɹ��ʵĲ���."

	local szMsg = format("%s,ѡһ�� %s", msg, tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.ComposeGiveUI, {self, 1, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"��һҳ", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"��һҳ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"ȡ��"})
	CreateNewSayEx(szMsg, tbOpt)
end


tbCommonMaterial = 
{
	{szName="���ڽ���", tbProp={6, 1, 3001}, nCount = 1},
	{szName="���ʯ", tbProp={6, 1, 2710}, nCount = 5},
	{szName="��¶ʯ", tbProp={6, 1, 2711}, nCount = 4},
	{szName="����ʯ", tbProp={6, 1, 2712}, nCount = 3},
	{szName="��Գʯ", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="����ʯ", tbProp={6, 1, 3000}, nCount = 1},
	{szName="������", tbProp={6, 1, 2349}, nCount = 1},	
	{szName=" ��", nJxb=1, nCount = 50000000},	
}

tbBaseMaterial = 
{
	{szName="���ڽ���", tbProp={6, 1, 3001}, nCount = 1},
	{szName="���ʯ", tbProp={6, 1, 2710}, nCount = 5},
	{szName="��¶ʯ", tbProp={6, 1, 2711}, nCount = 4},
	{szName="����ʯ", tbProp={6, 1, 2712}, nCount = 3},
	{szName="��Գʯ", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="����ʯ", tbProp={6, 1, 3000}, nCount = 1},
	{szName=" ��", nJxb=1, nCount = 50000000},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "��������ͼ��", tbProp = {6,1,2987}, nSuccessRate = 10, nMaxSuccessRate = 80},
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
			},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "��������ͼ��", tbProp = {6,1,2987}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "���ڿ�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "���ڿ�ͼ��", tbProp = {6,1,2982}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "���ڿ�ͼ��", tbProp = {6,1,2982}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "�����Ͻ�ָ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�����Ͻ�ͼ��", tbProp = {6,1,2989}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�����Ͻ�ͼ��", tbProp = {6,1,2989}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "���ڻ���",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "���ڻ���ͼ��", tbProp = {6,1,2986}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "���ڻ���ͼ��", tbProp = {6,1,2986}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "��������ͼ��", tbProp = {6,1,2985}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "��������ͼ��", tbProp = {6,1,2985}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "�����·�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "������ͼ��", tbProp = {6,1,2983}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "������ͼ��", tbProp = {6,1,2983}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "��������ͼ��", tbProp = {6,1,2991}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "��������ͼ��", tbProp = {6,1,2991}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "����Ь",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "����Ьͼ��", tbProp = {6,1,2984}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "����Ьͼ��", tbProp = {6,1,2984}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "������ͼ��", tbProp = {6,1,2988}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "������ͼ��", tbProp = {6,1,2988}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "�����½�ָ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�����½�ͼ��", tbProp = {6,1,2990}, nSuccessRate = 10, nMaxSuccessRate = 80},		
					{szName = "��֮��", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "���֮��", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "����֮��", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},		
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�����½�ͼ��", tbProp = {6,1,2990}, nCount = 1},
				  {szName="������", tbProp={6, 1, 2349}, nCount = 1},			
		},				

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

--for i=1, getn(tbFormulaList) do
--	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
--	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
--	
--	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
--	
--	local szOpt = format("����%s", tbFormulaList[i].tbProduct.szName)
--	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
--end
--tinsert(tbOpt, {"ȡ��"})

for i=1, getn(tbFormulaList) do
	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
	
	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("����%s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbOpt, {"ȡ��"})

local msg = "�ϳɽ���װ����Ҫ��1��������, 5�����ʯ, 4����¶ʯ, 3�Ų���ʯ, 2����Գʯ, 1���������1��������װ��������������ϵ���Ӧ����çװ��, Ҫ������Ҫ��1����Ӧ�Ľ���ͼ��, 5ǧ������, ������Ҫ��Ҫ���ӳɹ��ʵĲ���."
nItem2EquipRegId = pEventType:Reg("��������", "�������װ��", CreateNewSayEx, {format("%s, ѡ������Ҫ�����װ��:", msg), tbOpt})

