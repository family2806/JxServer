--description: ÌÆÃÅÖñº£µÚÈý¹ØµÐÈË
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","ChÝnh §«ng lµ L«i ")
			Msg2Player("µÃµ½¿Ú¾÷¡°ChÝnh §«ng lµ L«i ")
		elseif (i == 1) then
			Talk(1,"","ChÝnh Nam lµ Háa")
			Msg2Player("µÃµ½¿Ú¾÷¡°ChÝnh Nam lµ Háa")
		elseif (i == 2) then 
			Talk(1,"","ChÝnh T©y lµ méc")
			Msg2Player("µÃµ½¿Ú¾÷¡°ChÝnh T©y lµ méc")
		elseif (i == 3) then 
			Talk(1,"","ChÝnh B¾c lµ n­íc")
			Msg2Player("µÃµ½¿Ú¾÷¡°ChÝnh B¾c lµ n­íc")
		elseif (i == 4) then 
			Talk(1,"","§«ng Nam lµ giã ")
			Msg2Player("µÃµ½¿Ú¾÷¡°§«ng Nam lµ giã ")
		elseif (i == 5) then 
			Talk(1,"","§«ng B¾c lµ nói")
			Msg2Player("µÃµ½¿Ú¾÷¡°§«ng B¾c lµ nói")
		elseif (i == 6) then 
			Talk(1,"","T©y Nam lµ ®Êt")
			Msg2Player("µÃµ½¿Ú¾÷¡°T©y Nam lµ ®Êt")
		else
			Talk(1,"","T©y B¾c lµ trêi")
			Msg2Player("µÃµ½¿Ú¾÷¡°T©y B¾c lµ trêi")
		end
	end
end;
