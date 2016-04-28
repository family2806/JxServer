Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --ËÀÕßÃû×Ö
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("B¹n ®· ®¸nh b¹i <color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--Ç¿ÖÆ¸ÃÍæ¼ÒÀë¿ªMission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--½«Ê¬ÌåÍÏµ½±¨Ãû³¡=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>Chó ı !<color> Nhãm cña b¹n kh«ng ph¶i lµ kÕt thóc, h·y chê ®îi hÕt giê sÏ trë vÒ ®Êu tr­êng. Trong thêi gian nµy, nÕu b¹n chÕt sÏ ko nhËn th­ëng")
	end
end
