-------------------------------------------------------------------------
-- FileName		:	enemy_shengyin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_盛尹
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1061 = nt_getTask(1061)
	if ( Uworld1061 == 100 ) then
		SetMemberTask(1061,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("你成功干掉了盛尹，可以回去向拓跋怀川复命了。")
	Talk(1,"","盛尹：金狗！杀了我，襄阳也不会被你们攻破的！只要万众一心，天下就没有能破城的因素。")
end

