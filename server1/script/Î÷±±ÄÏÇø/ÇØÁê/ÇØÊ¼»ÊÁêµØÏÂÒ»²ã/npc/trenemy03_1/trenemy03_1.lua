--description: 秦陵地下一层敌人
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 30*256+20) and (HaveItem(59) == 0) then
		AddEventItem(59)
		Msg2Player("得到鸽血红宝石. ")
		AddNote("秦陵地下, 打败宝玉小偷, 得到鸽血红宝石. ")
	end
end;	
