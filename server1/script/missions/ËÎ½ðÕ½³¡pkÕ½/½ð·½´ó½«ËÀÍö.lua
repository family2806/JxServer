Include("\\script\\missions\\ËÎ½ðÕ½³¡PKÕ½\\ËÎ½ðÕ½³¡Í·ÎÄ¼þ.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

--if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then

if (GetMissionV(5) >= (MAX_S_COUNT / 2) and GetMissionV(6) >= (MAX_J_COUNT / 2)) then

	if (random(100) > 70) then
	return
	end;

	AddEventItem(195);
	Msg2Player("B¹n nhËn ®­îc Nh¹c V­¬ng KiÕm!");
end;


str1 = "<#>KÕt qu¶ phe Kim: binh sÜ "..GetName().."<#> tiªu diÖt t­íng phe Kim, phe Tèng giµnh chiÕn th¾ng!";
str = "<#>Chóc mõng ["..GetName().."<#>] ®· tiªu diÖt phe Kim, gióp chóng ta th¾ng tr¹n nµy!";
Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 1);
resultstr = WinBonus(1,2);
str1 = str1..resultstr;
SetMissionV(2,2);
SetMissionV(1,3);
AddGlobalCountNews(str1 , 3);
CloseMission(1);
end;