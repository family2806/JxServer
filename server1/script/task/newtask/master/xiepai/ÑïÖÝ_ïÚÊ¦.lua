
-- ��а���������������ʦ�ű�
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

myTaskValue = GetTask(1003)

	if (myTaskValue==100) then
		task_level30_03();
		return
	elseif (myTaskValue==109) then
		task_level30_03_01(); -- ���ж�һ�εȼ��Ƿ�ﵽ 30 ��
		return
	end

Say("��ʦ����������һ�еģ���ɽ�������Ǽҳ��㷹��ÿ�λ��ڶ���֪������Լ��ܲ��ܻ��Ż�����",0);

end