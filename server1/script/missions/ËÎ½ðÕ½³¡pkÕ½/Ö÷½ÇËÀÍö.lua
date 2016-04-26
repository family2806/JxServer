--宋方玩家死亡脚本
Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");
function OnDeath(Launcher)

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;


PlayerIndex1 = NpcIdx2PIdx(Launcher);
OrgPlayer  = PlayerIndex;
DeathName = GetName();

if (PlayerIndex1 > 0) then
	PlayerIndex = PlayerIndex1;
	LaunName = GetName();
	pkcount = GetTask(SJKILLPK) + 1;
	SetTask(SJKILLPK, pkcount);
	SetTask(MS_TOTALPK, GetTask(MS_TOTALPK) + 1);
	str  = "<#>金兵"..LaunName.."<#>重伤了宋军"..DeathName.."<#>，PK人数增为"..pkcount;
	Msg2MSAll(1,str);
	PlayerIndex = OrgPlayer;
end;

V = GetMissionV(MS_S_DEATHCOUNT) + 1;
SetMissionV(MS_S_DEATHCOUNT, V);
SetTask(MS_TOTALKO, GetTask(MS_TOTALKO) + 1);

dataindex = PIdx2MSDIdx(1,PlayerIndex1);
Pan = GetPMParam(1, dataindex, 1);
SetPMParam(1, dataindex, 1, Pan + 1);

if (V == MS_PKCOUNT) then 
	CheckShowKing(1);
end;

end;

