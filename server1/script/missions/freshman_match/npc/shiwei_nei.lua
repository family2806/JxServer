Include("\\script\\missions\\freshman_match\\head.lua")
--会场侍卫
RUN_A_TIME = 5
UP_A_TIME = 20
function main()
	local mm = RUN_A_TIME - GetMissionV( 5 )
	if ( mm < 0 ) then
		local mm = UP_A_TIME - GetMissionV( 5 )
		Say("<#> 会场侍卫：本轮比赛还剩"..mm.."<#> 分钟，你还有什么事吗?", 3,"帮助武林新秀联赛/help_freshmanmatch","我想离开这!/out_trap","不需要!/OnCancel")
		return
	end
	Say("<#> 会场侍卫：本轮比赛还剩"..mm.."<#> 分钟后开始，你有什么事吗?", 3,"帮助武林新秀联赛/help_freshmanmatch","我想离开这!/out_trap","不需要!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#> 会场侍卫: 现在离开需要等到， 你确定想离开吗? ", 2, "我想离开!/sure_trap", "不需要!/OnCancel")
		return
	end
	Say("会场侍卫: 比赛即将开始, 你确定想离开吗?", 2, "我想离开!/sure_trap", "不需要!/OnCancel")
end;

function sure_trap()
	if ( nt_gettask( CP_TASKID_ENEMY ) > 0 ) then
		return
	end
	WL_clear_pl_state()
	tryout_mapid = SubWorldIdx2ID( SubWorld )
	Msg2Player( "你已离开武林新秀联赛区域!" )
	DelMSPlayer( MISSIONID_OUTER, PlayerIndex, 1 )
	SetLogoutRV(0);
	NewWorld( tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2] )
end
