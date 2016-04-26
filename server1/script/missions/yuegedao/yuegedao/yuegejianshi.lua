Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>是非成败转头空，多少武林高手被埋在这里，遗憾的是，论剑时，只因为想达到绝世武学，不少侠士不怕危险。你还年轻，请慎重行事。"
	G_TASK:OnMessage("月歌岛", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end