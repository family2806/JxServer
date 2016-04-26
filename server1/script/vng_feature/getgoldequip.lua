--function 帮助奖励黄金装备- Updated by DinhHQ - 20110920
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
tbVNEquiptInfo =
{
	[1] = 
		{
			strType = "青驹",
			nStartIndex = 905,
		},
	[2] =
		{
			strType = "云鹿",
			nStartIndex = 1135,
		},
	[3] =
		{
			strType = "苍狼",
			nStartIndex = 1365,
		},
	[4] =
		{
			strType = "玄猿",
			nStartIndex = 1595,
		},
	[5] =
		{
			strType = "紫莽",
			nStartIndex = 1825,
		},
	[6] =
		{
			strType = "金乌",
			nStartIndex = 2055,
		},
	[7] =
		{
			strType = "白虎",
			nStartIndex = 2285,
		},
	[8] =
		{
			strType = "金乌 (Max Option)",
			nStartIndex = 3235,
		},
}
--选择主导进攻的武器
tbVNFactionBranch = 
	{
		"少林拳法",
		"少林棍法",
		"少林刀法",
		"天王锤法",
		"天王枪法",
		"天王刀法",
		"峨眉剑法",
		"峨眉掌法",
		"翠烟刀法",
		"翠烟双刀",
		"五毒掌法",
		"五毒刀法", --12
		"唐门飞刀",
		"唐门弩箭",
		"唐门飞镖",
		"丐帮掌法",
		"丐帮棍法",
		"天忍矛法",
		"天忍刀法",
		"武当拳法",
		"武当剑法",
		"昆仑刀法",
		"昆仑剑法",
	}
	
tbVNBranchGroupByFaction = {
	[0] = {1, 2, 3},
	[1] = {4, 5, 6},
	[2] = {13, 14, 15},
	[3] = {11, 12},
	[4] = {7, 8},
	[5] = {9, 10},
	[6] = {16, 17},
	[7] = {18, 19},
	[8] = {20, 21},
	[9] = {22, 23},
}
	
tbVnItemPos = {
	AMULET = 0,
	HELM = 1,
	UPPER_RING = 2,	
	CUFF = 3,
	BELT = 4,
	ARMOUR = 5,
	WEAPON = 6,
	BOOT = 7,
	PENDANT = 8,
	LOWER_RING = 9,
	WHOLE_SET = 10,
}

tbVnItemName = {
	[1] = {"项链", 0},
	[2] = {"顶帽", 1},
	[3] = {"上戒指", 2},
	[4] = {"护腕", 3},
	[5] = {"腰带", 4},
	[6] = {"衣服", 5},
	[7] = {"武器", 6},
	[8] = {"鞋子", 7},
	[9] = {"玉佩", 8},
	[10] = {"下戒指", 9},	
}

tbVnItemName2 = 
{
	[0] = "项链",
	[1] = "顶帽", 
	[2] = "上戒指",
	[3] = "护腕",
	[4] = "腰带",
	[5] = "衣服",
	[6] = "武器",
	[7] = "鞋子",
	[8] = "玉佩",
	[9] = "下戒指",
}

tbVnFreeCellBag = {
	[0] = {nW = 2, nH = 1},
	[1] = {nW = 2, nH = 2},
	[2] = {nW = 1, nH = 1},
	[3] = {nW = 1, nH = 2},
	[4] = {nW = 2, nH = 1},
	[5] = {nW = 2, nH = 3},
	[6] = {nW = 2, nH = 4},
	[7] = {nW = 2, nH = 2},
	[8] = {nW = 1, nH = 2},
	[9] = {nW = 1, nH = 1},
}
	
tbVNGetGoldEquip = {}

function tbVNGetGoldEquip:ShowEquipTypeDialog(tbItemProp)
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "请选择装备类型 "
	for i = 1, getn(tbVNEquiptInfo) do
		tbDailog:AddOptEntry("请选择"..tbVNEquiptInfo[i].strType, self.ShowEquipBranchDialog, {self, i, tbItemProp})
	end
	tbDailog:Show()	
