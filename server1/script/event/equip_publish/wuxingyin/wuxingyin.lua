
-- 五行印升级
-- 2011.04.25

--Change the name "五行印" to "黄金印" - Modified by DinhHQ - 20110605

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
	[1] = "黄金印强化2级成功",
	[2] = "黄金印强化3级成功",
	[3] = "黄金印强化4级成功",
	[4] = "黄金印强化5级成功",
	[5] = "黄金印强化6级成功",
	[6] = "黄金印弱化2级成功",
	[7] = "黄金印弱化3级成功",
	[8] = "黄金印弱化4级成功",
	[9] = "黄金印弱化5级成功",
	[10] = "黄金印弱化6级成功",
	[11] = "黄金印强化2级失败",
	[12] = "黄金印强化3级失败",
	[13] = "黄金印强化级失败",
	[14] = "黄金印强化5级失败",
	[15] = "黄金印强化6级失败",
	[16] = "黄金印弱化2级失败",
	[17] = "黄金印弱化3级失败",
	[18] = "黄金印弱化4级失败",
	[19] = "黄金印弱化5级失败",
	[20] = "黄金印弱化6级失败",
	}	

local tbMaterialA = {
		[1]={szName="黄金印 ( 1级强化)",tbProp={0,3205,},nQuality=1,},		-- level 1
		[2]={szName="黄金印 ( 2级强化)",tbProp={0,3206,},nQuality=1,},
		[3]={szName="黄金印 ( 3级强化)",tbProp={0,3207,},nQuality=1,},
		[4]={szName="黄金印 ( 4级强化)",tbProp={0,3208,},nQuality=1,},
		[5]={szName="黄金印 ( 1级强化)",tbProp={0,3209,},nQuality=1,},
		[6]={szName="黄金印 ( 1级弱化)",tbProp={0,3215,},nQuality=1,},		-- level 1	
		[7]={szName="黄金印 ( 2级弱化)",tbProp={0,3216,},nQuality=1,},
		[8]={szName="黄金印 ( 3级弱化)",tbProp={0,3217,},nQuality=1,},
		[9]={szName="黄金印 ( 4级弱化)",tbProp={0,3218,},nQuality=1,},
		[10]={szName="黄金印 ( 5级弱化)",tbProp={0,3219,},nQuality=1,},
		}

local tbAdditive = {szName="王铁匠令符",tbProp={6,1,2839,},}	-- 王铁匠令符

local tbFormulaList = {
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
	
	tbMaterial = {},
	
	tbProduct = {
		[1]={szName="黄金印 ( 2级强化)",tbProp={0,3206,},nQuality=1,nExpiredTime=7*24*60,},		-- level 2
		[2]={szName="黄金印 ( 3级强化)",tbProp={0,3207,},nQuality=1,nExpiredTime=7*24*60,},
		[3]={szName="黄金印 ( 4级强化)",tbProp={0,3208,},nQuality=1,nExpiredTime=7*24*60,},
		[4]={szName="黄金印 ( 5级强化)",tbProp={0,3209,},nQuality=1,nExpiredTime=7*24*60,},
		[5]={szName="黄金印 ( 6级强化 )",tbProp={0,3210,},nQuality=1,nExpiredTime=30*24*60,},
		[6]={szName="黄金印 ( 2级弱化)",tbProp={0,3216,},nQuality=1,nExpiredTime=7*24*60,},		-- level 2
		[7]={szName="黄金印 ( 3级弱化)",tbProp={0,3217,},nQuality=1,nExpiredTime=7*24*60,},
		[8]={szName="黄金印 ( 4级弱化)",tbProp={0,3218,},nQuality=1,nExpiredTime=7*24*60,},
		[9]={szName="黄金印 ( 5级弱化)",tbProp={0,3219,},nQuality=1,nExpiredTime=7*24*60,},
		[10]={szName="黄金印 ( 6级弱化)",tbProp={0,3220,},nQuality=1,nExpiredTime=30*24*60,},
		}
	}
	
function tbWuxingyin:GetRealLevel(nLevel)
	local nMaxLevel = 5
	if nLevel > nMaxLevel then
		nLevel = nLevel - nMaxLevel
	end
	return nLevel
