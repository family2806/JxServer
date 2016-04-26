--description: 唐门竹海第一关敌人
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 >= 20) and (Uworld37 < 127) and (HaveItem(33) == 0) and (random(0,99) < 50) then		--任务中，没有青色竹杖，50%机率
		AddEventItem(33)
		Msg2Player("得到青色竹杖")
		AddNote("在第一关打败马后，得到青色竹杖")
	end
end;
