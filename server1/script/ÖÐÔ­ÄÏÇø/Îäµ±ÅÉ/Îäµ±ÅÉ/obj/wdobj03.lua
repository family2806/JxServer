--description: 武当派出师任务 武当山宝箱3
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","宝箱: <color=Red>守将<color> 在 <color=Red>襄阳衙门<color> 整天只懂喝酒，欺负百姓，老百姓怨恨<color=Red>暴政<color>怎能消除？")
			Msg2Player("宝箱上写着：去警告襄阳守将，为民除恶. ")
			SetTask(17, SetByte(GetTask(17),3,2))
			AddNote("宝箱上写着：去警告襄阳守将，为民除恶. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 5) then
			Talk(1,"","襄阳宝箱依然能生活在<color=Red>暴政<color>  <color=Red>守将<color>.....")
			Msg2Player("襄阳百姓依然生活在水深火热之中... ")
		elseif (UTask_wd60sub == 5) then
			AddEventItem(71)
			Talk(1,"","取消 <color=Red>暴政<color> 打开宝箱，获得一卷<color=Red>太清真经<color>.")
			Msg2Player("消除暴政，获得一部太清真经. ")
			SetTask(17, SetByte(GetTask(17),3,10))
			AddNote("打开宝箱获得一部太清真经")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(71) == 0) then
				AddEventItem(71)
			else
				Talk(1,"","宝箱已空")
			end
		end
	else
		Talk(1,"","未接任务，你不能打开宝箱!")
	end
end;
