--description: 唐门出师任务 竹丝洞第一层怪物
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 60*256+20) and (HaveItem(99) == 0) and (random(0,99) <= 40)) then		--任务中且没有钥匙二时，概率为50%
		AddEventItem(99) 
		Msg2Player("得到钥匙二")
--		SetTask(2, 64)
		AddNote("在竹丝洞第一层，打败怪物，得到钥匙二. ")
	end
end;
