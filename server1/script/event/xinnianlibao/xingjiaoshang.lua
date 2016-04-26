-- 行脚商人脚本
-- 2005-12-07 for newyear gift

function main()

	Say("客官需要消灭宝物尽管打开<color=yellow>奇珍阁<color> 选择就行。老夫我终于可以休息了!", 0);
	return

--	Say("行脚商人：这位客官，快过年了准备年货是吧？我这儿新进的一批年货<color=yellow>“冬日浓情大礼包”<color>，经济实惠，走亲串友或您留着自己用都合适阿，随便看看吧！", 
--	6,
--			"购买元旦道具礼包/buy_yuandan",
--			"购买同伴面具礼包/buy_partnermask",
--			"购买随机任务礼包/buy_randomtask",
--			"购买同伴技能书礼包/buy_skillbook",
--			"购买白驹丸礼包/buy_baijuwan",
--			"我就是看看/OnCancel")
end

function OnCancel()
end

function buy_partnermask()
	Sale(132, 3)
end

function buy_randomtask()
	Sale(133, 3)
end

function buy_skillbook()
	Sale(134, 3)
end

function buy_baijuwan()
	Sale(135, 3)
end

function buy_yuandan()
	Sale(137, 3)
end