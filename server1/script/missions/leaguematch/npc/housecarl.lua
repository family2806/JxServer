--»á³¡ÊÌÎÀ

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function main()
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local tb_option = wlls_add_option({"Rêi khái!/wlls_want2leave"}, "Kh«ng cÇn")
	Say("Cßn "..mm.." phót n÷a sÏ b¾t ®Çu, ng­¬i muèn rêi khái?", getn(tb_option), tb_option)
end

function wlls_want2leave()
	Say("Ng­¬i ch¾c ch¾n muèn rêi khái kh«ng ?", 2, "Ta muèn ra khái ®©y!/wlls_sure2leave", "Kh«ng cã g×!/OnCancel")
end

function wlls_sure2leave()
	SetLogoutRV(0);		--ËÀÍöÖØÉúÓë¶ÏÏßÖØÉúµã²»ÔÚÍ¬Ò»µØµã
	local n_signmap = wlls_get_mapid(1)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
end
