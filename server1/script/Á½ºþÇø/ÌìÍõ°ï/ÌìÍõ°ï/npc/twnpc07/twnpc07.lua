--description: 天王帮水生
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 1) then
			Talk(3, "", "我最爱吃卤鸡蛋了，可是我家太穷，买不起鸡蛋", "小朋友，我这里有三个鸡蛋，送给你吧", "好！记得要守诺言啊。")
			AddNote("同意把鸡蛋给水生，水生帮忙抓虫")
			Msg2Player("同意把鸡蛋给水生，水生帮忙抓虫")
			SetTask(14, 3)
		elseif (UTask_tw40sub == 7) and (HaveItem(149) == 1) then	-- 子任务完成
			Talk(3, "", "我已经抓到蚯蚓了，可以给我鸡蛋了吗", "小朋友！这3个鸡蛋给你!", "多谢大哥!这里有5条蚯蚓!")
			DelItem(149)
			AddEventItem(150)
			Msg2Player("得到5条蚯蚓 ")
			SetTask(14, 9)
			AddNote("给水生鸡蛋得到5条蚯蚓")
		elseif (UTask_tw40sub == 0) then
			Talk(1, "", "我最爱吃卤鸡蛋了，可是我家太穷，买不起鸡蛋")
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 0) then
			AddEventItem(150)
			Talk(2,"","小朋友！我不小心弄丢了蚯蚓，你能不能帮我再抓几只?","还好，我得空又抓了5只蚯蚓，送给你!")
		elseif (UTask_tw40sub >= 9) then
			Talk(1, "", "谢谢大哥给我鸡蛋")
		else
			Talk(1,"","这里有几条蚯蚓你就给我几个鸡蛋好吗?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","我长大了以后也要像杨叔叔、王伯伯他们那样做人人敬重的大英雄")
		else
			Talk(1,"","昨天我求杨叔叔教我功夫，可是他说我还小，我什么时候才能长大呢?")
		end
	end
end;
