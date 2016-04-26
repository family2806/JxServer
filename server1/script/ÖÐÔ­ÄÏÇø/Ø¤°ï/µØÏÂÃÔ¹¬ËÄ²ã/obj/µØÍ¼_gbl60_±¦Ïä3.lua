-- 丐帮秘洞 宝箱3 出师任务（四楼，两个，对应布袋4、布袋5）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		Msg2Player("打开箱子.")
		i = 0
		if ((HaveItem(209) == 0) and (random(0,99) < 40)) then
			AddEventItem(209)
			AddNote("你获得4个布袋")
			i = i + 1
		end
		if ((HaveItem(210) == 0) and (random(0,99) < 40)) then
			AddEventItem(210)
			AddNote("你获得 5个布袋")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("你获得 2个布袋")
		elseif (i == 1) then
			Msg2Player("你获得 1个布袋")
		else
			Msg2Player("你失望因为箱子空空的.")
		end
	else
		Talk(1,"","箱子锁了")
	end
end;
