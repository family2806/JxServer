-------------------------------------------------------------------------
-- FileName		:	enemy_ruanmingyuan.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_����Զ
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
	Msg2Player("��ɹ��ɵ�������Զ�����Ի�ȥ���ذϻ��������ˡ�")
	Talk(1,"","����Զ����־δ�ɣ����ò����İ�......")
end
