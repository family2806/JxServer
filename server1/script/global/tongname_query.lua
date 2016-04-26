Include("\\script\\global\\rename_head.lua")

function QueryTongNameResult(tong, result)
	local msg = "<color=red>" .. tong .. "<color>"
	if (result == TONGNAMERES_FREE) then
		msg = msg .. "<#>这个名字还没有被使用"
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#>这个名字已经被使用了"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#>这个名字已经被申请了"
	else
		msg = msg .. "<#>这个名字无效，不能使用"
	end
	Say(msg, 1, "<#>知道了/cancel")
end
