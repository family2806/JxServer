-- ��������װ��
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")


tbJinWuRefineEquip = tbActivityCompose:new()

tbJinWuRefineList = 
{
	[1]= {szName="��������", nStone = 1, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[2]= {szName="���ڿ�",   nStone = 2, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[3]= {szName="�����Ͻ�ָ",nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
	[4]= {szName="���ڻ���", nStone = 1, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[5]= {szName="��������", nStone = 2, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[6]= {szName="������",   nStone = 3, nWidth = 2, nHeight = 3, nFreeItemCellLimit = 1},
	[7]= {szName="��������", nStone = 4, nWidth = 2, nHeight = 4, nFreeItemCellLimit = 1},
	[8]= {szName="����Ь",   nStone = 3, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[9]= {szName="������",   nStone = 3, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[10]={szName="�����½�ָ", nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
}

function tbJinWuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "����װ��", "��������ʯ")
	local strDesc = format("   %-21s\t%d", "���ڿ�", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "������", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "����Ь", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "��������", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "���ڻ���", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "��������", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "��������", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "���ڽ�ָ",2)
	strDesc = strDesc..format("\n   %-21s\t%d", "��������",4)
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbJinWuRefineEquip:Compose(nComposeCount)
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- ȡ�ý�������ʯ������
  local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  ÿ�ζ����»�ȡ���Է�ֹ�б仯	
	local tbGoldEquip = nil
	local nEquType = 0		-- �������
	local nEqIndex = 0
	for i = 1, getn(tbRoomItems) do 
		nItemQuality = GetItemQuality(tbRoomItems[i])
		--�����ƷƷ��
		if nItemQuality == 1 then
			nEqIndex = GetGlodEqIndex(tbRoomItems[i])
			if nEqIndex >= 2055 and nEqIndex <= 2284 then -- ����װ��
				--����״̬
				local nBindState = GetItemBindState(tbRoomItems[i])
				if nBindState ~= 0 then
					Say("���װ�����ڰ�״̬, ��������.")
					return 0
				end
				
				--����Ƿ�������װ��
				local nG, _, _ = GetItemProp(tbRoomItems[i])
				if nG == 7 then
					Say("���װ���ѱ�����޷�����.")
					return 0
				end
				
				nEquType = mod(nEqIndex - 2055, 10) + 1
				tbGoldEquip = {0, nEqIndex}
				break
			end
		end	
	end
	
	if tbGoldEquip == nil then
		Say("��δ�����κν���װ��.")
		return 0	
	end
		
	local nFreeItemCellLimit = tbJinWuRefineList[nEquType].nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if tbJinWuRefineList[nEquType].nWidth ~= 0 and tbJinWuRefineList[nEquType].nHeight ~= 0 and CountFreeRoomByWH(tbJinWuRefineList[nEquType].nWidth, tbJinWuRefineList[nEquType].nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ��֤�����ĲƲ���ȫ��������%d %dx%d����", nFreeItemCellLimit, tbJinWuRefineList[nEquType].nWidth, tbJinWuRefineList[nEquType].nHeight))
		return 0
	end	

  local tbItem = {szName = "��������ʯ", tbProp = {6,1,3005,1,0,0}, nCount = tbJinWuRefineList[nEquType].nStone} 
  local nCount = self:CalcItemCount(tbRoomItems, tbItem)
  if nCount < tbJinWuRefineList[nEquType].nStone then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��������������ʯ����. <color>"
		Talk(1, "", szMsg)
		return 0;
  end
	
	local nIdx = floor((nEqIndex - 2055)/10) + 1
	local tbProduct = tbEquip_jinwu[nEquType][nIdx]
	local tbMaterial = {{szName = tbProduct.szName, tbProp = tbGoldEquip, nCount = 1}, tbItem}

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		--Say("����ʧ�ܣ�������Ʒ��ʧ��",0)
		Msg2Player("����ʧ�ܣ�������Ʒ��ʧ.")
		return 0;
	end
	

	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	
	if type(self.tbFormula.pProductFun) == "function" then
		self.tbFormula:pProductFun(nComposeCount)
	end
	return 1;
end

function refine_jinwu()
		
	local strDesc = "<npc>�� <color=yellow>����װ��<color> Ҫ�����ĺ�����<color=yellow> ��������ʯ<color> ��Ӧ�ķ�������"
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "����װ��", "��������ʯ")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "���ڿ�", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "�����·�", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "����Ь", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "���ڻ���", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "���ڽ�ָ",2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������",4)
	local tbOpt = {}
	local tbMate =	{
			tbMaterial = 
			{
				{szName = "����װ��", tbProp = {0, {2055,2084}}, nQuality = 1 },
				{szName = "��������ʯ", tbProp = {6,1,3005,1,0,0},},
			},
			tbProduct = {szName="����װ��", tbProp={0, {2055,2084}}},
		}
	local p = tbJinWuRefineEquip:new(tbMate, "JinWuRefineEquip", INVENTORY_ROOM.room_giveitem)
	tinsert(tbOpt, {"��������װ��", p.ComposeGiveUI, {p}})
	tinsert(tbOpt, {"ȡ��"})
	CreateNewSayEx(strDesc, tbOpt);
end
