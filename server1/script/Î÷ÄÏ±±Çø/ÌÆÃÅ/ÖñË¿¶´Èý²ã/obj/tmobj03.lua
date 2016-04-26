--description: 唐门出师任务 竹丝洞第三层宝箱
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("箱内有一柄残破生锈的铁剑", 2, "需要/accept", "不需要 /refuse")
		else
			Talk(1,"","宝箱已空")
		end
	elseif (UTask_tm == 60*256+70) then 
		Talk(1,"","你已打开了另一个宝箱，不能再开启此宝箱!")
	else
		Talk(1,"","你打开宝箱，但是，它好像生锈了!")
	end
end;

function accept()
	AddEventItem(49)
	Msg2Player("得到七星绝命剑 ")
--	SetTask(2, 67)
	AddNote("在竹丝洞第三层有2个宝箱，打烂其中一个，将得到七星绝命剑. ")
end;

function refuse()
end;
