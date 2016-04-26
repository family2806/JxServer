--宋方玩家死亡脚本
Include("\\script\\missions\\challenge\\challengehead.lua");

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
	return
	end;
	
	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();
		pkcount = GetTaskTemp(SJKILLPK) + 1;
		SetTaskTemp(SJKILLPK, pkcount);
		str  = "<#> 紫方:"..LaunName.."<#>打伤黄方的"..DeathName.."<#>, 现在PK值是"..pkcount;
		SetMissionV(MS_S_DEATHCOUNT, GetMissionV(MS_S_DEATHCOUNT) + 1);
		Msg2MSAll(MISSIONID,str);
		PlayerIndex = OrgPlayer;
	end;
	
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "比赛结束，紫方取得最终胜利");
		DelMSPlayer(MISSIONID, 1);
		CloseMission(MISSIONID);
		return
	end;
	
	DelMSPlayer(MISSIONID, 1);
	SetLogoutRV(1);
end;
