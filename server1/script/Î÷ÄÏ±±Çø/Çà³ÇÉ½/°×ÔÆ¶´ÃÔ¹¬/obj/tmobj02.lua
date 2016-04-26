--description: 唐门30级任务 青城山白云洞宝箱
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 1) then					--得到钥匙一
		DelItem(98)
		AddEventItem(42) 
		Msg2Player("得到《火器谱》")
		SetTask(2, 30*256+50)
		AddNote("开箱，得到《火器谱》 ")
	elseif (UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 0) then			-- 道具丢了
		AddEventItem(42) 
		Talk(1,"","原来你把火器谱放进宝箱了!")
	elseif (UTask_tm > 30*256+30) then 
		Talk(1,"","宝箱已空")
	else
		Talk(1,"","没有钥匙，不能打开宝箱!.")
	end
end;
