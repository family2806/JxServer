Include( "\\script\\leaguematch\\head.lua" )

--提供GameServer调用的建立战队函数
function wlls_create(szParam)
	_M("请 wlls_create 输入参数为:"..szParam);
	
	--拆分传入参数
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	n_type = tonumber(aryParam[2])
	n_mtype = tonumber(aryParam[3])
	leaguename = aryParam[4]

	--避免重复加入队员
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "对不起，你已加入其它队，不能建队了!")
		return 0
	end

	--避免战队名重复
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if(not FALSE(n_lid)) then
		wlls_say(rolename, "对不起，该队的名字为[<color=yellow>"..leaguename.."<color>]已使用!")
		return 0
	end
	
	--建立战队
	if(wlls_relay_createleague(leaguename) == 1) then
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_MTYPE, n_mtype)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_STYPE, n_type)
		--添加当前rolename到战队
		if(wlls_relay_addmember(leaguename, rolename) == 1) then
			wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_JOB, 1)
			wlls_say(rolename, "你已建队成功，队名为[<color=yellow>"..leaguename.."<color>].", nil, 1)
			wlls_rest_hint(rolename, 1, n_type)
			return 1
		end
		wlls_say(rolename, "未发现到错误，请联系管理")
	end

	OutputMsg("create league "..leaguename.." error!!!")
	return 0
end

--提供GameServer调用的加入队员函数
function wlls_add(szParam)
	_M("请 wlls_add 输入参数为:"..szParam);

	--拆分传入参数
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	leaguename = aryParam[2]
	cpname = aryParam[3]
	
	--避免重复加入队员
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "对不起，你已加入其它队，不能再加入了!!")
		wlls_say(cpname, "你的队员 <color=yellow>"..rolename.."<color> 已加入其它队，不能再加入了!", 0)
		return 0
	end
	
	--防止超过战队人数上限
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "对不起，该队不存在或者已被解散!")
		wlls_say(cpname, "你的队遇到困难，好像不能再加入队员了!.", 0)
		return 0
	end
	_, _, membercount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (membercount >= n_maxmem) then
		wlls_say(rolename, "对不起，队员已够，不能加入新成员了!!")
		wlls_say(cpname, "你队的成员数已够，不能加入新成员了!!", 0)
		return 0
	end

	--加入战队
	if(wlls_relay_addmember(leaguename, rolename) == 1) then
		wlls_say(rolename, "恭喜你已成功加入队 [<color=yellow>"..leaguename.."<color>]", nil, 1)
		wlls_say(cpname, "<color=yellow>"..rolename.."<color> 已成功加入你的队!", 0)
		wlls_rest_hint(cpname, membercount+1, n_type)
		return 1
	end

	OutputMsg("wlls_add error!", rolename, leaguename)
	return 0
end

--提供GameServer调用的删除队员函数（最终）
function wlls_leave(rolename)
	_M("请 wlls_leave 输入参数为:"..rolename);
	
	--确认已经加入了队伍
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "你没有组队!")
		return 0
	end

	local leaguename, _, membercount = LG_GetLeagueInfo(n_lid)
	local str = "你已离开队 [<color=yellow>"..leaguename.."<color>]."
	local removelg = 0

	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	if (membercount > 1) then
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, leaguename, rolename, WLLS_LGMTASK_JOB)
		if (n_job == 1) then	--队长退出
			for i = 0, LG_GetMemberCount(n_lid)-1 do
				local name = LG_GetMemberInfo(n_lid, i)
				if (name ~= rolename) then
					if (n_type == 3) then	--师徒赛，取消徒弟比赛资格
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_OVER, 1)
					else	--其他比赛，移交队长
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_JOB, 1)
						str = str .. "你的队长身份已转交给队友: <color=yellow>" .. name.."<color>"
						break
					end
				end
			end
			if (n_type == 3) then	--师徒赛，取消徒弟比赛资格
				str = str .. "你的徒弟比赛资格已被删!."
			end
		end
	else
		str = str .. "你的队已解散!"
		removelg = 1
	end
	
	--删除队员
	if(LGM_ApplyRemoveMember(WLLS_LGTYPE, leaguename, rolename, "", "", removelg) == 1) then
		wlls_say(rolename, str, 1, 1)
		return 1
	end

	OutputMsg("wlls_leave error!", rolename, leaguename)
	return 0
end

--建立战队（最终）
function wlls_relay_createleague(leaguename)
	local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
	LG_SetLeagueInfo(nNewLeagueID, WLLS_LGTYPE, leaguename)	--设置社团信息(类型、名称)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end

--加入队员（最终）
function wlls_relay_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
	--设置社团成员的信息(角色名、职位、社团类型、社团名称)
	LGM_SetMemberInfo(nMemberID, rolename, 0, WLLS_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)
	
	if (ret == 1) then	--记录加入战队的赛季
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		--比赛期加入的，视为上一个赛季加入的
		if (GetGblInt(RLGLB_WLLS_PHASE) > 1) then n_sid = n_sid - 1 end
		wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_ADDSID, n_sid)
	end

	return ret
end

--提醒队长还可以加入多少队员
function wlls_rest_hint(n_plname, n_count, n_type)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (n_count < n_maxmem) then
		wlls_say(n_plname, "你的队 [<color=yellow>"..leaguename.."<color>] 目前有<color=yellow>"..n_count.."<color> 成员，你还可以再请<color=yellow>"..(n_maxmem-n_count).."<color> ngi", 1)
	else
		wlls_say(n_plname, "你的队 [<color=yellow>"..leaguename.."<color>] 目前已够 <color=yellow>"..n_maxmem.."<color> 成员.", 1)
	end
end

--向指定角色名的玩家发信息
function wlls_say(rolename, msg, b_msg, b_sync)
	_M("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
	GlobalExecute("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

