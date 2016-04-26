--月饼
--zhongchaolong
--性质：
--可以：丢弃，交易，摆摊，卖店（0两），叠加 
--物品上的说明：
--“一种普通的月饼”
--使用方法： 右键点击使用
--使用截止时间： 2008年10月31日24点
--限制： 
--50级以上的充值玩家才能使用
--每个角色最多只能通过使用【 望月月饼 】获得2亿经验 





Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("该物品已过使用期.",0)
		return 0;
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("为避免财产损失，请确保装备还剩%d 空位.", nCellFreeLimit),0)
		return 1
	end
	
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("要求需要50级以上且充值", 0)
		return 1
	end
	local nCurExp = GetTask(zhongqiu0808_TSK_jiansanyue)
	
	if nCurExp >= zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) then
		Say(format("使用该物品已达上限%u 经验.", 1e6 * zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) ), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(zhongqiuyubing_tbAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_jiansanyue, nCurExp + floor(zhongqiuyubing_tbAward[1].nExp/1e6))
end