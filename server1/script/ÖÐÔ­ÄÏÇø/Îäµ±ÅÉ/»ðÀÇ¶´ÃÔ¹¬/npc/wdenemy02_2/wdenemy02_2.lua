--description: 武当山 火狼洞迷宫敌人
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+50) and (HaveItem(67) == 0) then
		Talk(2,"","因为我拿着天蚕，才被红狼拉到这里，丢掉就行了!","不要丢，给我!")
		AddEventItem(67)
		Msg2Player("救了襄阳杂货铺老板的儿子，他送给你一个天蚕. ")
--		SetTask(5, 26)
		AddNote("打败火狼洞里的狼，救了襄阳杂货铺老板的儿子，获得一个天蚕. ")
	end
end;
