-------------------------------------------------------------------------
-- FileName		:	enemy_panrulong.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if (Uworld1050 == 120 ) then
		SetMemberTask(1050,120,130,zhengbranch1) 
	end
end

function zhengbranch1()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("����������ʱ�����㣬�������Ǵ�ɱ��Ԫ˧���������������м��Ȼ�и������ı��������ɡ�����Ի�ȥ�Ұ������ˡ�")
	Talk(1,"","������������ɱ���ɵ��������ˣ��ң��Ҳ�����һ��С��޶��ѡ�")
end


