-------------------------------------------------------------------------
-- FileName		:	enemy_yuxiangjin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	战斗_渝湘津
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
function OnDeath()
Uworld1052 = nt_getTask(1052)
Uworld1056 = nt_getTask(1056)
name = GetName()
	if ( Uworld1052 == 100 ) then
		SetMemberTask(1052,100,110,zhengbranch3) 
	elseif ( Uworld1056 == 60 ) then
		SetMemberTask(1056,60,70,zhengbranch4) 
	end
end

function zhengbranch3()
	AddOwnExp(260000)
	AddExp_Skill_Extend(260000)
	Msg2Player("你放过了渝湘津，任务完成。可以回去找傲云宗了。")
	Talk(1,"",name..":渝湘津，今天我不杀你，之所以得罪有不得已的苦衷。希望你能躲藏起来，尽量不要现身。")
end

function zhengbranch4()
	AddOwnExp(260000)
	AddExp_Skill_Extend(260000)
	Msg2Player("你干掉了渝湘津，任务完成。可以回去向柳南云复命了。")
	Talk(1,"",name..":渝湘津，安心去吧。")
end

