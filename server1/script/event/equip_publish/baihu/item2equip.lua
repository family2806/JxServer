Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
Include("\\script\\event\\equip_publish\\baihu\\equiptable.lua")

IncludeLib("ITEM")
tbItem2BaiHu = tbActivityCompose:new()
tbItem2BaiHu.bAccessBindItem = 0
MSG_COMPOSE_TITLE = "�ϳ�һ�װ׻�װ����Ҫ1���׻�����, 3����Գʯ��1������ʯ��1���׻������1�Ŷ�Ӧ�İ׻�ͼ�׺ͽ���װ����2������1��9���������Լ�������߳ɹ����ʵ���Ʒ"

CommonMaterial = 
{
	{szName="�׻�����", tbProp={6, 1, 3183}, nCount = 1},
	{szName="��Գʯ", tbProp={6, 1, 2713}, nCount = 3},
	{szName="����ʯ", tbProp={6, 1, 3000}, nCount = 2},
	{szName="�׻���", tbProp={6, 1, 2357}, nCount = 1},	
	{szName="9��������ʯ", tbProp={6, 1, 147, 9}, nCount = 1},
	{szName=" ��", nJxb=1, nCount = 200000000},
	
}

AdditiveMaterial =
{
	{szName = "�׻���ʯ", tbProp = {6,1,3184}, nSuccessRate = 1, nMaxSuccessRate = 9},
	{szName = "�׻���ʯ", tbProp = {6,1,3185}, nSuccessRate = 2, nMaxSuccessRate = 18},
	{szName = "�׻���ʯ", tbProp = {6,1,3186}, nSuccessRate = 5, nMaxSuccessRate = 45},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "�׻�����",
		tbSpecialMaterial = 
		{
			{szName = "�׻�����ͼ��", tbProp = {6,1,3178}, nSuccessRate = 10, nMaxSuccessRate = 80},
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "�׻���",
		tbSpecialMaterial = 
		{
			{szName = "�׻���ͼ��", tbProp = {6,1,3173}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "�׻��Ͻ�",
		tbSpecialMaterial = 
		{
			{szName = "�׻��Ͻ�ͼ��", tbProp = {6,1,3180}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "�׻�����",
		tbSpecialMaterial = 
		{
			{szName = "�׻�����ͼ��", tbProp = {6,1,3177}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "�׻�����",
		tbSpecialMaterial = 
		{
			{szName = "�׻�����ͼ��", tbProp = {6,1,3176}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "�׻���",
		tbSpecialMaterial = 
		{
			{szName = "�׻���ͼ��", tbProp = {6,1,3174}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "�׻�����",
		tbSpecialMaterial = 
		{
			{szName = "�׻�����ͼ��",tbProp = {6,1,3182}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "�׻�Ь",
		tbSpecialMaterial = 
		{
			{szName = "�׻�Ьͼ��", tbProp = {6,1,3175}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},			
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "�׻���",
		tbSpecialMaterial = 
		{
			{szName = "�׻���ͼ��", tbProp = {6,1,3179}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "�׻��½�",
		tbSpecialMaterial = 
		{
			{szName = "�׻��½�ͼ��", tbProp = {6,1,3181}, nSuccessRate = 10, nMaxSuccessRate = 80},		
		},		

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


function tbItem2BaiHu:GetComposeRate()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nRate = self:CalcRate(%AdditiveMaterial ,tbRoomItems)
	local tbSpecialMaterial = self.tbFormula.tbSpecialMaterial
	nRate = nRate + self:CalcRate(tbSpecialMaterial ,tbRoomItems)
	return nRate
end

function tbItem2BaiHu:CalcRate(tbAdditive, tbRoomItems)	
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

function tbItem2BaiHu:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local tbRecItem = self:MakeItem(nItemIndex)
	if tbRecItem.nQuality == 1 then
		if GetItemBindState(nItemIndex) ~= 0 then
			return
		end
		if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
			return
		end
		local nG = GetItemProp(nItemIndex)
		if nG == 7 then
			return
		end
	end
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
					return 
				end
			end
		end
	end	
	return 1
end
function tbItem2BaiHu:ConsumeAdditive(tbAdditive, szLogTitle)
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		local nMaxCount = floor(tbItem.nMaxSuccessRate / tbItem.nSuccessRate)
		if nCount > nMaxCount then
			nCount = nMaxCount
		end
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		end
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return 1;
end

function tbItem2BaiHu:Compose(nProductId)
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbGoldEquip	= self.tbFormula.tbGoldEquip[nProductId]
	local tbGoldEquipEx	= self.tbFormula.tbGoldEquipEx[nProductId]
	
	if not tbProduct then
		return 
	end
	
	-- ��鱳���ռ�
	local nFreeItemCellLimit = 1
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ�������ĲƲ���ȫ, ������������ %d %dx%d �Ŀո�", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- ����ɹ���
	
	local nSuccessRate = self:GetComposeRate()
	
	-- �������Ƿ����
	local szFailMsg = "<color=red>�����Ĳ��ϲ���!<color>"
	if self:CheckMaterial(%CommonMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial(self.tbFormula.tbSpecialMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial({tbGoldEquip}, 1) ~=1 and self:CheckMaterial({tbGoldEquipEx}, 1) ~= 1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	
	
	self:ConsumeMaterial(%CommonMaterial, 1, self.szLogTitle)
	self:ConsumeAdditive(self.tbFormula.tbSpecialMaterial, self.szLogTitle)
	self:ConsumeAdditive(%AdditiveMaterial, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("����ʧ���ˣ����ϧ")
		return 0
	end
	
	if self:ConsumeMaterial({tbGoldEquip}, 1, self.szLogTitle) ~= 1 then
		self:ConsumeMaterial({tbGoldEquipEx}, 1, self.szLogTitle)
	end
	
	tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle})

	return 1;
end

function tbItem2BaiHu:GiveUIOk(nCount)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	-- �������Ƿ����
	
	local szFailMsg = "<color=red>�����Ĳ��ϲ���!<color>"
	if self:CheckMaterial(%CommonMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial(self.tbFormula.tbSpecialMaterial, 1) ~=1 then
		Talk(2, "", szFailMsg, self.tbFormula.tbSpecialMaterial[1].szName)
		return 0;
	end
	
	local nSuccessRate = self:GetComposeRate()
	local szMsg = format("������ϳɹ��ļ����� d%%, ����Ҫ����������?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "�ɹ����ʳ���100%����˷Ѵ����Ĳ���, ��Ҫ����������?"
	end
	
	local tbOpt = 
	{
		{"��������", self.SelectEquip, {self, 1, 5}},
		{"�ٷ���һ��", self.ComposeGiveUI, {self}},
		{"����"},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2BaiHu:SelectEquip(nId, nCount)
	
	local msg = %MSG_COMPOSE_TITLE
	local szMsg = format("%s,ѡ��1 %s", msg, self.tbFormula.szName)
	local nProductCount = getn(self.tbFormula.tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.Compose, {self, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"��һҳ", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"��һҳ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"����"})
	CreateNewSayEx(szMsg, tbOpt)
end

local tbDialogOpt = {}
function tbItem2BaiHu:ComposeGiveUI()
		
	local szTitle = format("�һ� %s", self.tbFormula.szName)
	local szContent = self:GetMaterialList(%CommonMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	szContent = format("%s<enter>%-20s  %s", szContent, "�׻�װ��", "1")
	szContent = format("%s<enter>%-20s  %s", szContent, "�׻�ͼ��", "1")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbItem2BaiHu:SelectParts()
	CreateNewSayEx(format("%s, ѡ����Ҫ�����װ��:", %MSG_COMPOSE_TITLE), %tbDialogOpt)
end

for i=1, getn(tbFormulaList) do
	tbFormulaList[i].tbProduct = tbEquip_BaiHu[i]
	tbFormulaList[i].tbGoldEquip = tbEquip_jinwu[i]
	tbFormulaList[i].tbGoldEquipEx = tbEquip_JinWuEx[i]
	
	local p = tbItem2BaiHu:new(tbFormulaList[i], "Item2BaiHu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("���� %s", tbFormulaList[i].szName)
	tinsert(tbDialogOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbDialogOpt, {"����"})

--��ʱ�ر�����׻����� - Modified By DinhHQ - 20120511
--pEventType:Reg("��������", "����׻�װ��", tbItem2BaiHu.SelectParts, {tbItem2BaiHu})

