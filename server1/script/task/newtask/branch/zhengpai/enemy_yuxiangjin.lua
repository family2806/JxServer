-------------------------------------------------------------------------
-- FileName		:	enemy_yuxiangjin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_�����
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
	Msg2Player("��Ź��������������ɡ����Ի�ȥ�Ұ������ˡ�")
	Talk(1,"",name..":����򣬽����Ҳ�ɱ�㣬֮���Ե����в����ѵĿ��ԡ�ϣ�����ܶ��������������Ҫ����")
end

function zhengbranch4()
	AddOwnExp(260000)
	AddExp_Skill_Extend(260000)
	Msg2Player("��ɵ��������������ɡ����Ի�ȥ�������Ƹ����ˡ�")
	Talk(1,"",name..":����򣬰���ȥ�ɡ�")
end

