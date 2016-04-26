--description: 天王帮 洞庭湖底第2层水怪　天王50级任务
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 50*256+20) and (HaveItem(95) == 0) and (random(0,99) < 33) then
		AddEventItem(95)
		Msg2Player("打败水怪，拿到象征幸福平安的五彩石. ")
--		SetTask(3, 55)
		AddNote("找到山洞的水怪，打败它拿到五彩石")
	end
end;
