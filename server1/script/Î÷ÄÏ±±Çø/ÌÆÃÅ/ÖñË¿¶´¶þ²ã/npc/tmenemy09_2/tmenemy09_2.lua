--description: 唐门出师任务 竹丝洞第二层怪物
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 60*256+40) and (HaveItem(100) == 0) and (random(0,99) <= 30) then 		--概率由20%改为30%
		AddEventItem(100) 
		Msg2Player("拿到第三把钥匙. ")
--		SetTask(2, 66)
		AddNote("在竹丝洞第二层，打败敌人，进入第三层. ")
	end
end;	
