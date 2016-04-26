-- 重铸金乌装备
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")


tbJinWuRefineEquip = tbActivityCompose:new()

tbJinWuRefineList = 
{
	[1]= {szName="金乌项链", nStone = 1, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[2]= {szName="金乌盔",   nStone = 2, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[3]= {szName="金乌上戒指",nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
	[4]= {szName="金乌护腕", nStone = 1, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[5]= {szName="金乌腰带", nStone = 2, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[6]= {szName="金乌衣",   nStone = 3, nWidth = 2, nHeight = 3, nFreeItemCellLimit = 1},
	[7]= {szName="金乌武器", nStone = 4, nWidth = 2, nHeight = 4, nFreeItemCellLimit = 1},
	[8]= {szName="金乌鞋",   nStone = 3, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[9]= {szName="金乌佩",   nStone = 3, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[10]={szName="金乌下戒指", nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
}

function tbJinWuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "金乌装备", "金乌重练石")
	local strDesc = format("   %-21s\t%d", "金乌盔", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌衣", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌鞋", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌腰带", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌护腕", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌玉佩", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌项链", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌戒指",2)
	strDesc = strDesc..format("\n   %-21s\t%d", "金乌武器",4)
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbJinWuRefineEquip:Compose(nComposeCount)
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- 取得金乌重练石的数量
  local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  每次都重新获取，以防止有变化	
	local tbGoldEquip = nil
	local nEquType = 0		-- 武器类别
	local nEqIndex = 0
	for i = 1, getn(tbRoomItems) do 
		nItemQuality = GetItemQuality(tbRoomItems[i])
		--检查物品品质
		if nItemQuality == 1 then
			nEqIndex = GetGlodEqIndex(tbRoomItems[i])
			if nEqIndex >= 2055 and nEqIndex <= 2284 then -- 金乌装备
				--检查绑定状态
				local nBindState = GetItemBindState(tbRoomItems[i])
				if nBindState ~= 0 then
					Say("你的装备处于绑定状态, 不能重铸.")
					return 0
				end
				
				--检查是否是破损装备
				local nG, _, _ = GetItemProp(tbRoomItems[i])
				if nG == 7 then
					Say("你的装备已被损毁无法重炼.")
					return 0
				end
				
				nEquType = mod(nEqIndex - 2055, 10) + 1
				tbGoldEquip = {0, nEqIndex}
				break
			end
		end	
	end
	
	if tbGoldEquip == nil then
		Say("你未放入任何金乌装备.")
		return 0	
	end
		
	local nFreeItemCellLimit = tbJinWuRefineList[nEquType].nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if tbJinWuRefineList[nEquType].nWidth ~= 0 and tbJinWuRefineList[nEquType].nHeight ~= 0 and CountFreeRoomByWH(tbJinWuRefineList[nEquType].nWidth, tbJinWuRefineList[nEquType].nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为保证大侠的财产安全，请整理%d %dx%d背包", nFreeItemCellLimit, tbJinWuRefineList[nEquType].nWidth, tbJinWuRefineList[nEquType].nHeight))
		return 0
	end	

  local tbItem = {szName = "金乌重练石", tbProp = {6,1,3005,1,0,0}, nCount = tbJinWuRefineList[nEquType].nStone} 
  local nCount = self:CalcItemCount(tbRoomItems, tbItem)
  if nCount < tbJinWuRefineList[nEquType].nStone then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>你放入的重练金乌石不够. <color>"
		Talk(1, "", szMsg)
		return 0;
  end
	
	local nIdx = floor((nEqIndex - 2055)/10) + 1
	local tbProduct = tbEquip_jinwu[nEquType][nIdx]
	local tbMaterial = {{szName = tbProduct.szName, tbProp = tbGoldEquip, nCount = 1}, tbItem}

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		--Say("制作失败，部分物品丢失。",0)
		Msg2Player("制作失败，部分物品丢失.")
		return 0;
	end
	

	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	
	if type(self.tbFormula.pProductFun) == "function" then
		self.tbFormula:pProductFun(nComposeCount)
	end
	return 1;
end

function refine_jinwu()
		
	local strDesc = "<npc>拿 <color=yellow>金乌装备<color> 要重练的和数量<color=yellow> 金乌重练石<color> 相应的放入下面"
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "金乌装备", "金乌重练石")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌盔", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌衣服", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌鞋", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌腰带", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌护腕", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌玉佩", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌项链", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌戒指",2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "金乌武器",4)
	local tbOpt = {}
	local tbMate =	{
			tbMaterial = 
			{
				{szName = "金乌装备", tbProp = {0, {2055,2084}}, nQuality = 1 },
				{szName = "重练金乌石", tbProp = {6,1,3005,1,0,0},},
			},
			tbProduct = {szName="金乌装备", tbProp={0, {2055,2084}}},
		}
	local p = tbJinWuRefineEquip:new(tbMate, "JinWuRefineEquip", INVENTORY_ROOM.room_giveitem)
	tinsert(tbOpt, {"重练金乌装备", p.ComposeGiveUI, {p}})
	tinsert(tbOpt, {"取消"})
	CreateNewSayEx(strDesc, tbOpt);
end
