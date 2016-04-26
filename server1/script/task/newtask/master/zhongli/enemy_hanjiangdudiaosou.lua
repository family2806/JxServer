-------------------------------------------------------------------------
-- FileName		:	enemy_hanjiangdudiaosou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_寒江独钓叟
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 215 ) then
		SetMemberTask(1002,215,220,zhongtask4) 
	end
end

function zhongtask4()
	AddOwnExp(230000)
	AddExp_Skill_Extend(230000)
	Msg2Player("你得到了战枪龙断，可以回去找傅南冰了.")
	Talk(1,"","寒江独钓叟:龙断在此,你拿走吧,哎......")
end
