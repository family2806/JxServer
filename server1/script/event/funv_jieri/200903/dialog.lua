Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\compose_jinnang.lua")

local tbScoreClass = tbBaseClass:new()

function tbScoreClass:_init(nCount)
	self.nCount = nCount
	self.szName = "����ֵ"
	
end

function tbScoreClass:pGetCount()
	
	return tbFunv0903.tbTask:GetScore()
end


function tbScoreClass:pConsume(nCount)
	if self:pGetCount() < nCount then
		return 0
	else
		tbFunv0903.tbTask:AddScore(-nCount)
		return 1
	end
end

local _ReceiveNpcGife = function (nPoint, szLogTitle)
	
	if nPoint <= 0 then
		Talk(1, "", "��������Ʒ�޷��һ�����ֵ")
		return
	end
	tbFunv0903.tbTask:AddScore(nPoint)
	local szMsg = format("��� %d ����ֵ", nPoint)
	Msg2Player(szMsg)
	WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t%s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), format("get score %d", nPoint) ))
end

local tbMaterial = 
{
	{szName="�ں�", tbProp={6, 1, 1960}, nScore = 8},
	{szName="����", tbProp={6, 1, 1961}, nScore = 1},
	{szName="����", tbProp={6, 1, 1962}, nScore = 4},
	{szName="����", tbProp={6, 1, 1963}, nScore = 2},
}


