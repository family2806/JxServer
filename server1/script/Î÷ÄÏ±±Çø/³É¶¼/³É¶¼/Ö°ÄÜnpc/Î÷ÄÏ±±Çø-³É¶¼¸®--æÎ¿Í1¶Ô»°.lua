-- 西南北区 成都府 嫖客1对话.lua　（方适：拳倾天下任务）
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	if (Uworld75 == 10) and (U75_sub1 < 10)then		-- 任务中，接取子任务
		 if (HaveItem(384) == 1) then
			SetTask(52,10)
			AddNote("拳倾天下任务 : 去雁荡山帮方适抓7只蜘蛛")
			Msg2Player("拳倾天下任务: 去雁荡山帮方适抓7只蜘蛛")
			Talk(1,""," 大师兄允许了就去做。我想试试你，你去雁荡山帮方适抓7只蜘蛛.")
		 else
		 	Talk(1,"","连封信都没有，叫我怎么相信你?")
		end
	elseif (Uworld75 == 10) and (U75_sub1 == 10) then		-- 子任务完成判断
		if (GetItemCount(86) >= 7) then
			for i = 1,7 do DelItem(86) end
			Talk(1,"","这个真是我要的蜘蛛，太好了，太好了。我以为你遇到什么问题了!")
			SetTask(52,20)
			AddNote("拳倾天下任务: 抓7只蜘蛛任务. ")
			Msg2Player("拳倾天下任务: 抓7只蜘蛛任务. ")
		else
			Talk(1,"","我给你的任务难吗?")
		end
	else
		Talk(1,"","嫖客：我来成都做点小买卖，辛辛苦苦地赚了些钱，本打算回乡成亲的，没想到色迷心窍，把钱全花在了妓院。")
	end
end;
