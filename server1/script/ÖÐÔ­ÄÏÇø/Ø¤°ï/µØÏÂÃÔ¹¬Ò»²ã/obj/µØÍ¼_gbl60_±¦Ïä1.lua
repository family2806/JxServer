-- 丐帮秘洞 宝箱1 出师任务（一楼，一个，对应布袋1、布袋2）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 1) then
		Msg2Player("打开箱子看看 ")
		DelItem(203)
		i = 0
		if ((HaveItem(211) == 0) and (random(0,99) < 60)) then
			AddEventItem(211)
			AddNote("获得第一个布袋 ")
			i = i + 1
		end
		if ((HaveItem(201) == 0) and (random(0,99) < 60)) then
			AddEventItem(201)
			AddNote("获得第二个布袋")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("你获得2个布袋 ")			
		elseif (i == 1) then
			Msg2Player("你获得一个布袋 ")			
		else
			Msg2Player("你很失望，因为箱子空空.")
		end
	else
		Talk(1,"","箱子锁了")
	end
end;
