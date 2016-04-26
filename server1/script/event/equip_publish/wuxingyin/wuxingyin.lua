
-- ����ӡ����
-- 2011.04.25

--Change the name "����ӡ" to "�ƽ�ӡ" - Modified by DinhHQ - 20110605

Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")

tbWuxingyin = tbActivityCompose:new()

local tbSuccessRate = {
	[1] = 35,		
	[2] = 45,
	[3] = 55,
	[4] = 65,
	[5] = 75,
	}
	
local tbLogAction = {
	[1] = "�ƽ�ӡǿ��2���ɹ�",
	[2] = "�ƽ�ӡǿ��3���ɹ�",
	[3] = "�ƽ�ӡǿ��4���ɹ�",
	[4] = "�ƽ�ӡǿ��5���ɹ�",
	[5] = "�ƽ�ӡǿ��6���ɹ�",
	[6] = "�ƽ�ӡ����2���ɹ�",
	[7] = "�ƽ�ӡ����3���ɹ�",
	[8] = "�ƽ�ӡ����4���ɹ�",
	[9] = "�ƽ�ӡ����5���ɹ�",
	[10] = "�ƽ�ӡ����6���ɹ�",
	[11] = "�ƽ�ӡǿ��2��ʧ��",
	[12] = "�ƽ�ӡǿ��3��ʧ��",
	[13] = "�ƽ�ӡǿ����ʧ��",
	[14] = "�ƽ�ӡǿ��5��ʧ��",
	[15] = "�ƽ�ӡǿ��6��ʧ��",
	[16] = "�ƽ�ӡ����2��ʧ��",
	[17] = "�ƽ�ӡ����3��ʧ��",
	[18] = "�ƽ�ӡ����4��ʧ��",
	[19] = "�ƽ�ӡ����5��ʧ��",
	[20] = "�ƽ�ӡ����6��ʧ��",
	}	

local tbMaterialA = {
		[1]={szName="�ƽ�ӡ ( 1��ǿ��)",tbProp={0,3205,},nQuality=1,},		-- level 1
		[2]={szName="�ƽ�ӡ ( 2��ǿ��)",tbProp={0,3206,},nQuality=1,},
		[3]={szName="�ƽ�ӡ ( 3��ǿ��)",tbProp={0,3207,},nQuality=1,},
		[4]={szName="�ƽ�ӡ ( 4��ǿ��)",tbProp={0,3208,},nQuality=1,},
		[5]={szName="�ƽ�ӡ ( 1��ǿ��)",tbProp={0,3209,},nQuality=1,},
		[6]={szName="�ƽ�ӡ ( 1������)",tbProp={0,3215,},nQuality=1,},		-- level 1	
		[7]={szName="�ƽ�ӡ ( 2������)",tbProp={0,3216,},nQuality=1,},
		[8]={szName="�ƽ�ӡ ( 3������)",tbProp={0,3217,},nQuality=1,},
		[9]={szName="�ƽ�ӡ ( 4������)",tbProp={0,3218,},nQuality=1,},
		[10]={szName="�ƽ�ӡ ( 5������)",tbProp={0,3219,},nQuality=1,},
		}

local tbAdditive = {szName="���������",tbProp={6,1,2839,},}	-- ���������

local tbFormulaList = {
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
	
	tbMaterial = {},
	
	tbProduct = {
		[1]={szName="�ƽ�ӡ ( 2��ǿ��)",tbProp={0,3206,},nQuality=1,nExpiredTime=7*24*60,},		-- level 2
		[2]={szName="�ƽ�ӡ ( 3��ǿ��)",tbProp={0,3207,},nQuality=1,nExpiredTime=7*24*60,},
		[3]={szName="�ƽ�ӡ ( 4��ǿ��)",tbProp={0,3208,},nQuality=1,nExpiredTime=7*24*60,},
		[4]={szName="�ƽ�ӡ ( 5��ǿ��)",tbProp={0,3209,},nQuality=1,nExpiredTime=7*24*60,},
		[5]={szName="�ƽ�ӡ ( 6��ǿ�� )",tbProp={0,3210,},nQuality=1,nExpiredTime=30*24*60,},
		[6]={szName="�ƽ�ӡ ( 2������)",tbProp={0,3216,},nQuality=1,nExpiredTime=7*24*60,},		-- level 2
		[7]={szName="�ƽ�ӡ ( 3������)",tbProp={0,3217,},nQuality=1,nExpiredTime=7*24*60,},
		[8]={szName="�ƽ�ӡ ( 4������)",tbProp={0,3218,},nQuality=1,nExpiredTime=7*24*60,},
		[9]={szName="�ƽ�ӡ ( 5������)",tbProp={0,3219,},nQuality=1,nExpiredTime=7*24*60,},
		[10]={szName="�ƽ�ӡ ( 6������)",tbProp={0,3220,},nQuality=1,nExpiredTime=30*24*60,},
		}
	}
	
function tbWuxingyin:GetRealLevel(nLevel)
	local nMaxLevel = 5
	if nLevel > nMaxLevel then
		nLevel = nLevel - nMaxLevel
	end
	return nLevel
end

-- �ж��Ƿ������ɹ�
function tbWuxingyin:CanCompose(nLevel)
	nLevel = self:GetRealLevel(nLevel)
	local nNumber = random(1,100)
	if nNumber <= %tbSuccessRate[nLevel] then
		return 1
	end
	return 0	
end

