--description: 天忍教圣洞一层敌人蜘蛛精　天忍出师任务
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	Task_trtmp60 = GetTask(28)
	if (UTask_tr == 60*256+50) and (GetBit(Task_trtmp60,2) == 0) then
		SetTask(28, SetBit(Task_trtmp60,2,1))
		AddNote("得到口诀“辰宿列张. ")
		Msg2Player("得到口诀“辰宿列张. ")
	end
end;
