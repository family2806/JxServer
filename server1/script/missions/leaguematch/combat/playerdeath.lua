Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --��������
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("B�n �� ��nh b�i <color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--ǿ�Ƹ�����뿪Mission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--��ʬ���ϵ�������=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>Ch� � !<color> Nh�m c�a b�n kh�ng ph�i l� k�t th�c, h�y ch� ��i h�t gi� s� tr� v� ��u tr��ng. Trong th�i gian n�y, n�u b�n ch�t s� ko nh�n th��ng")
	end
end
