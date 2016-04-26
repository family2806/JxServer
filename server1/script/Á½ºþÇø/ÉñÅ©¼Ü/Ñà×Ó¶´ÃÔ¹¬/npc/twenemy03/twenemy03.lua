--description: 神农架 燕子洞敌人
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 30*256+20) and (HaveItem(145) == 0) and (random(0,99) < 50) then
		AddEventItem(145)
		Msg2Player("打败强盗, 夺来天王令. ")
--		SetTask(3, 35)
		AddNote("在苗岭燕子洞打败由豹子带头的强盗团伙夺来天王令. ")
	end
end;
