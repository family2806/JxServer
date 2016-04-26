-- 战斗_白莹莹.lua
-- By: Dan_Deng(2004-04-13)

function OnDeath()
	Uworld50 = GetTask(50)
	if (Uworld50 == 31) then			-- 两个人都打败了，可以得到手谕
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("打败白莹莹")
		Talk(2,"","白姑娘！这正是你的优势吗?","这个人还真有空担心别人的事情呢，大金国不会放过你的")
	elseif (Uworld50 == 30) then
		SetTask(50,32)
		Msg2Player("打败白莹莹")
		Talk(1,"","啊! 我受伤了.密使大人, 快走!")
	elseif (Uworld50 == 40) and (HaveItem(383) == 0) then			-- 重新得到手谕
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("打败白莹莹")
		Talk(2,"","白姑娘！这正是你的优势吗?","这个人还真有空担心别人的事情呢，大金国不会放过你的")
	end
end
