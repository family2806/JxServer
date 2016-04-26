Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("DropItem", "Action")

function _TaskDetail:Exec(tbParam)
	local tbAward = tbParam[1]
	local nNpcIndex = tbParam[2]
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "150级任务出现")
	return 
end