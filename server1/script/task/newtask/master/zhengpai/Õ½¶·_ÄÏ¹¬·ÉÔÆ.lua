-------------------------------------------------------------------------
-- FileName		:	战斗_南宫飞云.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:35:01
-- Desc			:	南宫飞云
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 290 ) then
		SetMemberTask(1001,290,300,newtask5)
	end
end

function newtask5()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("神秘人被你击败后，告诉你去大理莫愁的居所，他有话要告诉你。")
	Talk(1,"","神秘人：去大理莫愁的住处吧，我自有话说。")
end
