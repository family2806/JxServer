Include("\\script\\global\\rename_head.lua")

function QueryTongNameResult(tong, result)
	local msg = "<color=red>" .. tong .. "<color>"
	if (result == TONGNAMERES_FREE) then
		msg = msg .. "<#>������ֻ�û�б�ʹ��"
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#>��������Ѿ���ʹ����"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#>��������Ѿ���������"
	else
		msg = msg .. "<#>���������Ч������ʹ��"
	end
	Say(msg, 1, "<#>֪����/cancel")
end
