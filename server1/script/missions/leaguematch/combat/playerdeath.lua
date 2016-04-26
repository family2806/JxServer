Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --死者名字
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("你已打败对方<color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--强制该玩家离开Mission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--将尸体拖到报名场=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>注意 !<color> 你的战斗队伍未结束，你要返回报名处等待。在这个时间内，如果你丧命或者离开赛场将领不到奖励.")
	end
end
