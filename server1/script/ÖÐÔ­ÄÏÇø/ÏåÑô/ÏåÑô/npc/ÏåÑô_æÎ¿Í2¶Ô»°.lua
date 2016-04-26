--中原南区 襄阳府 嫖客2对话
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
		tbDailog.szTitleMsg = "<npc>来这里寻开心的都是一些当官做生意的，普通老百姓连饭都吃不饱，哪还有闲钱来这里玩？"
		G_TASK:OnMessage("翠烟", tbDailog, "DialogWithNpc")
		tbDailog:Show() 
end;


