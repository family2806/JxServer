-------------------------------------------------------------------------
-- FileName		:	enemy_shiyisheng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_ʩ����
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
	Msg2Player("��ɹ�ץס��ʩ���������Ի�ȥ���ذϻ��������ˡ�")
	Talk(1,"","�����ʲô����Ҫ���Ҵ�������ȥ��")
end

