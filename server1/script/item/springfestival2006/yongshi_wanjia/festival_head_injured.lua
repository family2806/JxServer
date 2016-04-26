Include([[\script\missions\tong\tong_springfestival\head.lua]]);

function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)
	if NpcIdx2PIdx(nTargetNpcIndex) <= 0 then
		return 
	end
	PlayerIndex = NpcIdx2PIdx(nTargetNpcIndex)
	
    local nOldPlayer = PlayerIndex;
    
    local nAttackTimes = GetTask(TK_ATTACKED_TIMES) + 1;
    
    local idx = nLauncherNpcIndex;
    local nHurtPlayer = NpcIdx2PIdx(idx);
    
    PlayerIndex = nHurtPlayer;
    
    if (GetTask(TK_GROUPID) <= SF_SMALLMAPCOUNT) then
        SetTask(SF_COUNT_ONETIME, GetTask(SF_COUNT_ONETIME) + 1);
        Msg2Player("你成功击中了"..SF_ANIMALNAME..GetTask(SF_COUNT_ONETIME).."次!");
    end;
    
    PlayerIndex = nOldPlayer;
    if (nAttackTimes >= 20) then
        festival_go_other_place();
        AddSkillState(673, 20, 0, 20 * 18);
        AddSkillState(309, 10, 0, 20 * 18); --不受攻击
        Msg2Player(sz_ANIMALNAME.."每被攻击了20次就会<color=yellow>眩晕20秒<color>!");
        nAttackTimes = 0;
    end;
    SetTask(TK_ATTACKED_TIMES, nAttackTimes);
    AddSkillState(674, 15, 0, 5 * 18);
end;