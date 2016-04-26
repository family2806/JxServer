--翠烟门 卖兵器的弟子对话
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) or (GetLastFactionNumber() == 5) then
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end

		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>本门工夫重要的是变化无穷，不像一般的武功."
		tbDailog:AddOptEntry("交易", yes)
		tbDailog:AddOptEntry("不交易", no)
		G_TASK:OnMessage("翠烟", tbDailog, "DialogWithNpc")
		tbDailog:Show()
	else
		Talk(1,"","门主有令，本门兵器只能卖给同门姐妹.")
	end
end;

function yes()
Sale(66)
end;

function no()
end;
