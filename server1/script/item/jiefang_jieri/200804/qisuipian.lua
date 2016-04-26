-- 文件名　：qisuipian.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-15 10:58:58
--旗的碎片 

--使用方法：右键点击使用后将会领取304经验值304 经验点 （304是指4月30日的意思）
--使用截止时间：2008年05月31日24点00分
--限制：
--- 玩家的任何等级都能使用此类物品。
--- 充值玩家才能使用。
---升级后经验不叠加
--- 活动期间，一个玩家最多能使用1975个。
--SetSpecItemParam(nItemIndex, 1, tonumber(GetLocalDate("%Y%m%d")) )
--SetSpecItemParam(nItemIndex, 2, tonumber(GetLocalDate("%Y")) )
--SetSpecItemParam(nItemIndex, 3, tonumber(GetLocalDate("%m")) )
--SetSpecItemParam(nItemIndex, 4, tonumber(GetLocalDate("%d")) )


IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
function main(nItemIndex)
	jiefang_0804_ResetTask()
	
	local nItemData	= 20080531
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate > nItemData then
		Msg2Player("物品使用过期，自动消失.")
		return 0;
	end
	
	if IsCharged() == 0 then
		Say("只有已充值玩家才能使用.", 0)
		return 1;
	end
	local nCurFlagCount = GetTask(jiefang_0804_TSK_FlagCount)
	if nCurFlagCount >= jiefang_0804_TSKV_FlagCount then
		Say(format("已使用 %d 该物品，已达到使用上限.", jiefang_0804_TSKV_FlagCount), 0)
		return 1
	end
	AddOwnExp(304)
	SetTask(jiefang_0804_TSK_FlagCount, nCurFlagCount + 1)
	return 0;
end