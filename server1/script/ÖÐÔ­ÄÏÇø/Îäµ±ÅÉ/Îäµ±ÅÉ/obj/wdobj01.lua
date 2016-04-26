--description: 武当派出师任务 武当山宝箱1
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","宝箱：目前宋方前线 <color=Red>>疫情<color> 延长，快去<color=Red>>襄阳<color> 找<color=Red>>药店老板<color> 找帮助")
			Msg2Player("最近宋军阵营疫情蔓延，需要到襄阳找药店老板找帮助. ")
			SetTask(17, SetByte(GetTask(17),1,2))
			AddNote("宝箱上面写着：到襄阳找药店老板找抑制疫情的办法. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","宝箱 <color=Red>>疫情<color> 在蔓延.....")
			Msg2Player("疫情在蔓延... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(69)
			Say("<color=Red>疫情<color>已除，打开宝箱，发现一本<color=Red>>玉清真经<color>.", 0)
			Msg2Player("疫情被消除，有本玉清真经. ")
			SetTask(17, SetByte(GetTask(17),1,10))
			AddNote("打开宝箱有玉清真经. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(69) == 0) then
				AddEventItem(69)
			else
				Talk(1,"","宝箱已空")
			end
		end
	else
		Talk(1,"","未接任务，你不能打开宝箱!")
	end
end;
