--description: 武当派40级任务 伏牛山鸡冠洞五只白玉虎4　武当40级任务
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	if (GetTask(5) == 40*256+20) then
		UTask_wd40tmp = SetBit(GetTaskTemp(16),4,1)
		if (UTask_wd40tmp == 31) then
			SetTask(5,40*256+40)
			AddNote("收服5只润娘的白玉虎. ")
			Msg2Player("收服5只润娘的白玉虎. ")
		else
			SetTaskTemp(16, UTask_wd40tmp)
		end
	end
end;
