-------------------------------------------------------------------------
-- FileName		:	enemy_lushanxiang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:06:22
-- Desc			:	ս��_��������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 80 ) then
		SetMemberTask(1002,80,90,zhongtask2) 
	end
end

function zhongtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("����Ի�ȥ�Ҹ��ϱ��ˡ�")
	Talk(1,"","¬������һֱ��Ϊ�Լ������µ�һ���֣�û�뵽����Ҹ��졣���ѣ����ͻ��ţ���Ҫ�ñ��˰����Դ�ժ������")
end

		
