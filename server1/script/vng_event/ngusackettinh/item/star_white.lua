Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

tbNSKT_star_white = {}

function main(itemidx)
	--检查使用物品条件
	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "你不够条件使用物品，要求50级以上充值用户")
		return 1
	end
	-- het event, 物品使用到期
	if (tbNSKT_Item_Star:isExpired(itemidx) == 1) then
		Msg2Player("物品使用过期，自动消失.")
		return 0; -- delete item
	end
	-- 使用物品成功，删除item
	if (tbNSKT_star_happiness:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "大侠已最大限度使用该物品了!")
		return 1 -- 不删除 item	
	end
end

function tbNSKT_star_white:UseItem()
	if (tbNSKT_Item_Star and tbNSKT_Item_Star:isMaxItemUse() == 0 ) then
		--不能设置task, 不奖励, 删除物品
		if (tbNSKT_Item_Star:setUseCount() ~= 1)then
			return 1;
		end
		local tbAwardExp = {nExp = 50e6} --50 trieu exp
		tbNSKT_Item_Star:giveAward(tbAwardExp, "白星星经验奖励");
		return 1;
	end
	return 0; --使用 max, 不能使用, 不能删除
end