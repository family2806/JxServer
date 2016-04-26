-------------------------------------------------------------------------
-- FileName		:	战斗_紫刀侠.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:35:34
-- Desc			:	紫刀侠
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 170 ) then
		SetMemberTask(1001,170,180,newtask3)
	end
end

function newtask3()
	AddOwnExp(100000)
	AddExp_Skill_Extend(100000)
	Msg2Player("你拿到了九现之指,可以回去大理向莫愁复命了。")
	Talk(1,"","紫刀侠:我败给你,有负兄弟所托.只能以死相报,你得了东西，滚吧.")
end
