-- 随机宝箱物品（随机获得一样物品）
-- By: Yuning_liu(2005-03-21)

function main(sel)
	p=random(0,99)
	if (p < 1) then
		p = random(238,240)
		AddEventItem(p)			-- 水晶
		Msg2Player("你得到一颗水晶！")
	elseif (p < 2) then
		AddEventItem(353)			-- 猩红
		Msg2Player("你得到一颗猩红宝石！")
	elseif (p < 33) then
		AddItem(6,1,15,1,0,0,0)		-- 披风
		Msg2Player("你得到一件披风！")
	elseif (p < 66) then
		AddItem(6,1,18,1,0,0,0)		-- 心心相印
		Msg2Player("你得到一只心心相印符！")
	else
		AddItem(6,0,20,1,0,0,0)		-- 玫瑰雨
		Msg2Player("你得到一朵玫瑰花！")
	end
	return 0
end
