ROLENAMEQUERY_FREE		= 0		-- 该角色名未被使用
ROLENAMEQUERY_INVALID	= 1		-- 该角色名非法
ROLENAMEQUERY_USED		= 2		-- 该角色名已被使用
                                -- 
ROLENAMECHANGE_SUCCESS	= 0		-- 更名成功
ROLENAMECHANGE_FAILURE	= 1		-- 更名失败
ROLENAMECHANGE_INVALID	= 2		-- 该角色名非法
ROLENAMECHANGE_USED		= 3		-- 该角色名已被使用
ROLENAMECHANGE_ONLINE	= 4		-- 该角色在线

function QueryNameResult(newname, result)
	local msg = "<color=red>" .. newname .. "<color>"
	if (result == ROLENAMEQUERY_FREE) then
		msg = msg .. "这个名字还没有被使用"
	elseif (result == ROLENAMEQUERY_USED) then
		msg = msg .. "这个名字已经被使用了"
	else
		msg = msg .. "这个名字无效，不能使用"
	end
	Talk(1, "", msg)
end

function ChangeNameResult(newname, result)
	local msg = "<color=red>" .. newname .. "<color>"
	if (result == ROLENAMECHANGE_FAILURE) then
		msg = msg .. "这个名字不能使用"
	elseif (result == ROLENAMECHANGE_USED or result == ROLENAMECHANGE_ONLINE) then
		msg = msg .. "这个名字已经被使用了"
	else
		msg = msg .. "这个名字无效，不能使用"
	end
	Talk(1, "", msg)
end
