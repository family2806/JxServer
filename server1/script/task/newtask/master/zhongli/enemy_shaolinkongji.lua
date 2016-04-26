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
		SetMemberTask(1002,280,290,zhongtask5) 
	end
end

function zhongtask5()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("你得到了两件神器，可以回去找傅南冰了.")
	Talk(1,"","空寂神僧：阿弥陀佛，神器在此，施主拿去吧。")
end


		
