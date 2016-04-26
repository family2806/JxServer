-------------------------------------------------------------------------
-- FileName		:	rename_func.lua
-- Author		:	lailigao
-- CreateTime	:	2006-07-02 16:38:37
-- Desc			:	在线改名功能
-- Include("\\script\\misc\\rename\\rename_func.lua")
---------------------------------------------------------------------------

Include("\\script\\global\\rename_head.lua")

-- 重名玩家更改角色名对话
function func_online_rename_role(strInfo, strError)
	if (check_renamerole() == 1) then
		Say(strInfo,
			3,
			"<#> 了解还能使用的人物名字/query_rolename",
			"<#> 更改自己的人物名称/change_rolename",
			"<#> 下次我改/cancel");
	else
		deny(strError)
	end
end

-- 查询角色名
function query_rolename()
	AskClientForString("on_query_rolename", "", 1, 20, "<#> 请输入需要了解的");
end

function on_query_rolename(new_name)
	QueryRoleName(new_name);
end

-- 重名玩家更改角色名
function change_rolename()
	Say("<#> 具体步骤：离开帮会，与NPC对话，输入需要更改的人物名字，你将自动离线。3分钟后再登陆，如果人物名字已改，就算是改名成功；如果没更改，请你执行以上步骤。如果出现一些奇怪现象，请联系GM解决.",
		2,
		"<#> 开始更名/change_rolename2",
		"<#> 让我想想/cancel")
end

function change_rolename2()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Player(" <color=green>大侠已有帮会，不能进行该操作!<color>")
		return
	end
	AskClientForString("on_change_rolename", "", 1, 20, "<#> 请输入新的名字");
end

function on_change_rolename(new_name)
	if (check_renamerole() == 1) then
		if (GetName() == new_name) then
			Talk(1, "", "<#> 想改什么名字?")
		else
			RenameRole(new_name);
		end
	end
end

-- 重名帮会更改帮会名
function online_rename_tong(strInfo, strError)
	if (check_renametong() == 1) then
		Say(strInfo,
			3,
			"<#> 检查还能使用的帮会名?/query_tongname",
			"<#> 改变自己的帮会名/change_tongname",
			"<#> 下次我改/cancel")
	else
		deny(strError)
	end
end

-- 查询帮会名
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> 请输入想了解的帮会名");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- 更改帮会名
function change_tongname()
	Say("<#> 具体步骤：离开帮会，与NPC对话，输入需要更改的人物名字，你将自动离线。3分钟后再登陆，如果人物名字已改，就算是改名成功；如果没更改，请你执行以上步骤。如果出现一些奇怪现象，请联系GM解决.",
		2,
		"<#> 开始更名/change_tongname2",
		"<#> 让我想想/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> 请输入新的帮会名");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> 只有帮主才能改帮会名")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> 不能改相同的帮会名", 1, "<#> 知道了!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny(strError)
	Say(strError,
		1,
		"<#> 知道了!/cancel")
end
