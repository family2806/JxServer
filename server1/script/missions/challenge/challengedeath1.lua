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
		str  = "<#> 黄方:"..LaunName.."<#>打伤紫方的"..DeathName.."<#>, 现在PK值是"..pkcount;
		Msg2MSAll(MISSIONID,str);
		SetMissionV(MS_J_DEATHCOUNT, GetMissionV(MS_J_DEATHCOUNT) + 1);
		PlayerIndex = OrgPlayer;
	end;
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "比赛结束，黄方取得最终胜利");
		DelMSPlayer(MISSIONID, 2);	
		SetLogoutRV(1);
		CloseMission(MISSIONID);
		return
	end;
	DelMSPlayer(MISSIONID, 2);	
	SetLogoutRV(1);
end;