end

function tbVNGetGoldEquip:ShowSpecItemDialog(nType, tbItemProp)
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "请选择:"
	for i = 1, getn(tbVnItemName) do
		tbDailog:AddOptEntry(tbVnItemName[i][1], self.SelectSpecItem, {self, nType, tbItemProp, tbVnItemName[i][2]})
	end
	tbDailog:Show()	
end

function tbVNGetGoldEquip:SelectSpecItem(nType, tbItemProp, nItemType)
	tbItemProp.nSpecificItem = nItemType
	print(nItemType)
	self:ShowEquipBranchDialog(nType, tbItemProp)
end

function tbVNGetGoldEquip:ShowEquipBranchDialog(nType, tbItemProp)		
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "请选择主导进攻类型:"
	for nBranch = 1, 12 do
		tbDailog:AddOptEntry(tbVNFactionBranch[nBranch], self.GetGoldEquip, {self, nType, nBranch, tbItemProp})
	end
	tbDailog:AddOptEntry("下一页", self.ShowEquipBranchDialog2, {self, nType, tbItemProp})
	tbDailog:Show()	
end

function tbVNGetGoldEquip:ShowEquipBranchDialog2(nType, tbItemProp)	
	local tbDailog = DailogClass:new()
	for nBranch = 1, 11 do
		tbDailog:AddOptEntry(tbVNFactionBranch[nBranch + 12], self.GetGoldEquip, {self, nType, nBranch + 12, tbItemProp})
	end
	tbDailog:AddOptEntry("返回", self.ShowEquipBranchDialog, {self, nType, tbItemProp})
	tbDailog:Show()	
end

function tbVNGetGoldEquip:ShowEquipBranchByFaction(nType, tbItemProp, nFaction)		
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "请选择主导进攻类型:"
	local nCount = getn(tbVNBranchGroupByFaction[nFaction])
	if not nCount then
		return
	end
	local nBranch = 0
	for i = 1, nCount do
		nBranch = tbVNBranchGroupByFaction[nFaction][i]
		tbDailog:AddOptEntry(tbVNFactionBranch[nBranch], self.GetGoldEquip, {self, nType, nBranch, tbItemProp})
	end
	tbDailog:Show()	
end

function OnCancel()
end

