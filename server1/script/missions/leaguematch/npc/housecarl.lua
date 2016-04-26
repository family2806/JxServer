--会场侍卫

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function main()
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local tb_option = wlls_add_option({"让我准备先!/wlls_want2leave"}, "继续联赛")
	Say("会场侍卫：开始联赛时间还剩"..mm.."分钟，你准备好了吗?", getn(tb_option), tb_option)
end

function wlls_want2leave()
	Say("会场侍卫：你一定想离开？准备联赛了，不要错过联赛时间!", 2, "我想离开这里!/wlls_sure2leave", "我想留在这里联赛!/OnCancel")
end

function wlls_sure2leave()
	SetLogoutRV(0);		--死亡重生与断线重生点不在同一地点
	local n_signmap = wlls_get_mapid(1)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
end
