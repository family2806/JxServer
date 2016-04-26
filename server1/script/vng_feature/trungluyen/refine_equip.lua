--紫蟒装备重练技能 - Created by DinhHQ - 20110517

Include("\\script\\vng_feature\\trungluyen\\globalvar.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbVNG_RefineEquip = {}


function tbVNG_RefineEquip:ShowDialog()
	local strDesc = "要重练，需要1 <color=yellow>紫蟒装备<color> 数量 <color=yellow>重练玉<color> 按照如下装备:"	
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "装备", "玉")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒盔", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒衣", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒鞋", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒腰带", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒护腕", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒项链", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫莽玉佩", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒戒指", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "紫蟒器械", 3)
	Describe(strDesc, 2, "我想重练/#tbVNG_RefineEquip:main()", "取消/OnCancel")
end

function tbVNG_RefineEquip:main()	
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(nTSK_DAILY_REFINE_LIMIT)
	if nTaskVal >= nDAILY_REFINE_MAX_COUNT then
		Talk(1, "", format("每天只能重练装备 <color=red>%d<color> 次，明天再来吧!", nDAILY_REFINE_MAX_COUNT))
		return
	end
	
	local strDesc = format("%-22s%s\n", "装备", "玉")
	strDesc = strDesc..format("\n%-29s%d", "紫蟒盔", 1)
	strDesc = strDesc..format("\n%-29s%d", "紫蟒衣", 2)
	strDesc = strDesc..format("\n%-29s%d", "紫蟒鞋", 2)
	strDesc = strDesc..format("\n%-29s%d", "紫蟒腰带", 1)
	strDesc = strDesc..format("\n%-29s%d", "紫蟒护腕", 1)
	strDesc = strDesc..format("\n%-29s%d", "紫蟒项链", 2)
	strDesc = strDesc..format("\n%-29s%d", "紫莽玉佩", 2)
	strDesc = strDesc..format("\n%-29s%d", "戒指", 2)
	strDesc = strDesc..format("\n%-29s%d", "紫蟒器械", 3)
	GiveItemUI("重练紫蟒", strDesc, "RefineUIConfirm", "OnCancel")
end

function RefineUIConfirm(nCount)	
	local tbGoldEquip = {}
	local tbStoneList = {}
	local nTempIdx = 0
	local nItemQuality = -1
	for i = 1, nCount do
		nTempIdx = GetGiveItemUnit(i)
		if nTempIdx < 0 then
			Talk(1, "", "物品不合理")
			return
		end
		nItemQuality = GetItemQuality(nTempIdx)
		--item ho祅g kim
		if nItemQuality == 1 then
			tinsert(tbGoldEquip, getn(tbGoldEquip) + 1 ,nTempIdx)
		else --item thng
			tinsert(tbStoneList, getn(tbStoneList) + 1, nTempIdx)		
		end	
	end
	
	--检查item 合理吗
	local nResult, strFailMessage = tbVNG_RefineEquip:CheckItems(tbGoldEquip, tbStoneList)
	if nResult ~= 1 and strFailMessage then
		Talk(1, "", strFailMessage)
		return
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGoldEquip[1]) 
	
	--删除原料
	local nConsumeResult, strConsumeFailMessage = tbVNG_RefineEquip:ConsumeItems(tbGoldEquip, tbStoneList)
	if nConsumeResult ~= 1 and strConsumeFailMessage then
		Talk(1, "", strConsumeFailMessage)
		return
	end
	PlayerFunLib:AddTaskDaily(nTSK_DAILY_REFINE_LIMIT, 1)
	local nNextEquipIdx = AddGoldItem(0, nGoldEquipID)
	if nNextEquipIdx <= 0 then
		Msg2Player("重练紫蟒失败，失去一些原料!")
		tbLog:PlayerActionLog("重练紫蟒","AddTrangBiThatBai", "", "", "", SubWorld)
		return
	end
	Msg2Player("<color=green>重练紫蟒成功，请检查装备")
	tbLog:PlayerActionLog("重练紫蟒","Add装备成功", GetItemName(nNextEquipIdx), GetGlodEqIndex(nNextEquipIdx), 1, SubWorld)
