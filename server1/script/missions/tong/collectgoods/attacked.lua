Include([[\script\missions\tong\collectgoods\head.lua]]);

function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)
	if NpcIdx2PIdx(nTargetNpcIndex) <= 0 then
		return 
	end
	PlayerIndex = NpcIdx2PIdx(nTargetNpcIndex)
	
	local nOldSubWorld = SubWorld;
	local nOldPlayer = PlayerIndex;
	local nAttackTimes = GetTask(TK_ATTACKED_TIMES) + 1;
	
	local idx = nLauncherNpcIndex;
	local nLauncher = NpcIdx2PIdx(idx);
	
	PlayerIndex = nLauncher;
	local IsBomber = GetTask(COLLG_TK_BOMB_MARK);
	if (IsBomber ~= -1)then
		return
	end;
	local szName = GetName();
	collg_settonormal();
	
	PlayerIndex = nOldPlayer;
	SubWorld = nOldSubWorld;
	collg_settobomber();
	local nReMain = floor(GetMSRestTime(COLLG_MISSIONID, COLLG_RUNTIMERID) / 18);
	Msg2Player("爆炸效果延长<color=yellow>"..nReMain.."<color> 分钟，请快点扔给他人");
	Msg2MSGroup(COLLG_MISSIONID, "炮仗由 <color=yellow>"..szName.."<color> 扔进<color=yellow>"..GetName().."<color>, v?<color=yellow>"..nReMain.."<color> 3 分钟，大家要留意", GetTask(TK_GROUPID));
end;