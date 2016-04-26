-------------------------------------------------------------------------
-- FileName		:	enemy_ningjiangjun.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:05:42
-- Desc			:	战斗_宁将军
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 30) then
		SetMemberTask(1002,30,40,zhongtask1) --环节3end
	end
end

function zhongtask1()
	AddOwnExp(20000)
	AddExp_Skill_Extend(20000)
	Msg2Player("你可以回去找傅南冰了。")
	Talk(1,"","宁将军：自从投靠金国那天起，我就知道有这一天，只是没想到，来得这么快。")
end

