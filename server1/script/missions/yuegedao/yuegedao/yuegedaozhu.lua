Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local TSK_LV150_SKILL = 2885
	local YUEGEDAO_150SKILL_TASKSTATE = 14
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	local nTaskStep = floor(GetTask(TSK_LV150_SKILL)/100)
	if nTaskStep < YUEGEDAO_150SKILL_TASKSTATE then
		tbDailog.szTitleMsg = "<npc>����������£��Ǿͺ��ұ���һ�£�Ϊ���������£����þ����书�����Ǳ���������ɱ������Ծ�����"
	else
		tbDailog.szTitleMsg = "<npc>�����Ե����������꣬�����Ե��Ҳ�ܻ���˼��������뿪���ɣ�����֮·���뱣�ء�"
	end
	G_TASK:OnMessage("�¸赺", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end