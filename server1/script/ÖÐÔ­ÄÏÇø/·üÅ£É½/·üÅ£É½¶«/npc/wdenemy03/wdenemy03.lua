--description: 伏牛山东敌人
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	if (UTask_wd == 30*256+20) then	
		AddEventItem(133)
		Msg2Player("获得一撮画眉草 ")
		AddNote("获得画眉草")
	end;
end;	
