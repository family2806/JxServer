--��ԭ���� ������ ·��3С���ӶԻ�


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>С���ӣ����Ѿ�����һ����ݵĺ���ϡ��������ܹ�����һ�ٴ��׷����������м��á�"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--�����Ի���
	tbDailog:Show()
end

