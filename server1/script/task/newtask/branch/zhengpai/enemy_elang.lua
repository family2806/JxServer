-------------------------------------------------------------------------
-- FileName		:	enemy_elang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_恶狼
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 == 120 ) then
		SetMemberTask(1051,120,130,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("你成功杀掉了恶狼，可以回去找龚阿牛了。")
	Talk(1,"","啊呜~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end


