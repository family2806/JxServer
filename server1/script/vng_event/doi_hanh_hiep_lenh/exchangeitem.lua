Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
tbVng_Exchange_HHL = {}
--tbVng_Exchange_HHL.nStartDate = 201109220000
--tbVng_Exchange_HHL.nEndDate = 201110222400

function tbVng_Exchange_HHL:IsActive()
--	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
--	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
--		return nil
--	end
--	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
--		return nil
--	end
	return 1
end

function tbVng_Exchange_HHL:AddDialog(tbDialog)
	if self:IsActive() ~= 1 then
		return
	end
--	tbDialog:AddOptEntry("恢复行侠令", tbVng_Exchange_HHL.Recover_Item_UI, {tbVng_Exchange_HHL})
end

function OnCancel() end

function Do_Recover(nCount)
	if GetFightState() ~= 0 then
		return
	end
	local nItemCount = 0	
	for i = 1, nCount do
		local nIdx = GetGiveItemUnit(i)
		local nG, nD, nP = GetItemProp(nIdx)
		if nG ~= 6 or nD ~= 1 or nP ~= 2566 then
			Talk(1, "", "我只给你恢复 <color=red>行侠令<color>. 你放入的物品不对")
			return
		else
			nItemCount = nItemCount + GetItemStackCount(nIdx)			
		end
	end
	if nItemCount <= 0 then
		return
	end
	
	for i = 1, nCount do
		local nIdx = GetGiveItemUnit(i)
		local nRemovedCount = GetItemStackCount(nIdx)
		if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
			Talk(1, "", "操作失败，失去一些原料.")
			return
		else
			tbLog:PlayerActionLog("恢复行侠令", "删除旧行侠令", "SoLuong: "..nRemovedCount)
		end		
	end
	local tbAward = {szName = "行侠令", tbProp = {6,1,2566,1,0,0}, nCount = nItemCount}
	tbAwardTemplet:Give(tbAward, 1, {"恢复行侠令", "领取新行侠令"})
end

function tbVng_Exchange_HHL:Recover_Item_UI()
	GiveItemUI("行侠令奖励", "请放入行侠令", "Do_Recover", "OnCancel")
end
