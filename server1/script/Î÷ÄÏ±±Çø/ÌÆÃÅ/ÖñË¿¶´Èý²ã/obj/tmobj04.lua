--description: 唐门出师任务 竹丝洞第三层宝箱
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()

	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("一万两银子。", 2, "要/accept", "不要/refuse")
		else
			Talk(1,"","你已打开了另一个宝箱，不能再开启此宝箱!")
		end
	elseif (UTask_tm == 60*256+70) then
		Talk(1,"","宝箱已空")
	else
		Talk(1,"","你打开宝箱，但是，它好像已经生锈了!")
	end
end;

function accept()
	Earn(10000)
	SetTask(2, 60*256+70)
	AddNote("在竹丝洞第三层的宝箱里获得一万两银子. ")
	Msg2Player("获得一万两银子 ")
end;

function refuse()
end;
