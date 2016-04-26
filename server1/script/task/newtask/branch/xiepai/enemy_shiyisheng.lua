-------------------------------------------------------------------------
-- FileName		:	enemy_shiyisheng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_施宜生
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 == 100 ) then
		SetMemberTask(1059,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("你成功抓住了施宜生，可以回去向拓跋怀川复命了。")
	Talk(1,"","你想干什么？你要把我带到哪里去？")
end

