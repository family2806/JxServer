Include("\\script\\event\\other\\xunmashu\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\composelistclass.lua")
IL("LEAGUE")
	
local _ComposeMsg = function ()
	local szMsg = "这是成品，祝各位好运."
	Talk(1, "", szMsg)
end

local _MakeItemTable = function (nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- 普通物品
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --黄金 or 白金
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		elseif tbItem.nQuality == 1 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)
		elseif tbItem.nQuality == 4 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetPlatinaEquipIndex(nItemIndex)
		end
	elseif tbItem.nQuality == 2 then -- 紫色装备
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
	nUICount = nUICount or 24
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		if nItemIndex and nItemIndex > 0 then
			local tbItem_UI = %_MakeItemTable(nItemIndex)
			if %_MatchItem(tbItem, tbItem_UI) == 1 then
				nItemCount = nItemCount + tbItem_UI.nCount
			end
		end
	end
	return nItemCount
end

local _ConsumeItemInGiveUI = function (tbItem, nConsumeCount, nUICount)
	nUICount = nUICount or 24
	local nLeftCount = nConsumeCount or 1
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		if nItemIndex and nItemIndex > 0 then
			
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
		
	end
	return nil
end


local tbItemInGiveUi = tbBaseClass:new()

function tbItemInGiveUi:_init(tbItem)
	self.szName = tbItem.szName
	self.tbItem = tbItem
	self.nCount = tbItem.nCount
end

function tbItemInGiveUi:pGetCount()
	return %_CalcItemCountInGiveUI(self.tbItem)
end

function tbItemInGiveUi:pConsume(nCount)
	return %_ConsumeItemInGiveUI(self.tbItem, nCount)
end


local tbFormulaList_Box = 
{
	[1] = 
	{
		szComposeTitle =  "兑换",
		szFailMsg = "在下想各位还缺什么东西呢?",
		nFreeItemCellLimit = 10,
		tbMaterial = 
		{
			
			{szName="神秘密图", tbProp={6, 1, 196}, nCount = 10},
			{nJxb = 3e4},
		},
		tbProduct = {szName="黄金宝箱", tbProp={6, 1, 1985, 1, 0, 0}, nExpiredTime = tbXunMaShu0903.nItemExpiredTime, CallBack = _ComposeMsg}, 
	},
	[2] = 
	{
		szComposeTitle =  "兑换",
		szFailMsg = "在下想各位还缺什么东西呢?",
		nFreeItemCellLimit = 10,
		tbMaterial = 
		{
			
			{szName="神秘密图", tbProp={6, 1, 196}, nCount = 10},
			{szName="天晶石", tbProp={6, 1, 1988}},
		},
		tbProduct = {szName="白金宝箱", tbProp={6, 1, 1986, 1, 0, 0}, nExpiredTime = tbXunMaShu0903.nItemExpiredTime, CallBack = _ComposeMsg}, 
	},

}

local tbFormulaList_Horse =
{
	[1] = 
	{
		szComposeTitle =  "兑换",
		szFailMsg = "大侠放入的物品不对或者数量有误.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			
			tbItemInGiveUi:new({szName="飞云", tbProp={0, 10, 8}}),
			tbItemInGiveUi:new({szName="北斗驯马术", tbProp={6, 1, 1987}}),
		},
		tbProduct = 
		{
			szName = "驯马",
			[1] = {szName="照夜玉狮子", tbProp={0, 10, 5, 5, 5, 0}, nRate = 13},
			[2] = {szName="赤兔", tbProp={0, 10, 5, 2, 5, 0}, nRate = 7},
			[3] = {szName="的卢", tbProp={0, 10, 5, 4, 5, 0}, nRate = 1.97},
			[4] = {szName="乌云踏雪", tbProp={0, 10, 5, 1, 5, 0}, nRate = 4},
			[5] = {szName="绝影", tbProp={0, 10, 5, 3, 5, 0}, nRate = 4},
			[6] = 
			{
				nRate = 20,
				[1] = {szName="奔宵", tbProp={0, 10, 6, 1, 5, 0}},
				[2] = {
					pFun = function()
						local szMsg = format("高手<color=green>%s<color>已经驯化了昂贵的马，祝贺并瞻仰!", GetName())
						AddGlobalNews(szMsg)
						
						LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
					end
				}
			},
			[7] =
			{
				nRate = 0.03,
				[1] = {szName="翻羽", tbProp={0, 10, 7, 1, 5, 0}},
				[2] = {
					pFun = function()
						local szMsg = format("高手<color=green>%s<color>已经驯化了昂贵的马，祝贺并瞻仰!", GetName())
						AddGlobalNews(szMsg)
						
						LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
					end
				}
			},
			[8] = {szName="飞云", tbProp={0, 10, 8, 1, 5, 0}, nRate = 50,},
		}, 
	},
} 














function tbXunMaShu0903:DialogMain_Box()
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "活动结束了.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg, "各位没有资格参加此活动")
		return
	end
	
	
	if not self.Compose_Box then
		self.Compose_Box = tbComposeListClass:new("tbXunMaShu0903_ComposeBox", %tbFormulaList_Box)
	end
	local szTitle = "<dec><npc>".." 各位想精炼哪个宝箱呢?"
	
	
	local tbSay = self.Compose_Box:MakeOptByProductName("我想精炼成")
	tinsert(tbSay, 1, szTitle)
	tinsert(tbSay, "结束对话/OnCancel")
	CreateTaskSay(tbSay)
end

function tbXunMaShu0903:DialogMain_Horse()
	if self:IsActDate() ~= 1 then
		Talk(1, "", "活动结束了.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg, "各位没有资格参加此活动")
		return
	end
	
	self:ExchangeHorse()
	
--	if not self.Compose_Horse then
--		self.Compose_Horse = tbComposeListClass:new("tbXunMaShu0903_ComposeHorse", %tbFormulaList_Horse)
--	end
--	local szTitle = "<dec><npc>".."你想驯马吗？"
--	
--	
--	local tbSay = self.Compose_Horse:MakeOptByProductName("训练")
--	tinsert(tbSay, 1, szTitle)
--	tinsert(tbSay, "结束对话/OnCancel")
--	CreateTaskSay(tbSay)
end




function tbXunMaShu0903__ProcessGiveUI(nCount)
	if nCount ~= 2 then
		return Talk(1, "", "放入数量不够")
	end
	
	tbComposeClass:Compose(%tbFormulaList_Horse[1], "tbXunMaShu0903 exchange horse", 1)
	
end



function tbXunMaShu0903:ExchangeHorse()
	
	
	local szTitle = "驯马"
	local szMaterial = "1飞云和1北斗驯马术"
	GiveItemUI(szTitle, szMaterial, "tbXunMaShu0903__ProcessGiveUI", "OnCancel")
end


