Include("\\script\\lib\\common.lua")
Include("\\script\\gb_taskfuncs.lua")

TONGWAR_LGTYPE = 10

--战队成员Task
TONGWAR_LGMTASK_JOB = 1		--队长为1；队员为0

--战队公用Task
TONGWAR_LGTASK_TONGCNT = 1	--共联盟数
TONGWAR_LGTASK_WIN = 2			--胜利次数
TONGWAR_LGTASK_LOSE = 3			--失败次数
TONGWAR_LGTASK_TIE = 4			--平局次数
TONGWAR_LGTASK_RESULT = 5		--比赛总积分
TONGWAR_LGTASK_POINT = 6		--每场净积分累加
TONGWAR_LGTASK_CITYID = 7		--该城市id
TONGWAR_LGTASK_CAMP = 8			--该场比赛阵营
TONGWAR_LGTASK_MAP = 9			--该城比赛比赛地图
TONGWAR_LGTASK_RANK = 10		--比赛最终排名
TONGWAR_LGTASK_TITLE = 15		--帮会联盟是否领取了光环
TONGWAR_LGTASK_TONGID = 16		--城主帮会ID
TONGWAR_LGTASK_SEASON = 17		--赛季

--角色Task
TONGWAR_RLTASK_POINT = 1323

TONGWAR_CITY = {"凤翔","成都","大理","汴京","襄阳","扬州","临安",}

LOGFILE = "relay_log\\tongwar"		--日志路径

function tongwar_add(szParam)
	--拆分传入参数
	local aryParam = split(szParam, " ")
	tongname = GetTongNameByID(tonumber(aryParam[1]))
	if (FALSE(tongname)) then
		_msg("tongname id "..aryParam[1].." error!!!!")
		return
	end
	local rolename = aryParam[2]
	local leaguename = TONGWAR_CITY[tonumber(aryParam[3])]
	local cpname = aryParam[4]
	local mytongid = tonumber(aryParam[5]);
	if (mytongid == 0) then
		OutputMsg("cityowner tongid error!!!!");
		return 0;
	end;
	
	local n_lid = LG_GetLeagueObj(TONGWAR_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		_msg("false leaguename"..leaguename)
		return 0
	end
	
	if (LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_TONGID) == 0) then
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, leaguename, TONGWAR_LGTASK_TONGID, mytongid);
	end;
	
	--避免重复加入队员
	if (not FALSE(LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname))) then
		tongwar_say(rolename, "你已加入帮会联盟，不能再加入了")
		local strInfo = format("Bang <color=yellow>%s<color> ... <color=yellow>%s<color> 已加入联盟，不能再加入了", rolename, tongname)
		tongwar_say(cpname, strInfo, 0)
		return 0
	end

	local szlogfile = LOGFILE..date("%y%m").."\\tongwar.log"
	--加入战队
	if(tongwar_addmember(leaguename, tongname) == 1) then
		local strInfo = format("恭喜你已成功加入帮会联盟[<color=yellow>%s<color>].", leaguename)
		tongwar_say(rolename, strInfo, nil, 1)
		
		strInfo = format("<color=yellow>%s<color> 已成功加入你的帮会联盟", tongname)
		tongwar_say(cpname, strInfo, 0)
		
		strInfo = format("帮主 [%s] 是[%s] 已加入帮会 [%s] do [%s] 作为帮主", tongname, rolename, cpname, leaguename)
		WriteStringToFile(szlogfile, strInfo.."\n")
		return 1
	end

	return 0
end

--加入队员（最终）
function tongwar_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- 生成社团成员数据对象(返回对象ID)
	--设置社团成员的信息(角色名、职位、社团类型、社团名称)
	LGM_SetMemberInfo(nMemberID, rolename, 0, TONGWAR_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)

	return ret
end

--向指定角色名的玩家发信息
function tongwar_say(rolename, msg, b_msg, b_sync)
	GlobalExecute("dw tongwar_gw_say([["..safestr(rolename).."]], [["..safestr(msg).."]], "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

function _msg(...)
	local str = "+++DEBUG["..date("%H:%M:%S").."]: "..join(arg)
	OutputMsg(str)
end



function tongwar_redo_start(szParam)
OutputMsg(szParam.."补充场 - 武林第一帮")
	local aryParam = split(szParam, " ")
	if (aryParam == nil or getn(aryParam) ~= 9) then
		OutputMsg("error!! tongwar_redo_start the Param error!")
		return
	end
	for i = 1, getn(aryParam) do
		aryParam[i] = tonumber(aryParam[i])
	end
		OutputMsg(format("dw tongwar_start(%d, %d, %d, %d, %d, %d, %d, %d, %d)", aryParam[1], aryParam[2], aryParam[3], aryParam[4], aryParam[5], aryParam[6], aryParam[7], aryParam[8], aryParam[9]))
		GlobalExecute(format("dw tongwar_start(%d, %d, %d, %d, %d, %d, %d, %d, %d)", aryParam[1], aryParam[2], aryParam[3], aryParam[4], aryParam[5], aryParam[6], aryParam[7], aryParam[8], aryParam[9]))
end

--如果为nil或0，返回1，否则返回0
function FALSE(value)
	if (value == 0 or value == nil or value == "") then
		return 1
	else
		return nil
	end
end

