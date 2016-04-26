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
	tbDailog.szTitleMsg = "<#><npc>每天完颜广阳都在这练功，他放置了一些大的宝物，欲图东山再起，再度攻宋，小侠你一定要打败他。"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)	
	
	tbDailog:AddOptEntry("这里太可怕了，我想离开这个鬼地方", OnLeave)
	tbDailog:Show()
end

function OnLeave()
	Game:MoveTo(934, "\\settings\\maps\\tianchimijing\\common\\exit.txt")
end