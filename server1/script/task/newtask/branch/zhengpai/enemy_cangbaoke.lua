-------------------------------------------------------------------------
-- FileName		:	enemy_cangbaoke.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_�ر���
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 == 40 ) then
		AddEventItem(504)
		Msg2Player("������һ����е�ȱ���ס�")
	end
	if ( GetItemCount(504) >= 5 ) then
		Talk(1,"","���Ѿ�������屾���ϵ���е�ȱ���ף��Ͳ�Ҫ����Ϊ�ر����ˣ�������һ����·�ɡ�")
	end
end

