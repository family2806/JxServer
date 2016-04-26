-------------------------------------------------------------------------
-- FileName		:	enemy_luchangtian.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_路长天
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
function OnDeath()
Uworld1054 = nt_getTask(1054)
	if (Uworld1054 == 80 ) then
		SetMemberTask(1054,80,90,Uworld1054_give) 
	end
end

function Uworld1054_give()
	AddOwnExp(15000)
	AddExp_Skill_Extend(15000)
	Msg2Player("路长天已被你屈服，任务完成，你可以回去找宝鸡赌场.")
	Talk(1,"","不料我一生纵横，最后却败在一个小子手里。真是耻辱!")
end
