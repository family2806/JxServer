--description: 唐门50级任务 青城山响水洞怪物
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 50*256+80) and (HaveItem(48) == 0)) then					--没有暗器谱
		AddEventItem(48) 
--		SetTask(2, 59)
		AddNote("打败响水洞里的敌人，得到暗器谱")
		Msg2Player("得到暗器谱")
	end
end;
