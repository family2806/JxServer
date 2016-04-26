--description: 剑阁蜀道锁云洞敌人
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) and (HaveItem(159) == 0) then					--取消对任务物品有无的判断，以便重做任务
		AddEventItem(159)
		Msg2Player("轻松抓住了姓廖的，他身上找到了给宋朝的一封密信. ")
--		SetTask(4, 45)
		AddNote("在剑阁蜀道抓到姓廖的，拿到给宋朝的密信. ")
	end
end;
