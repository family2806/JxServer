-------------------------------------------------------------------------
-- FileName		:	enemy_hanjiangdudiaosou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_����������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 215 ) then
		SetMemberTask(1002,215,220,zhongtask4) 
	end
end

function zhongtask4()
	AddOwnExp(230000)
	AddExp_Skill_Extend(230000)
	Msg2Player("��õ���սǹ���ϣ����Ի�ȥ�Ҹ��ϱ���.")
	Talk(1,"","����������:�����ڴ�,�����߰�,��......")
end
