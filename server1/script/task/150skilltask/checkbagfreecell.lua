Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

local _TaskDetail = TaskDetailClass:NewFun("CheckBagFreeCell", "Condition")

function _TaskDetail:Exec(tbParam)
	local nCount = tbParam[1]
	local szFailMsg = tbParam[2]
	if CalcFreeItemCellCount() >= nCount then
		return 1
	else
		if szFailMsg == nil then
			szFailMsg = format("������Ҫ <color=yellow>%d<color> �ռ�.", nCount)
		end
		lib:ShowMessage(szFailMsg)
	end
	return
end