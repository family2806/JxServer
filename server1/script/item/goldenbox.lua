-- 随机宝箱物品（随机获得一样物品）
-- By: Dan_Deng(2004-06-01)

function main(sel)
	p=random(0,99)
	if (p < 5) then
		p = random(238,240)
		AddEventItem(p)			-- 水晶
		Msg2Player("你得到一颗水晶！")
	elseif (p < 10) then
		AddEventItem(353)			-- 猩红
		Msg2Player("你得到一颗猩红宝石！")
	elseif (p < 20) then
		AddItem(6,1,15,1,0,0,0)		-- 披风
		Msg2Player("你得到一件披风！")
	elseif(p < 40) then
		AddItem(6,1,18,1,0,0,0)		-- 心心相印
		Msg2Player("你得到一只心心相印符！")
	elseif (p < 65) then
		AddItem(6,1,19,1,0,0,0)		-- 吉祥包
		Msg2Player("你得到一个猴年吉祥包！")
	else
		AddItem(6,0,20,1,0,0,0)		-- 玫瑰雨
		Msg2Player("你得到一朵玫瑰花！")
	end
	return 0
end
