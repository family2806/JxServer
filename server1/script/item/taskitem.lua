Include("\\script\\task\\150skilltask\\g_task.lua")

local _MakeItem = function (...)
	return {tbProp = arg}
end

function main(nItemIndex)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local tbItem = %_MakeItem(GetItemProp(nItemIndex))
	G_TASK:OnMessage("�¸赺", tbItem, "UseItem")
	G_TASK:OnMessage("����", tbItem, "UseItem")
	return 1
end

function PickUp(nItemIndex, nPlayerIndex)
	local tbItem = %_MakeItem(GetItemProp(nItemIndex))
	G_TASK:OnMessage("����", tbItem, "PickUp")
	return 1
end