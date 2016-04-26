--description: 武当山 井底迷宫敌人　武当入门任务
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 5) and (HaveItem(65) == 0) and (random(0,99) < 66) then
		AddEventItem(65)
		Msg2Player("找到一个木桶")
--		SetTask(5, 8)
		AddNote("在井底找到一个木桶. ")
	end
end;	
