--zhongchaolong
--明月酒
--角色使用明月酒后会两倍扩展通过2中月饼【 见月月饼 】和【 赏月月饼 】的经验限制 （从15亿到30亿经验。
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("该物品已过使用期.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("要求50级以上且已充值", 0)
		return 1
	end
	if GetTask(zhongqiu0808_TSK_mingyuejiu) == 1 then
		Say("您已使用该道具了.")
		return 1
	end
	
	SetTask(zhongqiu0808_TSK_mingyuejiu, 1)
	Msg2Player("使用明月酒后，建月中秋月饼和赏月中秋月饼的经验上限将增到30亿.")
end