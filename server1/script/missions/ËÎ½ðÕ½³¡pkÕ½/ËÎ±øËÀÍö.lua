--ËÎ±øNpcËÀÍö½Å±¾
Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");
function OnDeath(Launcher)

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

npccount = GetTask(SJKILLNPC) + 1;
SetTask(SJKILLNPC, npccount);
str1 = "<#>Tæng sè Npc ®· tiªu diÖt t¨ng lªn "..npccount;
Msg2Player(str1);

nCount = GetMissionV(MS_S_NPCDEATH) + 1;
SetMissionV(MS_S_NPCDEATH, nCount);

if (nCount == MS_SHOWKINGCOUNT) then
	CheckShowKing(1);
end;


end;

