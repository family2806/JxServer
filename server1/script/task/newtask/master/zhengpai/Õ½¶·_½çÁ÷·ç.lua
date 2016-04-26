-------------------------------------------------------------------------
-- FileName		:	战斗_界流风.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:29:59
-- Desc			:	界流风
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 100 ) then
		SetMemberTask(1001, 100, 110, newtask2)
	end
end

function newtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("你获得了黄金鳞.")
	Msg2Player("你可以回大理找莫愁了。")
	Talk(1, "", "黄金鳞在此,你拿去吧.这东西害了公子一生,是个魔物啊,你自己当心.")
end
