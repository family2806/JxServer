Include("\\script\\global\\rename_head.lua")

function ChangeTongNameResult(old_tong, new_tong, result)
	local msg = "<color=red>" .. new_tong .. "<color>"
	if (result == TONGNAMERES_SUCCESS) then
		local value = GetTask(TASKVALUE_BLEND)
		value = SetBit(value, 2, 0)
		SetTask(TASKVALUE_BLEND, value)
		msg = msg .. "<#>�����ɹ��������´�ά������Ч"
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#>��������Ѿ���ʹ����"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#>��������Ѿ���������"
	else
		msg = msg .. "<#>���������Ч������ʹ��"
	end
	Say(msg, 1, "<#>֪����/cancel")
end
