-- 大理　路人　花农
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-24) 拳倾天下任务

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub2 = GetTask(53)
	if (Uworld75 == 10) and (U75_sub2 < 10) then		-- 任务中，接取子任务
		if (HaveItem(384) == 1) then
			SetTask(53,10)
			AddNote("拳倾天下任务：去药王谷帮花农摘3朵锦苜蓿. ")
			Msg2Player("拳倾天下任务：去药王谷帮花农摘3朵锦苜蓿. ")
			Talk(1,"","落师兄又来考验你？太好了，大理四季花香，还少药王谷的极品紫苜蓿，你去帮我摘3朵回来")
		else
		 	Talk(1,"","一封信也没有，无凭无据，叫我怎么相信你?")
		end
	elseif (Uworld75 == 10) and (U75_sub2 == 10) then		-- 子任务完成判断
		if (GetItemCount(112) >= 3) then
			DelItem(112)
			DelItem(112)
			DelItem(112)
			SetTask(53,20)
			AddNote("拳倾天下任务：完成摘锦苜蓿. ")
			Msg2Player("拳倾天下任务：完成摘锦苜蓿. ")
			Talk(1,"","真是好，真是一品，我会派人去通报落师兄，说我同意了.")
		else
			Talk(1,"","还没找到啊?")
		end
	else
		i = random(0,99)
		if (i < 25) then
			Talk(1,"","云南茶花天下第一，大理茶花云南第一，我们大理人眼中的茶花天下第一，牡丹也不能比.")
		elseif (i < 50) then
			Talk(1,"","大理家家户户都种茶花，每年都组织花卉展览.")
		elseif (i < 75) then
			Talk(1,"","全大理最美的花茶由姓段的老翁种植，他生活在洱海边的一座小屋内。他的花每年都参加展会，都被选为最美的花.")
		else
			Talk(1,""," 段老翁一生爱华，他只卖花给与他有缘的人，其他人即使有金山银山，他都不卖.")
		end
	end
end;
