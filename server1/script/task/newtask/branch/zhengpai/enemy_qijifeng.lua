-------------------------------------------------------------------------
-- FileName		:	enemy_qijifeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	战斗_齐即风
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1053 = nt_getTask(1053)
	if ( Uworld1053 == 60 ) then
		SetMemberTask(1053,60,70,zhengbranch4) 
	end
end

function zhengbranch4()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("你成功杀掉了齐即风，可当你暗自庆幸的时候，齐即风在临死前却道出了一个可怕的答案。你觉得应该回去找傲云宗问问了。")
	Talk(1,"","齐即风：哈哈哈哈哈！你真以为当年刺杀岳飞的是我吗？我告诉你，你永远都别想知道答案，永远别想......")
end
