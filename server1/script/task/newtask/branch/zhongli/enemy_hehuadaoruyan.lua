-------------------------------------------------------------------------
-- FileName		:	enemy_hehuadaoruyan.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	ս��_�ɻ�������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1055 = nt_getTask(1055)
Uworld1012 = nt_getTask(1012)
	if ( Uworld1012 >= 20 ) and ( Uworld1055 == 100 ) then
		nt_setTask(1012,0)
		SetMemberTask(1055,100,110,zhengbranch4) 
	elseif ( Uworld1055 == 100 ) then
		Uworld1012 = Uworld1012 + 10
		nt_setTask(1012,Uworld1012)
		Talk(1,"","��Ҫ��Ϊ����Ե��⣬�������ǽ����ڴ�!")
	end
end

function zhengbranch4()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("���Ѵ�ܺɻ��������Ի�������ǹ�ھ����˸���.")
	Talk(1,"","����ɱ����������?")
end

