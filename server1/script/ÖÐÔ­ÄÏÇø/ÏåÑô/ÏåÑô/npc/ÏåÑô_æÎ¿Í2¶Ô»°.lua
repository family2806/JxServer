--��ԭ���� ������ �ο�2�Ի�
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>������Ѱ���ĵĶ���һЩ����������ģ���ͨ�ϰ����������Բ������Ļ�����Ǯ�������棿"
		G_TASK:OnMessage("����", tbDailog, "DialogWithNpc")
		tbDailog:Show() 
end;


