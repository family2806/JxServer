--description: 汴京府铁塔一层宝箱 天忍教50级任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	UTask_trsub01 = GetTask(21)
	if (UTask_tr == 50*256+20) and (HaveItem(160) == 1) then
		DelItem(160)
		if (GetBit(UTask_trsub01,1) == 0) then
			UTask_trsub01 = SetBit(UTask_trsub01,1,1)
			SetTask(21, UTask_trsub01)
			AddNote("打开第一个机关")
			Msg2Player("打开第一层里的宝箱，打开第一个机关")
			if (UTask_trsub01 == 7) then 			-- bin: 100 + 010 + 001
				Talk(1,"","你已打开第三层机关，救出关在塔里的凤翕如 ")
				Msg2Player("你已打开第三层机关，救出关在塔里的凤翕如 ")
				SetTask(4, 50*256+50)
				AddNote("三层机关已全部打开，救出关在塔里的凤翕如")
			end
		else
			Talk(1,"","机关被打开")
		end
	elseif (UTask_tr == 50*256+20) and (GetBit(UTask_trsub01,1) == 1) then
		Talk(1,"","机关被打开")
	elseif (UTask_tr == 50*256+50)  then
		Talk(1,"","机关被打开")
	else
		Talk(1,"","没有钥匙就不能打开此机关")
	end
end;
