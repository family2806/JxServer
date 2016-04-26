-------------------------------------------------------------------------
-- FileName		:	enemy_shenfeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-01-07 15:04:14
-- Desc			:	战斗_沈风
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 == 80 ) then
		SetMemberTask(1058,80,90,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("你成功杀掉了假扮沈风的武士，任务完成，可以回去找拓跋怀川了。！")
	Talk(1,"","你这金国的狗杂种！")
end

