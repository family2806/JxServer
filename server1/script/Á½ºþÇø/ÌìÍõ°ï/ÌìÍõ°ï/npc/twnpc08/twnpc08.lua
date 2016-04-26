--description: 天王帮老渔翁
--author: yuanlan
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40级任务
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 0) then		-- 子任务启动
			Talk(4,"","老人家，这是你钓到的绿毛龟吗?","是啊，今天真幸运，这可不是容易碰到的事情呢!","在下正要用它做药救人呢，你可以把它给我吗?","今天带的鱼饵好像不够，你要是给我找几条蚯蚓我就把它给你!")
			AddNote("接挖蚯蚓换绿毛龟任务")
			Msg2Player("找几只绿毛龟回去给老渔翁就可以换到绿毛龟")
			SetTask(14,1)
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 1) then
			Talk(3, "", "如何？有蚯蚓了吗？", "老人家！你看这些够吗?", "很好，绿毛龟送给你了!")
			DelItem(150)
			AddEventItem(94)
			Msg2Player("找到绿毛龟")
			SetTask(14,10)
			AddNote("带来蚯蚓送给钓鱼翁换来绿毛龟")
		elseif (UTask_tw40sub >= 10) then
			if (HaveItem(94) == 0) then
				AddEventItem(94)
				Talk(2,"","老人家，你送给我的绿毛龟我弄丢了!","啊！你怎么这么好运呢！我刚刚钓到一只，你赶快拿去救人!")
			else
				Talk(1,"","老汉我每天都在这钓鱼，这里的鱼都知道我")
			end
		else
			if (UTask_tw40sub ~= 0) and (UTask_tw40sub ~= 1) and (UTask_tw40sub ~= 3) and (UTask_tw40sub ~= 5) and (UTask_tw40sub ~= 7) and (UTask_tw40sub ~= 9) and (UTask_tw40sub ~= 10) then
				SetTask(14,0)
				Talk(1,"","小子，看你气色不是很好，还是先休息一下，有什么慢慢说. ")
			else
				Talk(1,"","给我找几条蚯蚓我就把绿毛龟送给你. ")
			end
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","轻点，不要惊动了我的鱼! ")
		else
			Talk(1,"","老汉我每天都在这钓鱼，这里的鱼都知道我")
		end
	end
end;
