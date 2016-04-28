--½ğ±øËÀÍö
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

nCount = GetMissionV(MS_J_NPCDEATH) + 1;
SetMissionV(MS_J_NPCDEATH, nCount);

if (nCount == MS_SHOWKINGCOUNT) then
	CheckShowKing(2);
end;

end;