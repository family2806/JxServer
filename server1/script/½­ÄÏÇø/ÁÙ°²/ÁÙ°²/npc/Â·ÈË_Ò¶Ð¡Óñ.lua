-- �ٰ���·�ˡ�ҶС��
-- by��Dan_Deng(2003-09-16)

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()

	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	if (GetSex() == 0) then
		tbDailog.szTitleMsg = "<npc>���ӣ�����δ���������Ǹ����ң�������ɶ�飿Ҫ��������֪������ĩ����ˡ�"
	else
		tbDailog.szTitleMsg = "<npc>���ӣ�����ɶ������"
	end
	G_TASK:OnMessage("ҶС��", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
