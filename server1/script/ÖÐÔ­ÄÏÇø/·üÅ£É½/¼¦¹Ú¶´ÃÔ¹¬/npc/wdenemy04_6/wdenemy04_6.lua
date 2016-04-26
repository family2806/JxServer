--description: 武当派40级任务 伏牛山鸡冠洞普通怪物
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+60) and (HaveItem(164) == 0) and (random(0, 99) < 33) then
		AddEventItem(164)
		Msg2Player("接收润娘的回信")
--		SetTask(5, 48)
		AddNote("收服5只润娘的白玉虎，获得回信 ")
	end
end;
