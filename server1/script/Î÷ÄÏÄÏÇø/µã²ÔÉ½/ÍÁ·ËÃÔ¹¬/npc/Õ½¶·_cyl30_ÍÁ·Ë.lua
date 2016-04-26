-- 点苍山 战斗NPC 土匪（翠烟门30级任务）
-- by：Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 30*256+20) and (random(0,100) < 50) then				-- 30级任务中，50%机率
		SetTask(6,30*256+30)
		AddNote("救出香山土匪手中的段华农的侄女. ")
		Msg2Player("救出香山土匪手中的段华农的侄女. ")
	end
end;
