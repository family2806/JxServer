-- 战斗_绝杀.lua  （世界任务：洗清冤屈）
-- By: Dan_Deng(2004-04-15)

function OnDeath()
	Uworld51 = GetTask(51)
	if (Uworld51 == 60) then		-- 任务中，是打的第一个小BOSS
		SetTask(51,61)
		Talk(1,"","决斩兄弟将为你报仇!")
	elseif (HaveItem(377) == 0) and ((Uworld51 == 62) or (Uworld51 == 70) or (Uworld51 == 80)) then		-- 任务中，可以得秘笈
		Talk(1,"","该死!")
		SetTask(51,70)
		AddEventItem(377)		-- "唐门秘笈"
		Msg2Player("你杀死金国刺客，发现他身上有本唐门秘籍 ")
	end
end