end

-- 判断是否升级成功
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
			local nItemBindState = GetItemBindState(nItemIndex)	--获取绑定状态,绑定的物品不计算
			if nItemBindState == 0 and self:CheckItem(tbItem ,nItemIndex) == 1 then
				nTotalCount = nTotalCount + nCount
			end
		end
	end
	return nTotalCount	
end

-- 判定UI给与界面中是否有tbItem
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

-- 检查是否合法，若合法，返回合成的等级
function tbWuxingyin:CheckLegal()
	local tbItem = self.tbAdditive

	-- 判断材料的等级，是否绑定
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

-- 升级中需要增加判定合成概率，已经修改材料表等
function tbWuxingyin:Compose(nComposeCount, nLevel)
	
	local tbMaterial	= self.tbFormula.tbMaterial[nLevel]	-- 动态生成合成的材料表
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
		Say(format("为了保证大侠财产安全, 请整理出 %d %dx%d的背包", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的物品不够!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- 动态设置消耗表
	local bSuccess = self:CanCompose(nLevel)
	
	local tbConsume = {}
	if bSuccess ~= 1 then
		tinsert(tbConsume, tbMaterial[2])		-- 合成失败只消耗王铁匠令符	
	else
		tbConsume = tbMaterial
	end
--	print("compose nLevel = " .. tostring(nLevel))
	if self:ConsumeMaterial(tbConsume, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("铸造失败，丢失部分物品.")
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
		local szMsg = format("<color=red>合成失败，消耗")
		for i=1,getn(tbConsume) do
			szMsg = szMsg .. tbConsume[i].szName
		end
		szMsg = szMsg .. "<color>"
		Msg2Player(szMsg)
	end
	
	self:Log(nLevel, bSuccess)		-- 事件日志
	return bSuccess
end

function tbWuxingyin:Log(nLevel, bSuccess)
	if bSuccess == 0 then
		nLevel = nLevel + 10
	end
	tbLog:PlayerActionLog("HoangKimAn", %tbLogAction[nLevel])		-- 日志
end

-- 修改升级中的提示道具名
function tbWuxingyin:ComposeGiveUI()
	
	local szTitle = "升级黄金印"
	local szContent = ""
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

-- 判定所给的物品是否符合要求
function tbWuxingyin:GiveUIOk(nCount)
	local nLevel = self:CheckLegal()
--	print("nLeve = " .. tonumber(nLevel))
	if nLevel > 0 then
		self:Compose(1, nLevel)
	else
		CreateNewSayEx("<color=red>大侠带的物品不够!<color>", {})
	end
	return 
end


function tbWuxingyin:Register()
	local tbOpt = {}
	-- 升级五行印的对话内容，包括升级公式等
	local szMsg = "黄金印升一级王铁匠令符有一定判定概率,如果升级失败将会失去王铁匠令符，具体情况如下:\n"
	for i=1,5 do 
		szMsg = szMsg .. format("黄金印 %d 级 ( 弱化/强化) +1 王铁匠令符= 黄金印 %d 级 ( 弱化/强化 )\n",i,(i+1))
	end
	
	%tbFormulaList.tbMaterial = {}
	local tbProduct = %tbFormulaList.tbProduct
	
	for i=1,getn(%tbMaterialA) do
		
		local tbMaterial = {}
		tinsert(tbMaterial, %tbMaterialA[i])
		tinsert(tbMaterial, %tbAdditive)
		tinsert(%tbFormulaList.tbMaterial, tbMaterial)		-- 合成公式的材料表
		
	end
	
	local p = tbWuxingyin:new(%tbFormulaList, "shengjiwuxingyin", INVENTORY_ROOM.room_giveitem)
	
	tinsert(tbOpt, {"升级黄金印", p.ComposeGiveUI, {p}})
	tinsert(tbOpt, {"取消"})
	nItem2EquipRegId = pEventType:Reg("城中铁匠", "升级黄金印", CreateNewSayEx, {szMsg, tbOpt})
end


tbWuxingyin:Register()