--description: 青螺岛山洞敌人
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 60*256+40) and (HaveItem(96) == 0) and (random(0,99) < 25) then
		AddEventItem(96)
		Msg2Player("从金国杀手手中夺过天王遗书. ")
--		SetTask(3, 66)
		AddNote("在山东青螺岛，打败杀手夺来天王遗书")
	end
end;	
