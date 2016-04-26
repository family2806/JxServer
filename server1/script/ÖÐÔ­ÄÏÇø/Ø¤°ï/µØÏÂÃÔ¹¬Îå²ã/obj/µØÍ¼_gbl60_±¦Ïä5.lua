-- 丐帮秘洞 宝箱5 出师任务（五楼，两个，对应布袋8、布袋9）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(202) == 1)) then
		Msg2Player("你打开箱子看看 ")
		DelItem(202)
		i = 0
		if (HaveItem(200) == 0) and (random(0,99) < 30) then
			AddEventItem(200)
			AddNote("你获得第8个布袋 ")
			i = i + 1
		end
		if (HaveItem(205) == 0) and (random(0,99) < 30) then
			AddEventItem(205)
			AddNote("拿到第9个布袋 ")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("你获得两个布袋")
		elseif (i == 1) then
			Msg2Player("你获得一个布袋 ")
		else
			Msg2Player("你很失望，因为箱子空空.")
		end
	else
		Talk(1,"","箱子锁了")
	end
end;
