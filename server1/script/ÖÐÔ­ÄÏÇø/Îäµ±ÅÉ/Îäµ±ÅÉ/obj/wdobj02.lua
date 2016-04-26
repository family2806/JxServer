--description: 武当派出师任务 武当山宝箱2
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","宝箱：最近 <color=Red>宋金兵器 <color> 不足, <color=Red>伤亡<color> 惨重，快到<color=Red>襄阳<color> 找 <color=Red>工匠 <color> 寻求帮助 .")
			Msg2Player("最近抗金兵器不够, <color=Red>士兵伤亡惨重<color>, 需要到襄阳找铁匠帮忙. ")
			SetTask(17, SetByte(GetTask(17),2,2))
			AddNote("宝箱上写着：到襄阳找铁匠寻找解决抗金兵器不足的办法. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","宝箱：由于缺少 <color=Red>兵器<color>, 宋金伤亡惨重")
			Msg2Player("由于力量不够，抗金时造成伤亡很难避免... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(70)
			Say("及时拿到兵器，前线官兵战斗力增强。打开宝箱，获得一部<color=Red>'上清真经<color>.", 0)
			Msg2Player("需要补充兵器，金兵战斗力很强。打开宝箱，获得一部上清真经. ")
			SetTask(17, SetByte(GetTask(17),2,10))
			AddNote("打开宝箱，有部上清真经. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(70) == 0) then
				AddEventItem(70)
			else
				Talk(1,"","宝箱已空")
			end
		end
	else
		Talk(1,"","未接任务，你不能打开宝箱!")
	end
end;
