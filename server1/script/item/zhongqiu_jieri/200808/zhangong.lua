--zhongchaolong

--战功
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("该物品已过期.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("必须是50级以上的充值玩家", 0)
		return 1
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("为避免财产损失，请确保装备还剩 %d 空位.", nCellFreeLimit),0)
		return 1
	end
	
	local nCurExp = GetTask(zhongqiu0808_TSK_ZhangGongExp)
	
	if nCurExp >= zhongqiu0808_TSKV_ZhangGongMaxExp then
		Say(format("使用该物品已达上限%d经验.", zhongqiu0808_TSKV_ZhangGongMaxExp), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(tbItemAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_ZhangGongExp, nCurExp + tbItemAward[1].nExp)
end