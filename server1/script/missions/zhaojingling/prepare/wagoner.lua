Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)	
	tbDailog.szTitleMsg = "<npc>我可以带你离开准备斗场"
	tbDailog:AddOptEntry("我想离开!", leave)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()		
end

function leave()
	local nMapId, _, _ = GetWorldPos()
	if nMapId ~= PREPARE_MAP then
		return
	end
	local nMapId = GetTask(TSK_LEAVERMAPID)
	local nX = GetTask(TSK_LEAVERPOSX)
	local nY = GetTask(TSK_LEAVERPOSY)
	NewWorld(nMapId, nX, nY)
end
