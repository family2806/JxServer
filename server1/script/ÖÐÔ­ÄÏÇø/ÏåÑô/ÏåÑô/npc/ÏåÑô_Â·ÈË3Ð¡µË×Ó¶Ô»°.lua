--中原南区 襄阳府 路人3小邓子对话


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
	tbDailog.szTitleMsg = "<#><npc>小邓子：我已经吃了一个礼拜的红薯稀饭，如果能够吃上一顿大米饭，不晓得有几好。"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--弹出对话框
	tbDailog:Show()
end

