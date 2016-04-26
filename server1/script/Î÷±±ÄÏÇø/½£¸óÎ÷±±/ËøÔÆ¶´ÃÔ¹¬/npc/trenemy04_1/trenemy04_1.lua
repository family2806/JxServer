--description: 剑阁蜀道锁云洞敌人
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) then	
		Msg2Player("消灭姓廖的刺客")
	end
end;
