-- �ļ�������findnpctask.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-19 14:54:47
--�ҵ�npc�Ի��Ľű�
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
function allbrother_0801_FindNpcTaskDialog(nTaskId)
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if nTaskState == 0 then
		Say("�����û�н��ܱ����ŵ�����.", 0)
	end
	if nTaskState > 1073741824 then
		Say("�Ͽ�ȥ���������˸���.", 0)
	end
	if nTaskId == nTaskState then
		allbrother_0801_CompleteTask()
	end
end

function allbrother_0801_CheckIsDialog(nTaskId)
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	if allbrother_0801_IsAct() ~= 1 then
		return 0;
	end
	if nTaskState == 0 then
		return 0;
	end
	if nTaskId ~= nTaskState then
		return 0
	end
	return 1;
end

