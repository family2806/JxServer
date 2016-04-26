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
		tbDailog.szTitleMsg = "<npc>如果大侠不怕，那就和我比试一下，为了闻名天下，练得绝世武功，还是被困在这里，由本场比试决定。"
	else
		tbDailog.szTitleMsg = "<npc>如果有缘，就能再相逢，如果无缘，也能互相思念，大侠快离开岛吧，江湖之路，请保重。"
	end
	G_TASK:OnMessage("月歌岛", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end