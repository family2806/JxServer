-------------------------------------------------------------------------
-- FileName		:	enemy_shengyin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_ʢ��
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1061 = nt_getTask(1061)
	if ( Uworld1061 == 100 ) then
		SetMemberTask(1061,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("��ɹ��ɵ���ʢ�������Ի�ȥ���ذϻ��������ˡ�")
	Talk(1,"","ʢ�����𹷣�ɱ���ң�����Ҳ���ᱻ���ǹ��Ƶģ�ֻҪ����һ�ģ����¾�û�����Ƴǵ����ء�")
end

