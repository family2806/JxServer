-------------------------------------------------------------------------
-- FileName		:	ս��_������.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:29:59
-- Desc			:	������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 100 ) then
		SetMemberTask(1001, 100, 110, newtask2)
	end
end

function newtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("�����˻ƽ���.")
	Msg2Player("����Իش�����Ī���ˡ�")
	Talk(1, "", "�ƽ����ڴ�,����ȥ��.�ⶫ�����˹���һ��,�Ǹ�ħ�ﰡ,���Լ�����.")
end
