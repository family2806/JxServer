--description: 唐门怪石阵敌人4 20级任务
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(40) == 0)) then		--没有怪石阵丝帕四
		AddEventItem(40)
		Msg2Player("得到第四条丝帕，上书“死”字 ")
		AddNote("得到第四条丝帕，上书“死”字")
	end
end;
