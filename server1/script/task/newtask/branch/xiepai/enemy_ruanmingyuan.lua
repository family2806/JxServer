-------------------------------------------------------------------------
-- FileName		:	enemy_ruanmingyuan.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_阮明远
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1060 = nt_getTask(1060)
	if ( Uworld1060 == 100 ) then
		SetMemberTask(1060,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("你成功干掉了阮明远，可以回去向拓跋怀川复命了。")
	Talk(1,"","阮明远：大志未成，死得不甘心啊......")
end