function tbVNGetGoldEquip:GetGoldEquip(nType, nBranch, tbItemProp)
	if not tbItemProp	then
		print("tbItemProp is nil")
		return
	end		

	local nStartIDx = tbVNEquiptInfo[nType].nStartIndex + ((nBranch - 1) * 10)
	local nSpecificItem = tbItemProp.nSpecificItem or tbVnItemPos.WHOLE_SET	
	--检查装备	
	if tbItemProp.nIsSkipRoomCheck and tbItemProp.nIsSkipRoomCheck == -1 then	
	else
		if nSpecificItem == tbVnItemPos.WHOLE_SET then
			if CalcFreeItemCellCount() < 59 then
				Talk(1, "", "请清空装备，然后领奖.")
				return
			end		
		else
			if CountFreeRoomByWH(tbVnFreeCellBag[nSpecificItem].nW, tbVnFreeCellBag[nSpecificItem].nH, 1) < 1 then
				Talk(1, "", format("请留下 <color=red>%d x %d <color> 装备空位，然后领奖.", tbVnFreeCellBag[nSpecificItem].nW, tbVnFreeCellBag[nSpecificItem].nH))
				return
			end
		end
	end
	
	if tbItemProp.nItem2Consume then
 		if IsMyItem(tbItemProp.nItem2Consume) ~= 1 or RemoveItemByIndex(tbItemProp.nItem2Consume) ~= 1 then
 			return
 		end
	end
	
	--1 m鉵
	if nSpecificItem >= 0 and nSpecificItem < tbVnItemPos.WHOLE_SET then
		local tbAward = {}
		tbAward.tbProp={0,nStartIDx + nSpecificItem}
		tbAward.nQuality = 1
		if tbItemProp.nBindState then
			tbAward.nBindState = tbItemProp.nBindState
		end
		if tbItemProp.nExpiredTime then
			tbAward.nExpiredTime = tbItemProp.nExpiredTime
		end
		if tbItemProp.tbTransLog then
			local tbTransLog = tbItemProp.tbTransLog
			tbAward.CallBack = function(nItemIdx)
				%tbVngTransLog:Write(%tbTransLog.strFolder, %tbTransLog.nID, %tbTransLog.strAction, GetItemName(nItemIdx), 1)
			end
		end		
		if tbItemProp.tbLog then
			tbAwardTemplet:Give(tbAward, 1, tbItemProp.tbLog)		
		else
			tbAwardTemplet:Give(tbAward, 1)		
		end
		return
	end
	--c?b?
	local nEndIDx = nStartIDx + 9
	for i = nStartIDx, nEndIDx do
		local tbAward = {}
		tbAward.tbProp={0,i}
		tbAward.nQuality = 1
		if tbItemProp.nBindState then
			tbAward.nBindState = tbItemProp.nBindState
		end
		if tbItemProp.nExpiredTime then
			tbAward.nExpiredTime = tbItemProp.nExpiredTime
		end
		if tbItemProp.tbTransLog then
			local tbTransLog = tbItemProp.tbTransLog
			tbAward.CallBack = function(nItemIdx)
				%tbVngTransLog:Write(%tbTransLog.strFolder, %tbTransLog.nID, %tbTransLog.strAction, GetItemName(nItemIdx), 1)
			end
		end		
		if tbItemProp.tbLog then
			tbAwardTemplet:Give(tbAward, 1, tbItemProp.tbLog)		
		else
			tbAwardTemplet:Give(tbAward, 1)		
		end		
	end
end

function tbVNGetGoldEquip:UpgradeEquip(tbParam)
	g_GiveItemUI("换装备", "", {self.GiveUIOk, {self, tbParam}}, nil, tbParam.bAccessBindItem)
end

function tbVNGetGoldEquip:GiveUIOk(tbParam, nCount)
	if GetFightState() ~= 0 then
		Talk(1, "", "该操作只能在非战斗区域执行")
		return
	end
	if nCount <= 0 or nCount > 1 then
		Talk(1, "", "每次只能换一个装备")
		return
	end
	local nItemIdx = GetGiveItemUnit(1)
	if nItemIdx <= 0 then
		return
	end
	local nItemSettingIdx = GetGlodEqIndex(nItemIdx)
	--检查放入装备是否对了
	if (nItemSettingIdx < tbVNEquiptInfo[tbParam.nOldType].nStartIndex) or (nItemSettingIdx > (tbVNEquiptInfo[tbParam.nOldType].nStartIndex + 229)) then
		Talk(1, "", format("只能换装备 <color=red>%s<color>", tbVNEquiptInfo[tbParam.nOldType].strType))
		return
	end
	--检查不能换的item
	if tbParam.tbExclude then
		local nItemType = mod(nItemSettingIdx - tbVNEquiptInfo[tbParam.nOldType].nStartIndex, 10)		
		for i = 1, getn(tbParam.tbExclude) do
			if nItemType == tbParam.tbExclude[i] then
				Talk(1, "", "不能换 "..tbVnItemName2[nItemType])
				return
			end
		end
	end
	
	if tbParam.pCallBack then
		tbParam.pCallBack()
	end
	nNewIdx = nItemSettingIdx + 230 * (tbParam.nNewType - tbParam.nOldType)
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	local tbAward = {tbProp={0,nNewIdx},nCount=1,nQuality = 1,}
	if tbParam.nBindState then
		tbAward.nBindState = tbParam.nBindState
	end
	tbAwardTemplet:Give(tbAward, 1, tbParam.tbLog)
end