--description: 唐门翡翠湖敌人 20级任务
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+40) and (HaveItem(41) == 0) then			-- 概率由50%改为100%
		AddEventItem(41) 
		Msg2Player("得到金项圈 ")
		AddNote("在翡翠湖打败赤焰鳄，得到金项圈")
	end
end;
