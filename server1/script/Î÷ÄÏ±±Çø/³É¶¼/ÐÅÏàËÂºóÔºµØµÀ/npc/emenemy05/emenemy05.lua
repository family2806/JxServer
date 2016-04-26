--description: 峨嵋派 信相寺后院地道敌人
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if (UTask_em == 50*256+60) and (HaveItem(23) == 1) and (random(0,99) < 30) then							--救出慈海方丈的概率是30%
		Msg2Player("打败反僧头目，救了慈海方丈，把金线绣佛金刚经给他. ")
		DelItem(23)
		SetTask(1, 50*256+80)
		AddNote("打败反僧头目，救了慈海方丈，把金线绣佛金刚经给他. ")
	end
end;	
