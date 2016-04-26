--description: 七杀洞死囚5　天忍10级任务
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(55) == 0)) then
		AddEventItem(55)
		Msg2Player("拿到令牌碎片五. ")
		AddNote("拿到七杀洞令牌碎片五. ")
	end
end;
