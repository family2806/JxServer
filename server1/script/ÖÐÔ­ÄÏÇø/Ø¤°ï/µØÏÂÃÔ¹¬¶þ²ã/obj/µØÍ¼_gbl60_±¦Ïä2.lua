-- 丐帮秘洞 宝箱2 出师任务（二楼，两个，对应布袋3）
-- by：Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		if (HaveItem(208) == 0) and (random(0,99) < 50) then
			Msg2Player("你打开箱子，获得一个布袋")
			AddEventItem(208)
			AddNote("获得第三个布袋")
		else
			Msg2Player("这个箱子内没有什么 ")
		end
	else
		Talk(1,"","这个箱子锁了")
	end
end;
