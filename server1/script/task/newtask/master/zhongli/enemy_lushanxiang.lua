-------------------------------------------------------------------------
-- FileName		:	enemy_lushanxiang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:06:22
-- Desc			:	战斗_宁将军？
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 80 ) then
		SetMemberTask(1002,80,90,zhongtask2) 
	end
end

function zhongtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("你可以回去找傅南冰了。")
	Talk(1,"","卢善像：我一直以为自己是天下第一快手，没想到你比我更快。朋友，加油活着，不要让别人把你脑袋摘下来。")
end

		
