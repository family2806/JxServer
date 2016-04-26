-------------------------------------------------------------------------
-- FileName		:	战斗_怨毒.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:34:32
-- Desc			:	怨毒
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 240 ) then
		SetMemberTask(1001,240,250,newtask4)
	end
end

function newtask4()
	AddOwnExp(230000)
	AddExp_Skill_Extend(230000)
	Msg2Player("你获得了怨毒的首级.")
	Msg2Player("你可以回临安找孟凡了。")
	Talk(1,"","妈拉个巴子，居然被你个小混混给杀了，不甘心啊。")
end

	
