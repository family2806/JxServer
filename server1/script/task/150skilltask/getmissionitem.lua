Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _TaskDetail = TaskDetailClass:NewFun("GetMissionItem", "Action")

function _TaskDetail:Exec(tbParam)
	local tbAward = tbParam[1]
	tbAwardTemplet:GiveAwardByList(tbAward, "150级技能对话任务领到道具")
	return 1
end