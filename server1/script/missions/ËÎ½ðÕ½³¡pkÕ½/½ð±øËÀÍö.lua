--金兵死亡
Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");
function OnDeath(Launcher)


State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

npccount = GetTask(SJKILLNPC) + 1;
SetTask(SJKILLNPC, npccount);
str1 = "<#>你目前共杀敌Npc数量增为"..npccount;
Msg2Player(str1);

nCount = GetMissionV(MS_J_NPCDEATH) + 1;
SetMissionV(MS_J_NPCDEATH, nCount);

if (nCount == MS_SHOWKINGCOUNT) then
	CheckShowKing(2);
end;

end;