-- 随机圣诞礼品盒（随机获得一个节日面具）
-- By: zhengfei(2004-12-13)

function main(sel)
	p=random(0,99)
	if (p < 50) then
		AddItem(0,11,70,0,0,0,0)		-- 圣诞老人
		Msg2Player("圣诞快乐！你得到了一个圣诞老人的面具哦！")
	else
		AddItem(0,11,71,0,0,0,0)	        -- 圣诞天使
		Msg2Player("圣诞快乐！你得到了一个圣诞天使的面具哦！")
	end
	return 0
end
