--description: 天忍教圣洞二层宝箱 天忍教出师任务
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) then
		if (HaveItem(132) == 1) then
			Talk(1,"","宝箱已空")
		elseif (HaveItem(102) == 1) then
			DelItem(102)
			AddEventItem(132)
--			SetTask(4, 68)
			AddNote("打开宝箱，得到天忍圣羊皮书一卷")
			Msg2Player("打开宝箱，得到羊皮书一卷 ")
		else
			Talk(1,"","没有钥匙，打不开宝箱.")
		end
	else
		Talk(1,"","没有钥匙，打不开宝箱.")
	end
end;
