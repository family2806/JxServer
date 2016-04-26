-------------------------------------------------------------------------
-- FileName		:	enemy_xuzili.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:08:09
-- Desc			:	战斗_徐自力
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 150 ) then
		SetMemberTask(1002,150,160,zhongtask3) 
	end
end

function zhongtask3()
	AddOwnExp(100000)
	AddExp_Skill_Extend(100000)
	Msg2Player("你得到了白龙息，可以回去找郦秋水了。")
	Talk(1,"","徐自力：怀璧其罪啊,一件宝贝害了性命,不值啊......")
end


		
