Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\zimang\\equiptable.lua")
tbItem2Equip = tbActivityCompose:new()

function tbItem2Equip:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nCount = self:CalcItemCount(tbRoomItems, tbAdditive)
	
	local nSuccessRate = nCount * tbAdditive.nSuccessRate
	if nSuccessRate > tbAdditive.nMaxSuccessRate then
		nSuccessRate = tbAdditive.nMaxSuccessRate
	end
	return nSuccessRate, nCount
end

function tbItem2Equip:ConsumeAdditive(nCount)
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  ÿ�ζ����»�ȡ���Է�ֹ�б仯
	
	if self:ConsumeItem(tbRoomItems, nCount, tbAdditive) ~= 1 then
		return
	end
	self:ConsumeLog(nCount.." "..tbAdditive.szName, self.szLogTitle)
	return 1
end


function tbItem2Equip:Compose(nComposeCount, nProductId)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	if not tbProduct then
		return 
	end
	
	nComposeCount = nComposeCount or 1
	
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ���������ĲƲ���ȫ, ������� %d %dx%d ����", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>�������Ĳ��ϲ���!<!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("����ʧ��, ��ʧ������Ʒ.")
		return 0;
	end
	
	
	
	if self:ConsumeAdditive(nAdditiveCount) ~= 1 then
		Msg2Player("����ʧ��, ��ʧ������Ʒ.")
		return 0;
	end
	
	if random(1, 100) > nSuccessRate then
		Msg2Player("���ϧ����ʧ��")
		return 0
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		AddStatData("zimang_jx1hechengzongshu", 1)	--��������һ��
	end

	return 1;
end

function tbItem2Equip:GiveUIOk(nCount)
	if nCount < getn(self.tbFormula.tbMaterial) then
		return Talk(1, "", self.tbFormula.szFailMsg or "<color=red>����������Ʒ����!<color>")
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	local szMsg = format("���ѷ��� %d �� %s, �ɹ�����%d%%, Ҫ����������?", nAdditiveCount, self.tbFormula.tbAdditive.szName, nSuccessRate)
	local tbOpt = 
	{
		{"��������", self.SelectEquip, {self, 1, 5}},
		{"�ٷ�һ��", self.ComposeGiveUI, {self}},
		{"ȡ��"},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Equip:SelectEquip(nId, nCount)
	
	if self:CheckMaterial(self.tbFormula.tbMaterial, 1) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>����������Ʒ����!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	local tbProduct = self.tbFormula.tbProduct
	local szMsg = format("ѡһ�� %s", tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.Compose, {self, 1, i}})
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
	{szName="��������", tbProp={6, 1, 2765}, nCount = 1},
	{szName="���ʯ", tbProp={6, 1, 2710}, nCount = 4},
	{szName="��¶ʯ", tbProp={6, 1, 2711}, nCount = 3},
	{szName="����ʯ", tbProp={6, 1, 2712}, nCount = 2},
	{szName="��Գʯ", tbProp={6, 1, 2713}, nCount = 1},
	{szName="������", tbProp={6, 1, 2350}, nCount = 1},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "������ͼ��", tbProp = {6,1,2714}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{
		szName = "������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "������ͼ��", tbProp = {6,1,2715}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[3] = 
	{
		szName = "����Ь",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "����Ьͼ��", tbProp = {6,1,2716}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "��������ͼ��", tbProp = {6,1,2717}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "��������ͼ��", tbProp = {6,1,2718}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "��������ͼ��", tbProp = {6,1,2719}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "������ͼ��", tbProp = {6,1,2720}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[8] = 
	{
		szName = "�����Ͻ�ָ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�����Ͻ�ָ", tbProp = {6,1,2721}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "�����½�ָ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�����½�ָͼ��",tbProp = {6,1,2722}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "��������",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "��������ͼ��", tbProp = {6,1,2723}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

for i=1, getn(tbFormulaList) do
	tbEquip_zimang[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_zimang[i]
	
	local p = tbItem2Equip:new(tbFormulaList[i], "Item2Equip", INVENTORY_ROOM.room_giveitem)
	p.bAccessBindItem = 1
	local szOpt = format("���� %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbOpt, {"ȡ��"})
nItem2EquipRegId = pEventType:Reg("��������", "��������װ��", CreateNewSayEx, {"ѡ��Ҫ�����װ��", tbOpt})

--?gm ds Include[[\script\event\equip_publish\zimang\item2equip.lua]]
--?gm ds Include[[\script\lib\awardtemplet.lua]]
--?gm ds tbAwardTemplet.GiveAwardByList(tbAwardTemplet,tbCommonMaterial, tbItem)