end

function tbVNG_RefineEquip:CheckItems(tbGold, tbStone)
	--检查放入的黄金装备
	if getn(tbGold) > 1 or getn(tbGold) <= 0 then
		return 0, "每次只能重练一次紫蟒装备"
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGold[1])
	
	--放入的不是紫蟒装备
	if not tbRE_Formula[nGoldEquipID] then
		return 0, "装备放入不合理，请大侠检查."
	end
	
	--检查锁的状态
	local nBindState = GetItemBindState(tbGold[1])
	if nBindState ~= 0 then
		return 0, "装备正处于永久锁住状态，不能重练!."
	end
	
	--检查
	local nG, _, _ = GetItemProp(tbGold[1])
	if nG == 7 then
		return 0, "装备坏了，不能重练!."
	end
	
	--检查玉的数量
	local nStoneRequire = tbRE_Formula[nGoldEquipID].nStoneRequire
	if getn(tbStone) ~= nStoneRequire then
		return 0, "原料不足，不能重练!"
	end	
	
	--检查放入的玉的合理性
	for i = 1, getn(tbStone) do
		if self:CheckStone(tbStone[i]) ~= 1 then
			return 0, "放入的物品不合理，请检查!"
		end
	end	
	
	return 1
end

function tbVNG_RefineEquip:CheckStone(nStoneIdx)
	local nG, nD, nP = GetItemProp(nStoneIdx)
	if nG ~= tbSTONE_GDP.nG or nD ~= tbSTONE_GDP.nD or nP ~= tbSTONE_GDP.nP then
		return 0
	end
	return 1
end

function tbVNG_RefineEquip:ConsumeItems(tbGold, tbStone)
	--consume stones
	local nStoneIdx = 0
	local nStoneRemoved = 0
	for i = 1, getn(tbStone) do
		nStoneIdx = tbStone[i]
		local nG, nD, nP = GetItemProp(nStoneIdx)
		local strItemCode = nG..", "..nD..", "..nP
		local strStoneName = GetItemName(nStoneIdx)
		if IsMyItem(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("重练紫蟒","物品不在身上", strStoneName, strItemCode, 1, SubWorld)
			return 0, "物品不在身上，重练失败，失去一些物品!!"
		end
		if RemoveItemByIndex(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("重练紫蟒","删除原料失败", strStoneName, strItemCode, 1, SubWorld)
			return 0, "重练紫蟒失败，失去一些原料!"
		else			
			tbLog:PlayerActionLog("重练紫蟒","删除原料成功", strStoneName, strItemCode, 1, SubWorld)
			nStoneRemoved = nStoneRemoved + 1
		end
	end
	if nStoneRemoved ~= getn(tbStone) then
		tbLog:PlayerActionLog("重练紫蟒","重练失败", "放入玉的数量不同步")
		return 0, "重练紫蟒失败，失去一些原料!"
	end
	--consume gold equip
	local nGoldEquipIdx = tbGold[1]
	local strEquipName = GetItemName(nGoldEquipIdx)
	local nEquipID = GetGlodEqIndex(nGoldEquipIdx)
	if IsMyItem(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("重练紫蟒","装备不在身上", strEquipName, nEquipID, 1, SubWorld)
		return 0, "物品不在身上，重练失败，失去一些物品!!"
	end
	
	if RemoveItemByIndex(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("重练紫蟒","删除装备失败", strEquipName, nEquipID, 1, SubWorld)
		return 0, "重练失败，失去一些物品!!"
	else	
		tbLog:PlayerActionLog("重练紫蟒","成功删除装备", strEquipName, nEquipID, 1, SubWorld)
		return 1
	end	
end

function OnCancel()
end