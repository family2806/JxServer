--description: 伏牛山 天心洞迷宫敌人　武当50级任务
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	if (UTask_wd == 50*256+20) and (random(0,99) < 33) then
		SetTask(5, 50*256+50)
		Earn(10000)
		Msg2Player("打败土匪头目铁棘，拿到他们抢得的1万两. ")
		AddNote("在伏牛山天心洞，打败土匪头目铁棘，拿到他们抢得的1万两. ")
	end
end;
