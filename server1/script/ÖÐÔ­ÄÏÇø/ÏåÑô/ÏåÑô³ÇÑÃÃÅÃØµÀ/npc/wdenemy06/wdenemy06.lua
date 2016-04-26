--description: 襄阳城衙门秘道敌人
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Talk(2, "", "狗官，记住，以后不能欺负百姓。否则，天下英雄不会饶了你!", "襄阳将军：不敢，我很怕!")
		Msg2Player("成功教训襄阳守将. ")
		SetTask(17, SetByte(GetTask(17),3,5))
		AddNote("进入衙门，打败守将，消灭襄阳暴政制度")
	end
end;
