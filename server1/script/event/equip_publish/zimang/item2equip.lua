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
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  每次都重新获取，以防止有变化
	
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
		Say(format("为保护大侠的财产安全, 请整理出 %d %dx%d 背包", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的材料不足!<!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("铸造失败, 丢失部分物品.")
		return 0;
	end
	
	
	
	if self:ConsumeAdditive(nAdditiveCount) ~= 1 then
		Msg2Player("铸造失败, 丢失部分物品.")
		return 0;
	end
	
	if random(1, 100) > nSuccessRate then
		Msg2Player("真可惜铸造失败")
		return 0
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		AddStatData("zimang_jx1hechengzongshu", 1)	--数据埋点第一期
	end

	return 1;
end

function tbItem2Equip:GiveUIOk(nCount)
	if nCount < getn(self.tbFormula.tbMaterial) then
		return Talk(1, "", self.tbFormula.szFailMsg or "<color=red>大侠带的物品不够!<color>")
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	local szMsg = format("你已放入 %d 个 %s, 成功率是%d%%, 要继续铸造吗?", nAdditiveCount, self.tbFormula.tbAdditive.szName, nSuccessRate)
	local tbOpt = 
	{
		{"继续铸造", self.SelectEquip, {self, 1, 5}},
		{"再放一次", self.ComposeGiveUI, {self}},
		{"取消"},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Equip:SelectEquip(nId, nCount)
	
	if self:CheckMaterial(self.tbFormula.tbMaterial, 1) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的物品不够!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	local tbProduct = self.tbFormula.tbProduct
	local szMsg = format("选一个 %s", tbProduct.szName)
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
		tinsert(tbOpt, {"上一页", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"下一页", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"取消"})
	CreateNewSayEx(szMsg, tbOpt)
end


tbCommonMaterial = 
{
	{szName="紫蟒金牌", tbProp={6, 1, 2765}, nCount = 1},
	{szName="青驹石", tbProp={6, 1, 2710}, nCount = 4},
	{szName="云露石", tbProp={6, 1, 2711}, nCount = 3},
	{szName="苍狼石", tbProp={6, 1, 2712}, nCount = 2},
	{szName="玄猿石", tbProp={6, 1, 2713}, nCount = 1},
	{szName="紫蟒令", tbProp={6, 1, 2350}, nCount = 1},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "紫蟒盔",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒盔图谱", tbProp = {6,1,2714}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{
		szName = "紫蟒衣",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒衣图谱", tbProp = {6,1,2715}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[3] = 
	{
		szName = "紫蟒鞋",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒鞋图谱", tbProp = {6,1,2716}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "紫蟒腰带",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒腰带图谱", tbProp = {6,1,2717}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "紫蟒护腕",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒护腕图谱", tbProp = {6,1,2718}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "紫蟒项链",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒项链图谱", tbProp = {6,1,2719}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "紫蟒佩",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒佩图谱", tbProp = {6,1,2720}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[8] = 
	{
		szName = "紫蟒上戒指",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒上戒指", tbProp = {6,1,2721}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "紫蟒下戒指",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒下戒指图谱",tbProp = {6,1,2722}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "紫蟒器戒",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "紫蟒器戒图谱", tbProp = {6,1,2723}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
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
	local szOpt = format("铸造 %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbOpt, {"取消"})
nItem2EquipRegId = pEventType:Reg("城中铁匠", "铸造紫蟒装备", CreateNewSayEx, {"选择要铸造的装备", tbOpt})

--?gm ds Include[[\script\event\equip_publish\zimang\item2equip.lua]]
--?gm ds Include[[\script\lib\awardtemplet.lua]]
--?gm ds tbAwardTemplet.GiveAwardByList(tbAwardTemplet,tbCommonMaterial, tbItem)