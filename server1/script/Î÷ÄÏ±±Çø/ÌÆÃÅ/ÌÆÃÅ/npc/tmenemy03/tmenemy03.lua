--description: 唐门竹海第三关敌人
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","Ch輓h Йng l� L玦 ")
			Msg2Player("得到口诀“Ch輓h Йng l� L玦 ")
		elseif (i == 1) then
			Talk(1,"","Ch輓h Nam l� H醓")
			Msg2Player("得到口诀“Ch輓h Nam l� H醓")
		elseif (i == 2) then 
			Talk(1,"","Ch輓h T﹜ l� m閏")
			Msg2Player("得到口诀“Ch輓h T﹜ l� m閏")
		elseif (i == 3) then 
			Talk(1,"","Ch輓h B綾 l� nc")
			Msg2Player("得到口诀“Ch輓h B綾 l� nc")
		elseif (i == 4) then 
			Talk(1,"","Йng Nam l� gi� ")
			Msg2Player("得到口诀“Йng Nam l� gi� ")
		elseif (i == 5) then 
			Talk(1,"","Йng B綾 l� n骾")
			Msg2Player("得到口诀“Йng B綾 l� n骾")
		elseif (i == 6) then 
			Talk(1,"","T﹜ Nam l� t")
			Msg2Player("得到口诀“T﹜ Nam l� t")
		else
			Talk(1,"","T﹜ B綾 l� tr阨")
			Msg2Player("得到口诀“T﹜ B綾 l� tr阨")
		end
	end
end;
