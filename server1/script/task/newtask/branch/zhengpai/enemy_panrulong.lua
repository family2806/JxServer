-------------------------------------------------------------------------
-- FileName		:	enemy_panrulong.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_潘如龙
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if (Uworld1050 == 120 ) then
		SetMemberTask(1050,120,130,zhengbranch1) 
	end
end

function zhengbranch1()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("潘如龙临死时告诉你，他并不是刺杀岳元帅的主将，看来这中间必然有更大的阴谋。任务完成。你可以回去找傲云宗了。")
	Talk(1,"","潘如龙：当年杀岳飞的另有其人，我，我不过是一个小喽罗而已。")
end


