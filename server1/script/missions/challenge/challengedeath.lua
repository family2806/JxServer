--�η���������ű�
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
		str  = "<#> �Ϸ�:"..LaunName.."<#>���˻Ʒ���"..DeathName.."<#>, ����PKֵ��"..pkcount;
		SetMissionV(MS_S_DEATHCOUNT, GetMissionV(MS_S_DEATHCOUNT) + 1);
		Msg2MSAll(MISSIONID,str);
		PlayerIndex = OrgPlayer;
	end;
	
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "�����������Ϸ�ȡ������ʤ��");
		DelMSPlayer(MISSIONID, 1);
		CloseMission(MISSIONID);
		return
	end;
	
	DelMSPlayer(MISSIONID, 1);
	SetLogoutRV(1);
end;