local tbScoreShop = 
{
	[1] = 
	{
		szComposeTitle =  "�һ�",
		szFailMsg = "�����Ļ���ֵ���������㣬�޷��һ�����Ʒ.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="������", tbProp={6, 1, 1964, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[2] = 
	{
		szComposeTitle =  "�һ�",
		szFailMsg = "�����Ļ���ֵ���������㣬�޷��һ�����Ʒ.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="����", tbProp={6, 1, 1965, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[3] = 
	{
		szComposeTitle =  "�һ�",
		szFailMsg = "�����Ļ���ֵ���������㣬�޷��һ�����Ʒ.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="���� ", tbProp={6, 1, 1966, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[4] = 
	{
		szComposeTitle =  "�һ�",
		szFailMsg = "�����Ļ���ֵ���������㣬�޷��һ�����Ʒ.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="��ָ", tbProp={6, 1, 1967, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime},
	},
	[5] = 
	{
		szComposeTitle =  "�һ�",
		szFailMsg = "�����Ļ���ֵ���������㣬�޷��һ�����Ʒ.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(35),
			{nJxb = 6e4}
		},
		tbProduct = {szName="Χ��", tbProp={6, 1, 1968, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime},
	},
	[6] = 
	{
		szComposeTitle =  "�һ�",
		szFailMsg = "�����Ļ���ֵ���������㣬�޷��һ�����Ʒ.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(35),
			{nJxb = 6e4}
		},
		tbProduct = {szName="��ˮ", tbProp={6, 1, 1969, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
}



function tbFunv0903:DialogMain(nItemIndex, szDescLink)
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "��ѽ���.")
		return
	end
	
	
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."06-03-2009��24:00��15-03-2009���л��ȹ���38��Ů�ڻ. ����Ҫ��������?",
		format("������ȡ�����¼�/#%s:GetJinnang(%d, [[%s]])", self.szClassName, nItemIndex, szDescLink),
		
		format("�����ж��ٻ���ֵ��?/#%s:CheckMyScore()", self.szClassName),
		format("����Ҫ�һ�һЩ/#%s:BuyItemByScore(%d, [[%s]])", self.szClassName, nItemIndex, szDescLink),
		"�����Ի�/OnCancel"
	}
	if nItemIndex == nil or nItemIndex == -1 then
		tinsert(tbSay, 3, format("������һ���Ʒ [����ֵ]/#%s:GiveNpcGift(%d)", self.szClassName, nItemIndex))
	end
	
	CreateTaskSay(tbSay)
end

function tbFunv0903:GetJinnang()
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "����δ�ﵽ��ȡ��Ʒ������")
		return
	end
	
	if self.tbTask:GetIsGetJinNang() ~= 0 then
		Say("۪��ˮ: �㲻���Ѿ���ȡ������Ʒ����?",1, "�治����˼������������./OnCancel")
		return 
	end
	local tbItem = {szName="�����¼�", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.nComposeEndDate, tbParam = {self.nComposeEndDate, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Funv0903")
	self.tbTask:SetIsGetJinNang(1)
end

function tbFunv0903:CheckMyScore()
	local nScore = self.tbTask:GetScore()
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "��Ļ���ֵ����")
	else
		Talk(1, "", format("��Ļ���ֵΪ: %d", nScore))	
	end
	
end


local _MakeItemTable = function (nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- ��ͨ��Ʒ
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --�ƽ� or �׽�
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		elseif tbItem.nQuality == 1 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)
		elseif tbItem.nQuality == 4 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetPlatinaEquipIndex(nItemIndex)
		end
	elseif tbItem.nQuality == 2 then -- ��ɫװ��
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end

local _MatchItem = function (tbSrcItem, tbDecItem)
	if tbSrcItem == nil or tbDecItem == nil then
		return 0;
	end
	if tbSrcItem.tbProp == nil or tbDecItem.tbProp == nil then
		return 0;
	end
	if tbSrcItem.nQuality ~= nil and tbSrcItem.nQuality ~= tbDecItem.nQuality then
		return 0;
	end
	if tbSrcItem.nBindState ~= nil and tbSrcItem.nBindState ~= tbDecItem.nBindState then
		return 0;
	end
	local i;
	for i=1,getn(tbSrcItem.tbProp) do
		if (tbSrcItem.tbProp ~= nil) then
			if (tbSrcItem.tbProp[i] ~= tbDecItem.tbProp[i]) then
				return 0;
			end
		end
	end
	return 1;
end

local _CalcItemCountInGiveUI = function (tbItem, nUICount)
	
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		local tbItem_UI = %_MakeItemTable(nItemIndex)
		if %_MatchItem(tbItem, tbItem_UI) == 1 then
			nItemCount = nItemCount + tbItem_UI.nCount
		end
	end
	return nItemCount
end

local _ConsumeItemInGiveUI = function (tbItem, nConsumeCount, nUICount)
	local nLeftCount = nConsumeCount or 1
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		local tbItem_UI = %_MakeItemTable(nItemIndex)
		if %_MatchItem(tbItem, tbItem_UI) == 1 then
			
			if tbItem_UI.nCount <= nLeftCount then
				if RemoveItemByIndex(nItemIndex) == 1 then
					nLeftCount = nLeftCount - tbItem_UI.nCount
				end
			else
				if SetItemStackCount(nItemIndex, tbItem_UI.nCount - nLeftCount) == 1 then
					nLeftCount = 0
				end
			end
			if nLeftCount == 0 then
				return 1
			end
		end
		
	end
	return nil
end



function tbFunv0903__ProcessGiveUI(nUICount)
	
	local self = tbFunv0903
	local tbMaterial = %tbMaterial
	local nScore = 0
	local szLogTitle = "give npc gift"
	local tbCount = {}
	
	
	
	for i=1, getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nItemCount = %_CalcItemCountInGiveUI(tbItem, nUICount)
		
		
		
		if nItemCount > 0 and %_ConsumeItemInGiveUI(tbItem, nItemCount, nUICount) == 1 then
			
			nScore = nScore + tbItem.nScore * nItemCount
			local szItemName = nItemCount.." "..tbItem.szName
			WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t consume %s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szItemName))
		end

	end
	%_ReceiveNpcGife(nScore, szLogTitle)
end

function tbFunv0903:GiveNpcGift(nItemIndex)
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "��ѽ���.")
		return
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg)
		return
	end
	
	local szTitle = "�һ�����ֵ"
	local szMaterial = "����Ʒ�ŵ�����"
	
	nItemIndex = nItemIndex or -1
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return
		end
	end
	if tbItemJingnianshijian then
		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	end
	
	GiveItemUI(szTitle, szMaterial, "tbFunv0903__ProcessGiveUI", "OnCancel")
	
	
end



function tbFunv0903:BuyItemByScore(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		Talk(1, "", "��ѽ���.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg)
		return
	end
	
	
	if not self.tbScoreShop then
		self.tbScoreShop = tbComposeListForJinNang:new("tbFunv0903_Shop", %tbScoreShop)
	end
	local szTitle = "���кܶ��λ������ȡ��ʹ�õ���Ʒ. ����Ҫ�ĸ���Ʒ?"
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = self.tbScoreShop:MakeOptByProductName("��Ҫ�һ�", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay)
end

