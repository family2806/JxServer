--description: 唐门竹海第三关敌人
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","正东为雷")
			Msg2Player("得到口诀“正东为雷")
		elseif (i == 1) then
			Talk(1,"","正南为火")
			Msg2Player("得到口诀“正南为火")
		elseif (i == 2) then 
			Talk(1,"","正西为沼")
			Msg2Player("得到口诀“正西为沼")
		elseif (i == 3) then 
			Talk(1,"","正北为水")
			Msg2Player("得到口诀“正北为水")
		elseif (i == 4) then 
			Talk(1,"","东南为风")
			Msg2Player("得到口诀“东南为风")
		elseif (i == 5) then 
			Talk(1,"","东北为山")
			Msg2Player("得到口诀“东北为山")
		elseif (i == 6) then 
			Talk(1,"","西南为地")
			Msg2Player("得到口诀“西南为地")
		else
			Talk(1,"","西北为天")
			Msg2Player("得到口诀“西北为天")
		end
	end
end;
