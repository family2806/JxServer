-- 临安　路人　叶小玉
-- by：Dan_Deng(2003-09-16)

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
		tbDailog.szTitleMsg = "<npc>公子：我尚未出阁，你老是跟着我，到底做啥介？要是让我年知道，耐末勿得了。"
	else
		tbDailog.szTitleMsg = "<npc>妹子，你有啥介事吗？"
	end
	G_TASK:OnMessage("叶小玉", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