function tbWuxingyin:CalcItemCount(tbRoomItems, tbItem)
	local nTotalCount = 0
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex and nItemIndex > 0 then
			local nCount = GetItemStackCount(nItemIndex)
			local nItemBindState = GetItemBindState(nItemIndex)	--��ȡ��״̬,�󶨵���Ʒ������
			if nItemBindState == 0 and self:CheckItem(tbItem ,nItemIndex) == 1 then
				nTotalCount = nTotalCount + nCount
			end
		end
	end
	return nTotalCount	
end

-- �ж�UI����������Ƿ���tbItem
function tbWuxingyin:CheckItemLegal(tbItem)
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nItemNeedCount = tbItem.nCount or 1
	if nItemNeedCount > 0 then
		local tbProp = tbItem.tbProp
		tbProp[4] = tbProp[4] or -1		
		local nCurCount = self:CalcItemCount(tbRoomItems, tbItem)
		if nCurCount < nItemNeedCount then
			return 0
		end	
	end			
	return 1
end

-- ����Ƿ�Ϸ������Ϸ������غϳɵĵȼ�
function tbWuxingyin:CheckLegal()
	local tbItem = self.tbAdditive

	-- �жϲ��ϵĵȼ����Ƿ��
	local tbMaterial = self.tbFormula.tbMaterial
	for i=1, getn(tbMaterial) do
		local tbSubMaterial = tbMaterial[i]
		local bLeap = 1
		for j=1, getn(tbSubMaterial) do
			tbItem = tbSubMaterial[j]
			if self:CheckItemLegal(tbItem) ~= 1 then
				bLeap = 0
				break
			end
		end
		
		if bLeap == 1 then
			return i
		end
	end
	return 0
end

-- ��������Ҫ�����ж��ϳɸ��ʣ��Ѿ��޸Ĳ��ϱ��
function tbWuxingyin:Compose(nComposeCount, nLevel)
	
	local tbMaterial	= self.tbFormula.tbMaterial[nLevel]	-- ��̬���ɺϳɵĲ��ϱ�
	local tbProduct		= self.tbFormula.tbProduct[nLevel]
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("Ϊ�˱�֤�����Ʋ���ȫ, ������� %d %dx%d�ı���", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>����������Ʒ����!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- ��̬�������ı�
	local bSuccess = self:CanCompose(nLevel)
	
	local tbConsume = {}
	if bSuccess ~= 1 then
		tinsert(tbConsume, tbMaterial[2])		-- �ϳ�ʧ��ֻ�������������	
	else
		tbConsume = tbMaterial
	end
--	print("compose nLevel = " .. tostring(nLevel))
	if self:ConsumeMaterial(tbConsume, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("����ʧ�ܣ���ʧ������Ʒ.")
		return 0;
	end
	
	if bSuccess == 1 then
		if type(tbProduct) == "table" then
			tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		end
		
		if type(self.tbFormula.pProductFun) == "function" then
			self.tbFormula:pProductFun(nComposeCount)
		end
	else
		local szMsg = format("<color=red>�ϳ�ʧ�ܣ�����")
		for i=1,getn(tbConsume) do
			szMsg = szMsg .. tbConsume[i].szName
		end
		szMsg = szMsg .. "<color>"
		Msg2Player(szMsg)
	end
	
	self:Log(nLevel, bSuccess)		-- �¼���־
	return bSuccess
end

function tbWuxingyin:Log(nLevel, bSuccess)
	if bSuccess == 0 then
		nLevel = nLevel + 10
	end
	tbLog:PlayerActionLog("HoangKimAn", %tbLogAction[nLevel])		-- ��־
end

-- �޸������е���ʾ������
function tbWuxingyin:ComposeGiveUI()
	
	local szTitle = "�����ƽ�ӡ"
	local szContent = ""
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

-- �ж���������Ʒ�Ƿ����Ҫ��
function tbWuxingyin:GiveUIOk(nCount)
	local nLevel = self:CheckLegal()
--	print("nLeve = " .. tonumber(nLevel))
	if nLevel > 0 then
		self:Compose(1, nLevel)
	else
		CreateNewSayEx("<color=red>����������Ʒ����!<color>", {})
	end
	return 
end


function tbWuxingyin:Register()
	local tbOpt = {}
	-- ��������ӡ�ĶԻ����ݣ�����������ʽ��
	local szMsg = "�ƽ�ӡ��һ�������������һ���ж�����,�������ʧ�ܽ���ʧȥ����������������������:\n"
	for i=1,5 do 
		szMsg = szMsg .. format("�ƽ�ӡ %d �� ( ����/ǿ��) +1 ���������= �ƽ�ӡ %d �� ( ����/ǿ�� )\n",i,(i+1))
	end
	
	%tbFormulaList.tbMaterial = {}
	local tbProduct = %tbFormulaList.tbProduct
	
	for i=1,getn(%tbMaterialA) do
		
		local tbMaterial = {}
		tinsert(tbMaterial, %tbMaterialA[i])
		tinsert(tbMaterial, %tbAdditive)
		tinsert(%tbFormulaList.tbMaterial, tbMaterial)		-- �ϳɹ�ʽ�Ĳ��ϱ�
		
	end
	
	local p = tbWuxingyin:new(%tbFormulaList, "shengjiwuxingyin", INVENTORY_ROOM.room_giveitem)
	
	tinsert(tbOpt, {"�����ƽ�ӡ", p.ComposeGiveUI, {p}})
	tinsert(tbOpt, {"ȡ��"})
	nItem2EquipRegId = pEventType:Reg("��������", "�����ƽ�ӡ", CreateNewSayEx, {szMsg, tbOpt})
end


tbWuxingyin:Register()