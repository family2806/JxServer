Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --��������
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("���Ѵ�ܶԷ�<color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--ǿ�Ƹ�����뿪Mission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--��ʬ���ϵ�������=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>ע�� !<color> ���ս������δ��������Ҫ���ر������ȴ��������ʱ���ڣ������ɥ�������뿪�������첻������.")
	end
end
