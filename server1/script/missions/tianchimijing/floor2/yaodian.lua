Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local szTitle = "<#><npc> ��ҩ��?"
	local tbOpt = {}
	tinsert(tbOpt, {"����", yes})
	tinsert(tbOpt, {"������"})
	CreateNewSayEx(szTitle, tbOpt)
end;


function yes()
	Sale(12)
end;

