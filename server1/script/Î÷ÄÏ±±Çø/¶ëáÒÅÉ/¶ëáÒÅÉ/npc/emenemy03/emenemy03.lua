--description: 峨嵋派火狐水面敌人
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em == 30*256+50) and (HaveItem(120) == 0) and (random(0,99) < 50) then
		if (HaveItem(119) == 0) then			--没有鸡腿
			Msg2Player("找到火狐，但是没有鸡腿，火狐不肯跟陌生人走")
		else							--有鸡腿		
			DelItem(119)
			AddEventItem(120) 
			Msg2Player("救出火狐")
--			SetTask(1, 38)
			AddNote("在后山鳄鱼湖，打败蛇，找到火狐，")
		end			
	end
end;	
