-------------------------------------------------------------------------
-- FileName		:	enemy_ningjiangjun.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:05:42
-- Desc			:	ս��_������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 30) then
		SetMemberTask(1002,30,40,zhongtask1) --����3end
	end
end

function zhongtask1()
	AddOwnExp(20000)
	AddExp_Skill_Extend(20000)
	Msg2Player("����Ի�ȥ�Ҹ��ϱ��ˡ�")
	Talk(1,"","���������Դ�Ͷ������������Ҿ�֪������һ�죬ֻ��û�뵽��������ô�졣")
end

