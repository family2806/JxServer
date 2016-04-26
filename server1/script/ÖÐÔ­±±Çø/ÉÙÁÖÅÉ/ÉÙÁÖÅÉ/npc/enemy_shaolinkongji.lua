-------------------------------------------------------------------------
-- FileName		:	enemy_shaolinkongji.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:07:27
-- Desc			:	战斗_少林空寂
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 280 ) then
		Talk(1,"Uworld1002_give","阿弥陀佛，这里的神器，施主拿去吧.")
	end
end

function zhongtask5()
	AddOwnExp(600000)
	Msg2Player("你获得两部龙器，回去找傅南冰.")

end

function Uworld1002_give()

	SetMemberTask(1002,280,290,zhongtask5) 
	
end
		
