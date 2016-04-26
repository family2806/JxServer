-- 战斗_金国秘使.lua
-- By: Dan_Deng(2004-04-13)

function OnDeath()
	Uworld50 = GetTask(50)
	if ((Uworld50 == 32) or (Uworld50 == 40)) and (HaveItem(383) == 0) then			-- 两个人都打败了，可以得到手谕
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("打败白莹莹")
		Talk(2,"","白姑娘! 这就是你的优势吗?","你怎么有空管人家的事啊, 大金国不会放过你的")
	elseif (Uworld50 == 30) then
		SetTask(50,31)
		Talk(1,"","白晓姝，快跑!")
	end
end
