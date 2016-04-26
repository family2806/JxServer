--description: 武当山 火狼洞迷宫敌人
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+20) and (HaveItem(66) == 0) then
		AddEventItem(66)
		Msg2Player("找到烂了的天蚕道袍. ")
--	SetTask(5, 23)	
		AddNote("进入火狼洞，打败火狼，拿到烂了的天蚕道袍. ")
	end
end;
