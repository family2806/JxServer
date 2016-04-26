--------------------------------------------------------------------
-- 玩家操作脚本，主要响应界面操作
--------------------------------------------------------------------
TIME_2000_1_1 = 946656000;
function BIND_ITEM(itemIdx)
	local g = GetItemProp(itemIdx)
	--必须是装备或损坏的装备
	if g ~= 0 and g ~= 7 then
		Say("只能给装备锁保险", 0)
		return
	end
	--生成回调参数
	local szFunStep2 = "/#BIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState < 0 then
		Say("该装备正处于锁保险状态，不需要再锁了!", 0)
	elseif nBindState > 0 then
		
		if (nBindState > (floor((GetCurServerTime() - TIME_2000_1_1) / 3600)) ) then
			Say("该物品等锁时间<color=green> 超过168个小时 <color>, 暂时不能开锁!", 0)
			return
		end
		
		Say("该物品正处于已开保险锁状态，想继续锁吗?", 2, "同意"..szFunStep2, "不想/cancel")
	else
		Say("当装备被锁，不能交易，丢弃或者放任对话盒。同时，不允许制造，尤其是当PK时将不会掉落。被锁保险的装备依然有平常的作用，穿戴，修理需要通过 <color=yellow>开保险锁<color> (装备界面的“解”键。但是，<color=green>168小时后<color> 才能完全开锁.", 
			2, "我想锁装备保险"..szFunStep2, "让我看看/cancel")
	end
end

function BIND_ITEM_2(itemIdx, nGenTime)
	--校验是否先前的物品
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		
		return 
	end
	if BindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("你已成功锁了一个装备保险")
	end
end

function UNBIND_ITEM(itemIdx)
	--生成回调参数
	local szFunStep2 = "/#UNBIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState == 0 then
		Say("该物品不能锁保险!", 0)
	elseif nBindState > 0 then
		Say("该物品正处于开锁状态，不需要再开了!", 0)
	elseif nBindState == -1 then
		Say("在点击“解”键开保险锁时，需要等<color=green>168小时<color> 后才能完全开锁", 
			2, "我同意开保险锁"..szFunStep2, "让我看看/cancel")
	else
		Say("该物品被永久锁保险，不能开锁!", 0)
	end
end

function UNBIND_ITEM_2(itemIdx, nGenTime)
	--校验是否先前的物品
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		return 
	end
	if UnBindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tUnBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("要求开保险锁已发。168小时后将自动完全开锁.")
	end
end

function cancel()
end