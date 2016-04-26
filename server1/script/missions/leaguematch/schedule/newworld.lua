Include( "\\script\\missions\\leaguematch\\head.lua" )
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	local n_mapid = wlls_get_mapid(1)
	if (not n_mapid) then
		wlls_error_log("进错了准备区域")
		wlls_transback()
		return
	end
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 4) then	--时间已过
		Say("对不起，你来迟了，刚开始比赛，要不我带你回去", 0)
		NewWorld(n_mapid, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
		return
	end
	
	wlls_set_pl_state()	--设置玩家状态
	SetCurCamp(1)	--改变当前阵营
	
	--分配阵营号
	local n_mscamp, str_lgname = wlls_findfriend(WLLS_MSID_SCHEDULE, GetName())
	if (n_mscamp) then
		_M("join in "..n_mscamp)
	else
		for i = 1, WLLS_MAX_COUNT do
			if (GetMSPlayerCount(WLLS_MSID_SCHEDULE, i) == 0) then
				n_mscamp = i
				break
			end
		end
		if (n_mscamp <= 0) then	--异常：没有空的阵营可以进入
			wlls_error_log("OnNewWorld", "no free mscamp!")
			return
		end
		_M("new in "..n_mscamp)
	end
	AddMSPlayer(WLLS_MSID_SCHEDULE, n_mscamp)	--加入Mission
	LG_ApplySetLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_MSCAMP, n_mscamp)
	
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local str_des = wlls_get_desc(3)
	Msg2Player("你已进入"..str_des.." 准备，比赛在<color=yellow>"..mm.."<color>分钟后开始")
	Msg2MSAll(WLLS_MSID_SCHEDULE, "<color=yellow>战队["..str_lgname.."] "..GetName().."已进入"..str_des.."准备区域")
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 5) then	--比赛没有开始（应该是准备时间）
		local n_mtype, n_group = wlls_get_mapinfo()
		local szResult = n_mtype.." "..n_group.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_onleave", szResult , "", "")
	end
	wlls_clear_pl_state()
	OnLeaveWorldDefault(szParam)
end
