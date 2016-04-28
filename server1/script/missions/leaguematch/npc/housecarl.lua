--�᳡����

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function main()
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local tb_option = wlls_add_option({"R�i kh�i!/wlls_want2leave"}, "Kh�ng c�n")
	Say("C�n "..mm.." ph�t n�a s� b�t ��u, ng��i mu�n r�i kh�i?", getn(tb_option), tb_option)
end

function wlls_want2leave()
	Say("Ng��i ch�c ch�n mu�n r�i kh�i kh�ng ?", 2, "Ta mu�n ra kh�i ��y!/wlls_sure2leave", "Kh�ng c� g�!/OnCancel")
end

function wlls_sure2leave()
	SetLogoutRV(0);		--������������������㲻��ͬһ�ص�
	local n_signmap = wlls_get_mapid(1)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
end
