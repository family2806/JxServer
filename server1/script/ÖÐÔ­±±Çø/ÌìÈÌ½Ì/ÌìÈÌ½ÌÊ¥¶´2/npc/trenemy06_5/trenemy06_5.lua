--description: 天忍教圣洞二层敌人毒蝎王　天忍出师任务
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) and (HaveItem(102) == 0) then
		AddEventItem(102)
		Msg2Player("获得一把钥匙. ")
		AddNote("在圣洞第二层，打败毒蝎王，拿到钥匙开宝箱. ")
	end
end;
