Include("\\script\\global\\rename_head.lua")

function ChangeTongNameResult(old_tong, new_tong, result)
	local msg = "<color=red>" .. new_tong .. "<color>"
	if (result == TONGNAMERES_SUCCESS) then
		local value = GetTask(TASKVALUE_BLEND)
		value = SetBit(value, 2, 0)
		SetTask(TASKVALUE_BLEND, value)
		msg = msg .. "<> ®æi tªn thµnh c«ng , ®em víi lÇn sau duy tr× hËu sinh hiÖu "
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<> danh tù nµy ®· bÞ sö dông "
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<> danh tù nµy ®· bÞ th©n thØnh "
	else
		msg = msg .. "<> danh tù nµy kh«ng cã hiÖu qu¶ , kh«ng thÓ sö dông "
	end
	Say(msg, 1, "<> biÕt /cancel")
end
