-------------------------------------------------------------------------
-- FileName		:	enemy_luchangtian.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_·����
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
function OnDeath()
Uworld1054 = nt_getTask(1054)
	if (Uworld1054 == 80 ) then
		SetMemberTask(1054,80,90,Uworld1054_give) 
	end
end

function Uworld1054_give()
	AddOwnExp(15000)
	AddExp_Skill_Extend(15000)
	Msg2Player("·�����ѱ���������������ɣ�����Ի�ȥ�ұ����ĳ�.")
	Talk(1,"","������һ���ݺᣬ���ȴ����һ��С��������ǳ���!")
end
