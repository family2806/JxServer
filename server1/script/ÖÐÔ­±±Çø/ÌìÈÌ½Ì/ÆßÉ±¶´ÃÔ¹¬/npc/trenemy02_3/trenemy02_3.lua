--description: 七杀洞死囚3　天忍10级任务
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(53) == 0)) then
		AddEventItem(53)
		Msg2Player("拿到令牌碎片三. ")
		AddNote("拿到七杀洞令牌碎片三. ")
	end
end;
