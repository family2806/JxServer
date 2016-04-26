Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>ÿ�����չ�����������������������һЩ��ı����ͼ��ɽ�����ٶȹ��Σ�С����һ��Ҫ�������"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)	
	
	tbDailog:AddOptEntry("����̫�����ˣ������뿪�����ط�", OnLeave)
	tbDailog:Show()
end

function OnLeave()
	Game:MoveTo(934, "\\settings\\maps\\tianchimijing\\common\\exit.txt")
end