-------------------------------------------------------------------------
-- FileName		:	enemy_qijifeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	ս��_�뼴��
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
	Msg2Player("��ɹ�ɱ�����뼴�磬�ɵ��㰵�����ҵ�ʱ���뼴��������ǰȴ������һ�����µĴ𰸡������Ӧ�û�ȥ�Ұ����������ˡ�")
	Talk(1,"","�뼴�磺������������������Ϊ�����ɱ���ɵ��������Ҹ����㣬����Զ������֪���𰸣���Զ����......")
end
