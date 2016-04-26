--description: 武陵山 伏流洞火蜥蜴　天王40级任务
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) and (HaveItem(93) == 0) and (random(0,99) < 50) then
		AddEventItem(93)
		Msg2Player("拿到火蜥蜴鳞片. ")
		AddNote("在武夷山伏流洞打败火蜥蜴拿到鳞片. ")
	end
end;	
