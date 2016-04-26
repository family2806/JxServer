Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local szTitle = "<#><npc> 买药吗?"
	local tbOpt = {}
	tinsert(tbOpt, {"交易", yes})
	tinsert(tbOpt, {"不交易"})
	CreateNewSayEx(szTitle, tbOpt)
end;


function yes()
	Sale(12)
end;

