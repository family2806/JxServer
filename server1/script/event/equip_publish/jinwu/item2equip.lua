Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
Include("\\script\\event\\equip_publish\\jinwu\\zimang_name.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
tbItem2Jinwu = tbActivityCompose:new()

function tbItem2Jinwu:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	
	-- 获取成功率
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
	
	-- 检查背包空间
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为保护大侠的财产安全, 请整理出 %d %dx%d 背包", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- 计算成功率
	local nSuccessRate = self:GetSuccessRate()	
	
	-- 检查材料是否充足
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的材料不足!<color>"
		Talk(1, "", szMsg)
		print("CheckMaterial value ~= 1")
		return 0;
	end	
	
	--代替紫蟒石 = 紫蟒装备
	local nMatId = tbProduct.tbProp[2] - 230
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{szName = strZimangName, tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>铸造<color=yellow>%s<color=red>要有<color=yellow>%s<color=red> 来做材料!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- 组合合成必须消耗的物品
	local tbBMaterial = self.tbFormula.tbBMaterial
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  每次都重新获取，以防止有变化
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
				local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的材料不足!<color>"
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
	
	-- 扣除合成必须消耗的物品
	if self:ConsumeMaterial(tbBMaterial, nComposeCount, self.szLogTitle) ~= 1 or 
			self:ConsumeMaterial(tbMaterialEx, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("铸造失败, 一部分材料丢失了.")
		return 0;
	end	
	
		-- 扣除合成成功后扣除的物品
	local tbMEx = self.tbFormula.tbAdditiveEx
	if tbMEx[1] then 
		tbMEx[1].nCount = nMapCount
	end
	
	self:ConsumeMaterial(tbMEx, nComposeCount, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("真可惜铸造失败")
		%tbVngTransLog:Write("201110_CheTaoKimO/", 15, "CheTaoKimO", "N/A", 0)
		return 0
	end

	if self:ConsumeMaterial(tbVnMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("铸造失败, 一部分材料丢失了.")
		return 0;
	end

	if type(tbProduct) == "table" then
	--	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		local tbTranslog = {strFolder = "201110_CheTaoKimO/", nPromID = 15, nResult = 1}
		tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle, "CheTaoKimO", tbTranslog})
	--	AddStatData("zimang_jx1hechengzongshu", 1)	--数据埋点第一期
	end

	return 1;
end

function tbItem2Jinwu:GiveUIOk(nComposeCount, nProductId, nCount)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	--代替紫蟒石 = 紫蟒装备
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local nMatId = tbProduct.tbProp[2] - 230	
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>铸造<color=yellow>%s<color=red>要有<color=yellow>%s<color=red> 来做材料!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- 检查材料是否充足
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的材料不足!<color>"
		Talk(1, "", szMsg)
		print("GiveUIOk check material fail")
		return 0;
	end	
	
	local nSuccessRate = self:GetSuccessRate()
	local msg = "合成金乌装备需要有1个金乌牌, 5颗青驹石, 4颗云露石, 3颗苍狼石, 2颗玄猿石, 1个金乌令和1套与铸造装备的主导进攻派系相对应的紫莽装备, 要求最少要有1幅对应的金乌图谱, 5千万银两, 如有需要则还要增加成功率的材料."
	local szMsg = format("%s, 根据你放入的原料来看成功率是%d%%, 你要继续铸造吗?", msg, nSuccessRate)
	local tbOpt = 
	{
		{"继续铸造", self.Compose, {self, nComposeCount, nProductId}},
		{"再放一次", self.ComposeGiveUI, {self, nComposeCount, nProductId}},
		{"取消"},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Jinwu:ComposeGiveUI(nComposeCount, nProductId)
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("交换%s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self, nComposeCount, nProductId}}, nil, self.bAccessBindItem)
end

function tbItem2Jinwu:SelectEquip(nId, nCount)
	
	local tbProduct = self.tbFormula.tbProduct
	local msg = "合成金乌装备需要有1个金乌牌, 5颗青驹石, 4颗云露石, 3颗苍狼石, 2颗玄猿石, 1个金乌令,和1套与铸造装备的主导进攻派系相对应的紫莽装备, 要求最少要有1幅对应的金乌图谱, 5千万银两, 如有需要则还要增加成功率的材料."

	local szMsg = format("%s,选一个 %s", msg, tbProduct.szName)
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
	{szName="金乌金牌", tbProp={6, 1, 3001}, nCount = 1},
	{szName="青驹石", tbProp={6, 1, 2710}, nCount = 5},
	{szName="云露石", tbProp={6, 1, 2711}, nCount = 4},
	{szName="苍狼石", tbProp={6, 1, 2712}, nCount = 3},
	{szName="玄猿石", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="紫蟒石", tbProp={6, 1, 3000}, nCount = 1},
	{szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},	
	{szName=" 两", nJxb=1, nCount = 50000000},	
}

tbBaseMaterial = 
{
	{szName="金乌金牌", tbProp={6, 1, 3001}, nCount = 1},
	{szName="青驹石", tbProp={6, 1, 2710}, nCount = 5},
	{szName="云露石", tbProp={6, 1, 2711}, nCount = 4},
	{szName="苍狼石", tbProp={6, 1, 2712}, nCount = 3},
	{szName="玄猿石", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="紫蟒石", tbProp={6, 1, 3000}, nCount = 1},
	{szName=" 两", nJxb=1, nCount = 50000000},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "金乌项链",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌项链图谱", tbProp = {6,1,2987}, nSuccessRate = 10, nMaxSuccessRate = 80},
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
			},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌项链图谱", tbProp = {6,1,2987}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "金乌盔",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌盔图谱", tbProp = {6,1,2982}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌盔图谱", tbProp = {6,1,2982}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "金乌上戒指",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌上戒图谱", tbProp = {6,1,2989}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌上戒图谱", tbProp = {6,1,2989}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "金乌护腕",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌护腕图谱", tbProp = {6,1,2986}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌护腕图谱", tbProp = {6,1,2986}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "金乌腰带",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌腰带图谱", tbProp = {6,1,2985}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌腰带图谱", tbProp = {6,1,2985}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "金乌衣服",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌衣图谱", tbProp = {6,1,2983}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌衣图谱", tbProp = {6,1,2983}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "金乌武器",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌器戒图谱", tbProp = {6,1,2991}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌器戒图谱", tbProp = {6,1,2991}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "金乌鞋",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌鞋图谱", tbProp = {6,1,2984}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌鞋图谱", tbProp = {6,1,2984}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "金乌佩",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌佩图谱", tbProp = {6,1,2988}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌佩图谱", tbProp = {6,1,2988}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "金乌下戒指",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "金乌下戒图谱", tbProp = {6,1,2990}, nSuccessRate = 10, nMaxSuccessRate = 80},		
					{szName = "金花之宝", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "翡翠之宝", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "风云之宝", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},		
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "金乌下戒图谱", tbProp = {6,1,2990}, nCount = 1},
				  {szName="金乌令", tbProp={6, 1, 2349}, nCount = 1},			
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
--	local szOpt = format("铸造%s", tbFormulaList[i].tbProduct.szName)
--	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
--end
--tinsert(tbOpt, {"取消"})

for i=1, getn(tbFormulaList) do
	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
	
	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("铸造%s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbOpt, {"取消"})

local msg = "合成金乌装备需要有1个金乌牌, 5颗青驹石, 4颗云露石, 3颗苍狼石, 2颗玄猿石, 1个金乌令和1套与铸造装备的主导进攻派系相对应的紫莽装备, 要求最少要有1幅对应的金乌图谱, 5千万银两, 如有需要则还要增加成功率的材料."
nItem2EquipRegId = pEventType:Reg("城中铁匠", "铸造金乌装备", CreateNewSayEx, {format("%s, 选择你想要铸造的装备:", msg), tbOpt})

