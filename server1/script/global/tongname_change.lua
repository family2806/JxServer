Include("\\script\\global\\rename_head.lua")

function ChangeTongNameResult(old_tong, new_tong, result)
	local msg = "<color=red>" .. new_tong .. "<color>"
	if (result == TONGNAMERES_SUCCESS) then
		local value = GetTask(TASKVALUE_BLEND)
		value = SetBit(value, 2, 0)
		SetTask(TASKVALUE_BLEND, value)
		msg = msg .. "<#>改名成功，将于下次维护后生效"
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#>这个名字已经被使用了"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#>这个名字已经被申请了"
	else
		msg = msg .. "<#>这个名字无效，不能使用"
	end
	Say(msg, 1, "<#>知道了/cancel")
end
